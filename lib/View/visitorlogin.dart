/*import 'package:flutter/material.dart';
import '../Controller/visitor_vehicle.dart';
import 'history_logs.dart';
class VisitorLoginView extends StatefulWidget {
  @override
  _VisitorLoginViewState createState() => _VisitorLoginViewState();
}

class _VisitorLoginViewState extends State<VisitorLoginView> {
  final TextEditingController _tokenController = TextEditingController();
  final VisitorVehicleController _controller = VisitorVehicleController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Visitor Login")),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _tokenController,
              decoration: InputDecoration(labelText: 'Access Token'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                bool isValidToken = await _controller.validateToken(_tokenController.text);
                if (isValidToken) {
                  Navigator.push(
                    context,
                    //ni untuk test ja
                    MaterialPageRoute(builder: (context) => HistoryLogsView()),
                  );
                } else {
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(content: Text("Invalid or Expired Token")),
                  );
                }
              },
              child: Text('Login'),
            ),
          ],
        ),
      ),
    );
  }
}
*/

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:myhome_access/View/visitor-dashboard.dart';
import 'package:myhome_access/View/visitordasboardnopayment.dart';
import 'package:myhome_access/menu_Guard.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:myhome_access/Controller/visitor_vehicle.dart';

import 'fine_payment.dart';

class VisitorLoginView extends StatefulWidget {
  @override
  _VisitorLoginViewState createState() => _VisitorLoginViewState();
}

class _VisitorLoginViewState extends State<VisitorLoginView> {
  final TextEditingController _tokenController = TextEditingController();
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final VisitorVehicleController _vehicleController = VisitorVehicleController();


  Future<String?> getVisitorEmail(String accessToken) async {
    try {
      // Query the visitor collection to find the document with the provided accessToken.
      QuerySnapshot querySnapshot = await _firestore
          .collection('visitor')
          .where('accessToken', isEqualTo: accessToken)
          .get();

      if (querySnapshot.docs.isNotEmpty) {
        // If a matching document is found, get the visitorEmail.
        String? visitorEmail = querySnapshot.docs.first['visitorEmail'];

        // Save the visitorEmail to SharedPreferences if it's not null.
        if (visitorEmail != null && visitorEmail.isNotEmpty) {
          SharedPreferences prefs = await SharedPreferences.getInstance();
          await prefs.setString('visitorEmail', visitorEmail);
        }

        // Return the visitorEmail.
        return visitorEmail;
      } else {
        // If no matching document is found, return null.
        return null;
      }
    } catch (error) {
      // Handle any potential errors here.
      print('Error: $error');
      return null;
    }
  }


/*  void handleLogin(BuildContext context, String accessToken) async {
    try {
      bool isValidToken = await _vehicleController.validateToken(accessToken);

      if (isValidToken) {
        String? visitorEmail = await getVisitorEmail(accessToken);

        if (visitorEmail != null) {
          bool isAccessGranted = await VisitorVehicleController().checkVisitorStatus(accessToken);

          // Print the retrieved visitorEmail.
          print('Visitor Email: $visitorEmail');

          if (isAccessGranted) {
            // Navigate to MainMenuGuard if access is granted
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => VisitorMenu(),
              ),
            );
          } else {
            // Navigate to VisitorMenu if access is denied or fined
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => VisitorMenu(),
              ),
            );
          }
        } else {
          // Handle the case where visitorEmail is null
          print('Visitor Email is null');
        }
      } else {
        // Handle the case where the token is invalid
        print('Invalid Token');
        showDialog(
          context: context,
          builder: (context) => AlertDialog(content: Text("Invalid Token")),
        );
      }
    } catch (e) {
      // Handle unexpected errors
      print('Error in handleLogin: $e');
      showDialog(
        context: context,
        builder: (context) => AlertDialog(content: Text("An unexpected error occurred")),
      );
    }
  }*/

  void handleLogin(BuildContext context, String accessToken) async {
    try {
      bool isValidToken = await _vehicleController.validateToken(accessToken);

      if (isValidToken) {
        // Save the access token to SharedPreferences
        saveAccessToken(accessToken);

        String? visitorEmail = await getVisitorEmail(accessToken);

        if (visitorEmail != null) {
          bool isAccessGranted = await VisitorVehicleController().checkVisitorStatus(accessToken);

          // Print the retrieved visitorEmail.
          print('Visitor Email: $visitorEmail');

          if (isAccessGranted) {
            // Navigate to MainMenuGuard if access is granted
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => VisitorMenuNoPayment(),
              ),
            );
          } else {
            // Navigate to VisitorMenu if access is denied and fined
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => VisitorMenu(),
              ),
            );
          }
        } else {
          // Handle the case where visitorEmail is null
          print('Visitor Email is null');
        }
      } else {
        // Handle the case where the token is invalid
        print('Invalid Token');
        showDialog(
          context: context,
          builder: (context) => AlertDialog(content: Text("Invalid Token")),
        );
      }
    } catch (e) {
      // Handle unexpected errors
      print('Error in handleLogin: $e');
      showDialog(
        context: context,
        builder: (context) => AlertDialog(content: Text("An unexpected error occurred")),
      );
    }
  }

// Function to save access token to SharedPreferences
  void saveAccessToken(String accessToken) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('accessToken', accessToken);
  }

// Function to retrieve access token from SharedPreferences
  Future<String?> getSavedAccessToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('accessToken');
  }





  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background Image (Fixed)
          Positioned.fill(
            child: Image.asset(
              "assets/page-1/images/logo3.png",
              fit: BoxFit.cover,
            ),
          ),
          // Scrollable Form Container
          SingleChildScrollView(
            child: Column(
              children: [
                // Space for the background image (adjust the height as needed)
                Container(
                  height: 350, // Set the height of the background image
                ),
                // Your form content starts here
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height - 74,
                  decoration: BoxDecoration(
                    color: Color(0x9ef6e8d6),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(45),
                      topRight: Radius.circular(45),
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 26),
                    child: Form(
                      child: Column(
                        children: [
                          SizedBox(height: 50),
                          Text(
                            "Welcome to MyHome Access",
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.w700,
                              letterSpacing: 0.36,
                              color: Colors.black,
                            ),
                          ),
                          SizedBox(height: 35),
                          Text(
                            "Enter your access token to login",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.w500,
                              color: Colors.black87,
                            ),
                          ),
                          SizedBox(height: 31),
                          // ... (rest of your form fields and widgets)
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 26),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.black,
                                  ),
                                ),
                                SizedBox(height:12),
                                TextFormField(
                                  controller: _tokenController,
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(),
                                    labelText: "Access Token",
                                  ),
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'Please enter your access token';
                                    }
                                    return null;
                                  },
                                ),
                                SizedBox(height: 45),
                                Center(
                                  child: SizedBox(
                                    width: 224,
                                    height: 43,
                                    child: ElevatedButton(
                                      onPressed: () {
                                        String accessToken = _tokenController
                                            .text;
                                        handleLogin(context, accessToken);
                                      },
                                      style: ElevatedButton.styleFrom(
                                        primary: Color(0xff5d5b5b),
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(6),
                                        ),
                                      ),
                                      child: Text(
                                        "Login",
                                        style: TextStyle(
                                          fontSize: 24,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

