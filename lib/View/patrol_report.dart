import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import '../Controller/patrol_report.dart';
import '../Model/patrol_report.dart';
import 'package:path/path.dart' show join;
import 'package:path_provider/path_provider.dart';
import 'package:flutter/services.dart';


class PatrolReportScreen extends StatefulWidget {
  final String? userEmail;

  PatrolReportScreen({Key? key, required this.userEmail}) : super(key: key);

  @override
  _PatrolReportScreenState createState() => _PatrolReportScreenState();
}

class _PatrolReportScreenState extends State<PatrolReportScreen> {
  final PatrolReportController _controller = PatrolReportController();
  CameraController? cameraController;
  Future<void>? initializeControllerFuture;
  String guardName = '';
  String _message = '';
  Uint8List? _imageBytes;
  final TextEditingController _messageController = TextEditingController();

  @override
  void initState() {
    super.initState();
    initializeCamera();
    _fetchGuardName();
  }

  Future<void> initializeCamera() async {
    final cameras = await availableCameras();
    final firstCamera = cameras.first;

    cameraController = CameraController(
      firstCamera,
      ResolutionPreset.medium,
    );
    try {
      await cameraController?.initialize();
      setState(() {}); // Update the state to refresh the widget tree
    } catch (e) {
      print('Error initializing camera: $e');
    }
  }

  Future<void> _showSubmitSuccessDialog() async {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Success'),
          content: Text('Report has been successfully submitted!'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }


  void _fetchGuardName() async {
    String roleName = 'Guard';
    if (roleName == 'Guard') {
      guardName = (await _controller.fetchGuardName()) ?? '';
    }
  }

  @override
  void dispose() {
    cameraController?.dispose();
    _messageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Patrol Report'),
        backgroundColor: Color(0xffe4d7ba),
        titleTextStyle: TextStyle(color: Colors.black, fontSize: 22.0,
          fontWeight: FontWeight.bold,),
        iconTheme: IconThemeData(
          color: Colors.black, // Setting the back button color to black
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(height: 20),
              Text(
                'Submit Your Patrol Report',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),
              TextField(
                controller: _messageController,
                maxLines: 3,
                decoration: InputDecoration(
                  labelText: 'Message',
                  border: OutlineInputBorder(),
                ),
                onChanged: (value) => _message = value,
              ),
              SizedBox(height: 20),
              SizedBox(
                height: 300,
                width: 300,
             //  child: CameraPreview(cameraController!),
                child: cameraController != null
                    ? CameraPreview(cameraController!)
                    : Container(),
               // ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () async {
                  try {
                    //await initializeControllerFuture;
                    final picture = await cameraController!.takePicture();
                    setState(() {
                      _imageBytes = File(picture.path).readAsBytesSync();
                    });
                  } catch (e) {
                    print('Error taking picture: $e');
                  }
                },
                style: ElevatedButton.styleFrom(
                  primary: Color(0xffe4d7ba),  // Set the background color here
                  onPrimary: Colors.black87,  // Text color
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),  // Padding around the button content
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),  // Rounded corners for the button
                  ),
                ),
                child: Text('Capture Image'),
              ),

              SizedBox(height: 20),
              if (_imageBytes != null)
                Image.memory(
                  Uint8List.fromList(_imageBytes!),
                  height: 300,
                  width: 300,
                  fit: BoxFit.cover,
                ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () async {
                  var report = PatrolReport(
                    GuardName: guardName,
                    message: _message,
                    imageBytes: _imageBytes,
                    timestamp: DateTime.now(),
                  );
                  await _controller.sendPatrolReport(report);
                  _showSubmitSuccessDialog();
                  // Show a success dialog or navigate to another screen as needed.
                },
                style: ElevatedButton.styleFrom(
                  primary: Color(0xffe4d7ba),  // Set the background color here to green
                  onPrimary: Colors.black87,  // Text color
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),  // Padding around the button content
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),  // Rounded corners for the button
                  ),
                ),
                child: Text('Submit Report'),
              ),

            ],
          ),
        ),
      ),
    );
  }
}


//detail when tap on the list
class DetailScreen extends StatelessWidget {
  final PatrolReport report;

  DetailScreen({required this.report});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Patrol Report Details'),
        backgroundColor: Color(0xffe4d7ba),
        titleTextStyle: TextStyle(color: Colors.black, fontSize: 22.0,
          fontWeight: FontWeight.bold,),
        iconTheme: IconThemeData(
          color: Colors.black, // Setting the back button color to black
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Card(
          elevation: 3.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20,),
              if (report.imageBytes != null)
                Center(
                  child: ClipRRect(
                    borderRadius: BorderRadius.vertical(top: Radius.circular(15.0),bottom: Radius.circular(15.0)),
                    child: Image.memory(
                      report.imageBytes!,
                      height: 300,  // Adjust the height as per your requirement
                      width: 300,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Divider(),
                    _buildDetailRow('Guard Name', report.GuardName ?? 'Guard Name not available'),
                    Divider(),
                    _buildDetailRow('Date & Time', report.timestamp?.toString() ?? 'No timestamp'),
                    Divider(),
                    _buildDetailRow('Message', report.message ?? 'No message'),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDetailRow(String title, String content) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18.0,
            ),
          ),
          SizedBox(height: 8.0),
          Text(
            content,
            style: TextStyle(fontSize: 16.0),
          ),
        ],
      ),
    );
  }
}


// display patrol report list for admin to see

/*
class PatrolReportView extends StatelessWidget {
  final PatrolReportController _patrolReportController = PatrolReportController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Patrol Reports'),
        backgroundColor: Color(0xffe4d7ba),
        titleTextStyle: TextStyle(color: Colors.black, fontSize: 22.0,
          fontWeight: FontWeight.bold,),
        iconTheme: IconThemeData(
          color: Colors.black, // Setting the back button color to black
        ),
      ),
      body: StreamBuilder<List<PatrolReport>>(
        stream: _patrolReportController.getPatrolReports(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(
              child: Text('No patrol reports available.'),
            );
          }

          return ListView.builder(
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) {
              PatrolReport report = snapshot.data![index];
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                child: Card(
                  elevation: 3.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  child: ListTile(
                    title: Text(
                      report.timestamp?.toString() ?? 'No Date Available',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text('Guard Name: ${report.GuardName ?? 'Guard Name not available'}'),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DetailScreen(report: report),
                        ),
                      );
                    },
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
*/


class PatrolReportView extends StatelessWidget {
  final PatrolReportController _patrolReportController = PatrolReportController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Patrol Reports'),
        backgroundColor: Color(0xffe4d7ba),
        titleTextStyle: TextStyle(
          color: Colors.black,
          fontSize: 22.0,
          fontWeight: FontWeight.bold,
        ),
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
      ),
      body: StreamBuilder<List<PatrolReport>>(
        stream: _patrolReportController.getPatrolReports(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(
              child: Text('No patrol reports available.'),
            );
          }

          // Group reports by date
          Map<String, List<PatrolReport>> groupedReports = {};
          snapshot.data!.forEach((report) {
            String date = report.timestamp?.toString().split(' ')[0] ?? 'No Date';
            groupedReports.putIfAbsent(date, () => []).add(report);
          });

          return ListView.builder(
            itemCount: groupedReports.length,
            itemBuilder: (context, index) {
              String date = groupedReports.keys.elementAt(index);
              List<PatrolReport> reports = groupedReports[date] ?? [];

              return Card(
                elevation: 3.0,
                margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                child: ExpansionTile(
                  title: Text(date, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0), ),
                  children: reports.map((report) {
                    return ListTile(
                      title: Text(
                        report.timestamp?.toString() ?? 'No Time Available',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text('Guard Name: ${report.GuardName ?? 'Guard Name not available'}'),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DetailScreen(report: report),
                          ),
                        );
                      },
                    );
                  }).toList(),
                ),
              );
            },
          );
        },
      ),
    );
  }
}







