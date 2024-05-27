import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../Controller/user.dart';
import '../Model/user.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final UserController _userController = UserController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  String? _selectedRole;

/*  void _handleSignUp() async {
    if (_formKey.currentState!.validate()) {
      try {
      ;
        UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
          email: _emailController.text,
          password: _passwordController.text,
        );

        UserModel newUser = UserModel(
          name: _nameController.text,
          email: _emailController.text,
          role: _selectedRole,
          address: _addressController.text,
          phoneNo: _phoneController.text,

        );

        await _userController.createUser(newUser);

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('User Registered: ${userCredential.user!.email}')),
        );
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error during registration: $e')),
        );
      }
    }
  }*/
  void _handleSignUp() async {
    if (_formKey.currentState!.validate()) {
      try {
        ;
        UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
          email: _emailController.text,
          password: _passwordController.text,
        );

        UserModel newUser = UserModel(
          name: _nameController.text,
          email: _emailController.text,
          role: _selectedRole,
          address: _addressController.text,
          phoneNo: _phoneController.text,

        );

        await _userController.createUser(newUser);

        await _auth.sendPasswordResetEmail(email: _emailController.text);

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('User Registered: ${userCredential.user!.email}')),
        );

      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error during registration: $e')),
        );
    }
    }
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
                    color: Color(0xeddcdbdb),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(45),
                      topRight: Radius.circular(45),
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 26),
                    child: Form(
                      key: _formKey,
                      child: SingleChildScrollView(
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
                              "Please enter all the details to create your account",
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
                                    "Name",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w700,
                                      color: Colors.black,
                                    ),
                                  ),
                                  SizedBox(height:12),
                                  TextFormField(
                                    controller: _nameController,
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(),
                                      labelText: "Name",
                                    ),
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return 'Please enter your name';
                                      }
                                      return null;
                                    },
                                  ),

                                  SizedBox(height: 31),
                                  Text(
                                    "Email",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w700,
                                      color: Colors.black87,
                                    ),
                                  ),
                                  SizedBox(height: 12),
                                  TextFormField(
                                    controller: _emailController,
                                    keyboardType: TextInputType.emailAddress,
                                    //obscureText: true,
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(),

                                      labelText: "Email",
                                    ),
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return 'Please enter your Email';
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
                                  SizedBox(height: 31),
                                  Text(
                                    "Role",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w700,
                                      color: Colors.black87,
                                    ),
                                  ),
                                  SizedBox(height: 12),
                                  DropdownButtonFormField<String>(
                                    value: _selectedRole,
                                    decoration: InputDecoration(
                                      labelText: "Role",
                                      border: OutlineInputBorder(),
                                    ),
                                    items: <String>['Owner', 'Tenant','Guard']
                                        .map<DropdownMenuItem<String>>((String value) {
                                      return DropdownMenuItem<String>(
                                        value: value,
                                        child: Text(value),
                                      );
                                    }).toList(),
                                    onChanged: (String? newValue) {
                                      setState(() {
                                        _selectedRole = newValue;
                                      });
                                    },
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return "Please select your role";
                                      }
                                      return null;
                                    },
                                  ),
                                  SizedBox(height: 31),
                                  Text(
                                    "Address",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w700,
                                      color: Colors.black87,
                                    ),
                                  ),
                                  SizedBox(height: 12),
                                  TextFormField(
                                    controller: _addressController,
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(),
                                      labelText: "Address",
                                    ),
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return 'Please enter your address';
                                      }
                                      return null;
                                    },
                                  ),
                                  SizedBox(height: 31),
                                  Text(
                                    "Phone Number",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w700,
                                      color: Colors.black87,
                                    ),
                                  ),
                                  SizedBox(height: 12),
                                  TextFormField(
                                    controller: _phoneController,
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(),
                                      labelText: "Phone Number",
                                    ),
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return 'Please enter your phone number';
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
                                        onPressed: _handleSignUp,
                                        style: ElevatedButton.styleFrom(
                                          primary: Color(0xff5d5b5b),
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(6),
                                          ),
                                        ),
                                        child: Text(
                                          "Sign Up",
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
                            SizedBox(height: 50),
                          ],
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
    );
  }
}