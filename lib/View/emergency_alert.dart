import 'dart:io';
import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:cloud_functions/cloud_functions.dart';
import '../Controller/emergency_alert.dart';
import '../Model/emergency_alert.dart';

class EmergencyScreen extends StatefulWidget {
  final String userEmail;

  EmergencyScreen({Key? key, required this.userEmail}) : super(key: key);

  @override
  _EmergencyScreenState createState() => _EmergencyScreenState();
}

class _EmergencyScreenState extends State<EmergencyScreen> {
  late CameraController _cameraController;
  late Future<void> _initializeControllerFuture;
  XFile? _imageFile;
  final TextEditingController _messageController = TextEditingController();
  final EmergencyController _emergencyController = EmergencyController();
  String _type = 'Fire';
  String _userName = ""; // User's name
  String _userAddress = ""; // User's address

  @override
  void initState() {
    super.initState();
    initializeCamera();
    _getUserInformation();
  }

  Future<void> _getUserInformation() async {
    try {
      final HttpsCallableResult result = await FirebaseFunctions.instance.httpsCallable('retrieveUserInfo').call({
        'userEmail': widget.userEmail,
      });

      final userData = result.data as Map<String, dynamic>;
      setState(() {
        _userName = userData['name'] ?? "";
        _userAddress = userData['address'] ?? "";
      });
    } catch (e, stackTrace) {
      print("Error retrieving user information: $e");
      print("Stack Trace: $stackTrace");
    }
  }

  Future<void> initializeCamera() async {
    final cameras = await availableCameras();
    final firstCamera = cameras.first;

    _cameraController = CameraController(
      firstCamera,
      ResolutionPreset.medium,
    );

    _initializeControllerFuture = _cameraController.initialize();
  }

  @override
  void dispose() {
    _cameraController.dispose();
    _messageController.dispose();
    super.dispose();
  }

  Future<String?> uploadImage(XFile? image) async {
    if (image == null) return null;
    try {
      final ref = FirebaseStorage.instance.ref().child('emergency_images').child('${DateTime.now()}.png');
      await ref.putFile(File(image.path));
      return await ref.getDownloadURL();
    } catch (e) {
      print('Error uploading image: $e');
      return null;
    }
  }

  Future<void> handleSendAlert() async {
    if (widget.userEmail.isNotEmpty) {
      String? imageUrl = await uploadImage(_imageFile);
      var alert = EmergencyAlert(
        type: _type,
        message: _messageController.text,
        imageUrl: imageUrl, // Set image URL here
        timestamp: DateTime.now(),
        userEmail: widget.userEmail,
        userName: _userName,
        userAddress: _userAddress,
      );
      await _emergencyController.sendEmergencyAlert(alert);
    } else {
      print("User email not available");
    }
  }

  Future<void> pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.camera);
    if (pickedFile != null) {
      setState(() {
        _imageFile = pickedFile;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Emergency Alert'),
          backgroundColor: Color(0xffe4d7ba),
          titleTextStyle: TextStyle(color: Colors.black, fontSize: 22.0, fontWeight: FontWeight.bold),
          iconTheme: IconThemeData(
            color: Colors.black,
          ),),
        body: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  DropdownButtonFormField<String>(
                    value: _type,
                    onChanged: (newValue) => setState(() => _type = newValue!),
                    items: <String>['Fire', 'Natural Disaster', 'Others']
                        .map<DropdownMenuItem<String>>(
                          (String value) => DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      ),
                    ).toList(),
                    decoration: InputDecoration(
                      labelText: 'Type of Emergency',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(height: 20),
                  TextField(
                    controller: _messageController,
                    maxLines: 3,
                    decoration: InputDecoration(
                      labelText: 'Message',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(height: 20),
                  _imageFile != null
                      ? Image.file(File(_imageFile!.path))
                      : ElevatedButton(
                    onPressed: pickImage,
                    style: ElevatedButton.styleFrom(
                      primary: Color(0xfff1e2bd), // Background color
                      onPrimary: Colors.white, // Text color
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      elevation: 5.0, // Add some elevation for a subtle shadow
                      minimumSize: Size(double.infinity, 50), // Set minimum width and height
                    ),
                    child: Text(
                      'Take Picture',
                      style: TextStyle(fontSize: 18.0),
                    ),
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: handleSendAlert,
                    style: ElevatedButton.styleFrom(
                      primary: Colors.red, // Background color
                      onPrimary: Colors.white, // Text color
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      elevation: 5.0, // Add some elevation for a subtle shadow
                      minimumSize: Size(double.infinity, 50), // Set minimum width and height
                    ),
                    child: Text(
                      'Send Alert',
                      style: TextStyle(fontSize: 18.0),
                    ),
                  ),

                ],
              ),
            ),
            ),
        );
    }
}























class EmergencyAlertsListView extends StatefulWidget {
  @override
  _EmergencyAlertsListViewState createState() => _EmergencyAlertsListViewState();
}

class _EmergencyAlertsListViewState extends State<EmergencyAlertsListView> {
  final EmergencyController _controller = EmergencyController();
  late List<EmergencyAlert1> _emergencyAlerts = []; // Initialize as an empty list

  @override
  void initState() {
    super.initState();
    _fetchEmergencyAlerts();
  }

  _fetchEmergencyAlerts() async {
    List<EmergencyAlert1> alerts = await _controller.getAllEmergencyAlerts();
    setState(() {
      _emergencyAlerts = alerts;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Emergency Alerts'),
        backgroundColor: Color(0xffe4d7ba),
        titleTextStyle: TextStyle(color: Colors.black, fontSize: 22.0, fontWeight: FontWeight.bold),
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
      ),
      body: _emergencyAlerts.isNotEmpty // Check if the list is not empty
          ? ListView.builder(
        itemCount: _emergencyAlerts.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              title: Text(_emergencyAlerts[index].type, style: TextStyle(fontWeight: FontWeight.bold),),
              subtitle: Text(_emergencyAlerts[index].message),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => EmergencyAlertDetailsView(alert: _emergencyAlerts[index]),
                  ),
                );
              },
            ),
          );
        },
      )
          : Center(child: CircularProgressIndicator()), // Show a loading indicator if the list is empty
    );
  }
}

class EmergencyAlertDetailsView extends StatelessWidget {
  final EmergencyAlert1 alert;

  EmergencyAlertDetailsView({required this.alert});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(alert.type),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Message: ${alert.message}'),
            SizedBox(height: 10),
            if (alert.imageUrl != null)
              Image.network(
                alert.imageUrl!,
                width: double.infinity,
                height: 200,
                fit: BoxFit.cover,
              ),
            SizedBox(height: 10),
            Text('Timestamp: ${alert.timestamp.toString()}'),
            Text('User Email: ${alert.userEmail}'),
            Text('User Name: ${alert.userName}'),
            Text('User Address: ${alert.userAddress}'),
          ],
        ),
      ),
    );
  }
}
