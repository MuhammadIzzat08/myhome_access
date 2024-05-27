import 'package:flutter/material.dart';
import '../Controller/user.dart';
import '../Model/user.dart';

class UserProfileView extends StatefulWidget {
  final String userEmail;

  UserProfileView({required this.userEmail});

  @override
  _UserProfileViewState createState() => _UserProfileViewState();
}

class _UserProfileViewState extends State<UserProfileView> {
  final UserController _userProfileController = UserController();
  UserModel? _userProfile;
  bool _isEditing = false;
  String? _selectedRole;
  List<String> _roles = ["Owner", "Tenant"];

  @override
  void initState() {
    super.initState();
    _loadUserProfile();
  }

  Future<void> _loadUserProfile() async {
    try {
      _userProfile =
      await _userProfileController.getUserByEmail(widget.userEmail);
      setState(() {});
    } catch (e) {
      print("Error loading user profile: $e");
    }
  }

  void _toggleEdit() {
    setState(() {
      _isEditing = !_isEditing;
    });
  }

  Future<void> _updateUser() async {
    try {
      await _userProfileController.updateUser(_userProfile!);
      _toggleEdit();
    } catch (e) {
      print("Error updating user profile: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('User Profile'),
          actions: [
            IconButton(
              icon: Icon(Icons.edit),
              onPressed: () {
                _toggleEdit();
              },
            ),
          ],
        ),
        body: _userProfile != null
            ? Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Name:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              _isEditing
                  ? TextFormField(
                initialValue: _userProfile!.name,
                onChanged: (value) {
                  setState(() {
                    _userProfile!.name = value;
                  });
                },
              )
                  : Text(
                _userProfile!.name!,
                style: TextStyle(fontSize: 18),
              ),
              SizedBox(height: 10),
              Text(
                'Email:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Text(
                _userProfile!.email!,
                style: TextStyle(fontSize: 18),
              ),
              SizedBox(height: 10),
              Text(
                'Role:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              _isEditing
                  ? DropdownButtonFormField(
                value: _selectedRole,
                items: _roles.map((role) {
                  return DropdownMenuItem(
                    value: role,
                    child: Text(role),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    _selectedRole = value as String?;
                    _userProfile!.role = _selectedRole;
                  });
                },
              )
                  : Text(
                _userProfile!.role!,
                style: TextStyle(fontSize: 18),
              ),
              SizedBox(height: 10),
              Text(
                'Address:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              _isEditing
                  ? TextFormField(
                initialValue: _userProfile!.address,
                onChanged: (value) {
                  setState(() {
                    _userProfile!.address = value;
                  });
                },
              )
                  : Text(
                _userProfile!.address!,
                style: TextStyle(fontSize: 18),
              ),
              SizedBox(height: 10),
              Text(
                'Phone Number:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              _isEditing
                  ? TextFormField(
                initialValue: _userProfile!.phoneNo,
                onChanged: (value) {
                  setState(() {
                    _userProfile!.phoneNo = value;
                  });
                },
              )
                  : Text(
                _userProfile!.phoneNo!,
                style: TextStyle(fontSize: 18),
              ),
              SizedBox(height: 10),
              if (_isEditing)
                ElevatedButton(
                  onPressed: _updateUser,
                  child: Text('Save Changes'),
                ),
            ],
          ),
        )
            : Center(
            child: CircularProgressIndicator(),
            ),
        );
    }
}