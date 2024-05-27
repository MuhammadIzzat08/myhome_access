import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../Controller/visitor_vehicle.dart';

class PatrolScreen extends StatefulWidget {
  @override
  _PatrolScreenState createState() => _PatrolScreenState();
}

class _PatrolScreenState extends State<PatrolScreen> {
  final VisitorVehicleController _controller = VisitorVehicleController();
  final TextEditingController _plateNumberController = TextEditingController();
  String _statusMessage = '';
  bool _showFineButton = false;

 /* void _checkVehicle() async {
    var plateNumber = _plateNumberController.text;

    try {
      var vehicle = await _controller.getVehicleDetails(plateNumber);
      if (vehicle != null) {
        setState(() {
          _statusMessage = 'Status: ${vehicle.status}';
          _showFineButton = vehicle.isAccessExpired; // Show the button if access is denied
        });
      } else {
        setState(() {
          _statusMessage = 'Vehicle not found';
          _showFineButton = false;
        });
      }
    } catch (e) {
      setState(() {
        _statusMessage = 'Error: $e';
        _showFineButton = false;
      });
    }
  }
  void _applyFine() async {
    var plateNumber = _plateNumberController.text;

    try {
      // Retrieve the visitorEmail from Firestore based on the plateNumber
      var visitorEmail = await _getVisitorEmailFromFirestore(plateNumber);

      if (visitorEmail != null) {
        // If visitorEmail is found, apply the fine
        await _controller.applyFine(plateNumber, visitorEmail);
        setState(() {
          _statusMessage = 'Fine applied';
          _showFineButton = false;
        });
      } else {
        setState(() {
          _statusMessage = 'Visitor email not found for the given plate number';
        });
      }
    } catch (e) {
      setState(() {
        _statusMessage = 'Error applying fine: $e';
      });
    }
  }
*/
  void _checkVehicle() async {
    var plateNumber = _plateNumberController.text;

    try {
      var vehicle = await _controller.getVehicleDetails(plateNumber);
      if (vehicle != null) {
        setState(() {
          _statusMessage = 'Status: ${vehicle.status}';
          _showFineButton = _shouldShowFineButton(vehicle.status, vehicle.isAccessExpired);
        });
      } else {
        setState(() {
          _statusMessage = 'Vehicle not found';
          _showFineButton = false;
        });
      }
    } catch (e) {
      setState(() {
        _statusMessage = 'Error: $e';
        _showFineButton = false;
      });
    }
  }

  bool _shouldShowFineButton(String status, bool isAccessExpired) {
    // Adjust the condition based on your specific logic
    if (status == 'Access Denied') {
      return true; // Show the button if access is denied
    } else {
      return false; // Hide the button for other statuses
    }
  }

  void _applyFine() async {
    var plateNumber = _plateNumberController.text;

    try {
      // Retrieve the visitorEmail from Firestore based on the plateNumber
      var visitorEmail = await _getVisitorEmailFromFirestore(plateNumber);

      if (visitorEmail != null) {
        // If visitorEmail is found, apply the fine
        await _controller.applyFine(plateNumber, visitorEmail);
        setState(() {
          _statusMessage = 'Fine applied';
          _showFineButton = false;
        });
      } else {
        setState(() {
          _statusMessage = 'Visitor email not found for the given plate number';
        });
      }
    } catch (e) {
      setState(() {
        _statusMessage = 'Error applying fine: $e';
      });
    }
  }


  Future<String?> _getVisitorEmailFromFirestore(String plateNumber) async {
    var documentSnapshot = await FirebaseFirestore.instance.collection('visitor').doc(plateNumber).get();
    if (documentSnapshot.exists) {
      var data = documentSnapshot.data() as Map<String, dynamic>;
      return data['visitorEmail'] as String?;
    } else {
      return null; // Return null if the document does not exist
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Patrol Screen'),
          backgroundColor: Color(0xffe4d7ba),
          titleTextStyle: TextStyle(color: Colors.black, fontSize: 22.0, fontWeight: FontWeight.bold),
          iconTheme: IconThemeData(
            color: Colors.black,
          ),
        ),
        body: Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              children: [
                TextField(
                  controller: _plateNumberController,
                  decoration: InputDecoration(
                    labelText: 'Enter Plate Number',
                    border: OutlineInputBorder(),
                  ),
                ),

                SizedBox(height: 30),
                ElevatedButton(
                  onPressed: () async {
                    var plateNumber = _plateNumberController.text.toLowerCase();
                    // Print plateNumber and visitorEmail before checking the vehicle
                    //var plateNumber = _plateNumberController.text;
                    var visitorEmail = await _getVisitorEmailFromFirestore(plateNumber);
                    print('Plate Number: $plateNumber');
                    print('Visitor Email: $visitorEmail');
                    _checkVehicle();
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Color(0xffe4d7ba),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6),
                    ),
                  ),
                  child: Text('Check Vehicle',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      color: Color(0xff090808),
                    ),),
                ),
                SizedBox(height: 20,),
                Container(
                  width: 300, // Set the width as needed
                  height: 60,
                  child: Card(
                    child: Center(
                      child: Text(_statusMessage,
                          style: TextStyle(
                            fontSize: 21,),
                      ),
                    ),
                  ),
                ),
                if (_showFineButton)
                  SizedBox(height: 20,),
                  ElevatedButton(
                    onPressed: _applyFine,
                    child: Text('Apply Fine',
                      style: TextStyle(
                      fontSize: 19,),),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.red,
                    ),
                  ),
              ],
            ),
            ),
        );
    }
}