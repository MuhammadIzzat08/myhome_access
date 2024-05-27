/*import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:myhome_access/View/patrol_report.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../menu_Guard.dart';
import '../menu_admin.dart';
import '../menu_owner.dart';
import 'emergency_alert.dart';
import 'notification.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isLoading = false;
  String _errorMessage = '';


  void _handleLogin() async {
    if (_formKey.currentState!.validate()) {
      try {
        setState(() => _isLoading = true);
        UserCredential userCredential = await _auth.signInWithEmailAndPassword(
          email: _emailController.text.trim(),
          password: _passwordController.text.trim(),
        );

        final prefs = await SharedPreferences.getInstance();
        String userEmail = _emailController.text;
        await prefs.setString("userEmail", userEmail);

        // Fetch user's role based on email from Firestore
        FirebaseFirestore.instance
            .collection('users')  // Assuming users collection contains Guard and Owner roles
            .where('email', isEqualTo: userEmail)
            .get()
            .then((QuerySnapshot querySnapshot) {
          if (querySnapshot.docs.isNotEmpty) {
            String role = querySnapshot.docs
                .first['role']; // Assuming 'role' is the field that contains the user's role

            // Navigate based on the user's role
            if (role == 'Guard') {
              Navigator.of(context).pushReplacement(MaterialPageRoute(
                builder: (context) => MainMenuGuard(),
              ));
            } else if (role == 'Owner' || role == 'Tenant') {
              Navigator.of(context).pushReplacement(MaterialPageRoute(
                builder: (context) =>
                    MainMenuOwner(), // Replace with your Owner menu screen
              ));
            }
            else {
              Navigator.of(context).pushReplacement(MaterialPageRoute(
                builder: (context) =>
                    MainMenuAdmin(), // Replace with your Owner menu screen
              ));
            }
          }
        });

      } on FirebaseAuthException catch (e) {
        setState(() {
          _errorMessage = e.message ?? 'Login failed';
          _isLoading = false;
        });
      }
    }
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              child: Image.network(
                "https://i.pinimg.com/564x/3f/91/5e/3f915edf8313177338f4fb25bc065cc8.jpg",
                width: MediaQuery.of(context).size.width,
                height: 365,
                fit: BoxFit.cover,
              ),
            ),
            Container(
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height - 74,
                decoration: BoxDecoration(
                  color: Color(0xffffffff),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(45),
                    topRight: Radius.circular(42),
                  ),
                ),
                child: SingleChildScrollView(
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        SizedBox(height: 50),
                        Text(
                          "let’s login and browse",
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w400,
                            letterSpacing: 0.36,
                            color: Color(0xcebdbdbd),
                          ),
                        ),
                        SizedBox(height: 55),
                        Text(
                          "Welcome Back !",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w700,
                            color: Color(0xff111111),
                          ),
                        ),
                        SizedBox(height: 31),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 26),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Email :",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w700,
                                  color: Color(0xff292828),
                                ),
                              ),
                              SizedBox(height: 12),
                              TextFormField(
                                controller: _emailController,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: "Email",
                                ),
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Please enter your email';
                                  }
                                  return null;
                                },
                              ),
                              SizedBox(height: 41),
                              Text(
                                "Password :\n",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w700,
                                  color: Color(0xff303030),
                                ),
                              ),
                              SizedBox(height: 12),
                              TextFormField(
                                controller: _passwordController,
                                obscureText: true,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: "Password",
                                ),
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Please enter your password';
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
                                    onPressed: _handleLogin,
                                    style: ElevatedButton.styleFrom(
                                      primary: Color(0xffddc5ad),
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
                              if (_isLoading)
                                CircularProgressIndicator(),
                              if (_errorMessage.isNotEmpty)
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    _errorMessage,
                                    style: TextStyle(color: Colors.red),
                                    textAlign: TextAlign.center,
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
            ),
          ],
        ),
      ),
    );
  }
}*/

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:myhome_access/View/user.dart';
import 'package:myhome_access/View/visitorlogin.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

import '../menu_Guard.dart';
import '../menu_admin.dart';
import '../menu_owner.dart';
import 'emergency_alert.dart';
import 'fine_visitor_vehicle.dart';

// Your other imports like emergency_alert, visitor_vehicle, etc.

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key, required String userEmail}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isLoading = false;
  String _errorMessage = '';

 /*void _handleLogin() async {
    if (_formKey.currentState!.validate()) {
      try {
        setState(() => _isLoading = true);
        UserCredential userCredential = await _auth.signInWithEmailAndPassword(
          email: _emailController.text.trim(),
          password: _passwordController.text.trim(),
        );

        // Save userEmail in SharedPreferences
        final prefs = await SharedPreferences.getInstance();
        await prefs.setString("userEmail", _emailController.text.trim());

        // Navigate to EmergencyScreen with userEmail
        Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) => EmergencyScreen(userEmail: _emailController.text.trim()),
          // builder: (context)=>VisitorRegistrationView(),
          // builder:(context)=>PatrolScreen(),
        ));
      } on FirebaseAuthException catch (e) {
        setState(() {
          _errorMessage = e.message ?? 'Login failed';
          _isLoading = false;
        });
      }
    }
  }*/


  void _handleLogin() async {
    if (_formKey.currentState!.validate()) {
      try {
        setState(() => _isLoading = true);
        UserCredential userCredential = await _auth.signInWithEmailAndPassword(
          email: _emailController.text.trim(),
          password: _passwordController.text.trim(),
        );

        final prefs = await SharedPreferences.getInstance();
        String userEmail = _emailController.text;
        await prefs.setString("userEmail", userEmail);

        // Fetch user's role based on email from Firestore
        FirebaseFirestore.instance
            .collection('users')  // Assuming users collection contains Guard and Owner roles
            .where('email', isEqualTo: userEmail)
            .get()
            .then((QuerySnapshot querySnapshot) {
          if (querySnapshot.docs.isNotEmpty) {
            String role = querySnapshot.docs
                .first['role']; // Assuming 'role' is the field that contains the user's role

            // Navigate based on the user's role
            if (role == 'Guard') {
              Navigator.of(context).pushReplacement(MaterialPageRoute(
                builder: (context) => MainMenuGuard(),
              ));
            } else if (role == 'Owner' || role == 'Tenant') {
              Navigator.of(context).pushReplacement(MaterialPageRoute(
                builder: (context) =>
                    MainMenuOwner(), // Replace with your Owner menu screen
              ));
            }
            else {
              Navigator.of(context).pushReplacement(MaterialPageRoute(
                builder: (context) =>
                    MainMenuAdmin(), // Replace with your Owner menu screen
              ));
            }
          }
        });

      } on FirebaseAuthException catch (e) {
        setState(() {
          _errorMessage = e.message ?? 'Login failed';
          _isLoading = false;
        });
      }
    }
  }

  void _forgotPassword() async {
    final TextEditingController _resetEmailController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("Forgot Password"),
        content: TextField(
          controller: _resetEmailController,
          decoration: InputDecoration(
            labelText: "Enter your email",
          ),
        ),
        actions: <Widget>[
          TextButton(
            child: Text("Send Reset Link"),
            onPressed: () async {
              try {
                await FirebaseAuth.instance.sendPasswordResetEmail(
                  email: _resetEmailController.text,
                );
                Navigator.of(context).pop();
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text("Password reset link sent! Check your email.")),
                );
              } catch (e) {
                Navigator.of(context).pop();
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text("Error: $e")),
                );
              }
            },
          ),
        ],
      ),
    );
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
                      key: _formKey,
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
                            "Sign in to your account",
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
                              "Email",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w700,
                                color: Colors.black,
                              ),
                            ),
                            SizedBox(height:12),
                          TextFormField(
                            controller: _emailController,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: "Email",
                            ),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please enter your email';
                              }
                              return null;
                            },
                          ),

                          SizedBox(height: 31),
                            Text(
                              "Password",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w700,
                                color: Colors.black87,
                              ),
                            ),
                          SizedBox(height: 12),
                          TextFormField(
                            controller: _passwordController,
                            obscureText: true,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: "Password",
                              ),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please enter your password';
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
                                onPressed: _handleLogin,
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
                          if (_isLoading) Center(child: CircularProgressIndicator()),
                          if (_errorMessage.isNotEmpty)
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                _errorMessage,
                                style: TextStyle(color: Colors.red),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          SizedBox(height: 20),
                         /* TextButton(
                            onPressed: _forgotPassword,
                            child: Text("Forgot Password?",
                            style: TextStyle(color: Colors.black),
                            textAlign: TextAlign.center,),
                          ),
                            TextButton(
                              onPressed: _forgotPassword,
                              child: Center(
                                child: Text("Sign Up",
                                  style: TextStyle(color: Colors.black),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                            TextButton(
                              onPressed: _forgotPassword,
                              child: Text("Visitor Login",
                                style: TextStyle(color: Colors.black),
                                textAlign: TextAlign.center,
                              ),
                            ),*/
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround, // Adjust as needed
                              children: [
                                TextButton(
                                  onPressed: _forgotPassword,
                                  child: Text(
                                    "Forgot Password?",
                                    style: TextStyle(color: Colors.black, fontSize: 16),
                                  ),
                                ),
                                TextButton(
                                  onPressed :(){
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (context) => VisitorLoginView()),
                                    );
                                },
                                  child: Text(
                                    "Visitor Login",
                                    style: TextStyle(color: Colors.black, fontSize: 16),
                                  ),
                                ),
                              ],
                            ),
                            Center(
                              child: TextButton(
                                onPressed: () {
                                  openTelegram('Hi, i need help!');
                                },
                                child: Text(
                                  "Customer Service",
                                  style: TextStyle(color: Colors.black, fontSize: 16),
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
  String getTelegramUrl(String message ) {
    return 'https://t.me/suhaizaledzaltar?text=${Uri.encodeComponent(message)}';
  }

  void openTelegram(String message) async {
    String url = getTelegramUrl(message);
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }


}



