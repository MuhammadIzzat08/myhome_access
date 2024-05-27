import 'package:flutter/material.dart';
import '../Controller/userdelete.dart';
import '../Model/user.dart';
class AdminScreen extends StatefulWidget {
  @override
  _AdminScreenState createState() => _AdminScreenState();
}

/*class _AdminScreenState extends State<AdminScreen> {
  final AdminController _adminController = AdminController();
  late Future<List<UserModel>> _futureUsers;

  @override
  void initState() {
    super.initState();
    _futureUsers = _adminController.getAllUsers();
  }

  void _refreshUserList() {
    setState(() {
      _futureUsers = _adminController.getAllUsers();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('List Of User'),
        backgroundColor: Color(0xffe4d7ba),
        titleTextStyle: TextStyle(color: Colors.black, fontSize: 22.0,
          fontWeight: FontWeight.bold,),
        iconTheme: IconThemeData(
          color: Colors.black, // Setting the back button color to black
        ),
      ),
      body: FutureBuilder<List<UserModel>>(
        future: _futureUsers,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator();
          } else if (snapshot.hasError) {
            return Text("Error: ${snapshot.error}");
          } else if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                UserModel user = snapshot.data![index];
                return Card(
                  child: ListTile(
                    title: Text(user.name ?? 'No Name'),
                    subtitle: Text('Email: ${user.email}\nRole: ${user.role}\nPhone: ${user.phoneNo}\nAddress: ${user.address}'),
                    trailing: IconButton(
                      icon: Icon(Icons.delete),
                      onPressed: () async {
                        // Show confirmation dialog
                        bool deleteConfirmed = await showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Text("Confirm Deletion"),
                              content: Text("Are you sure you want to delete this user? This action cannot be undone."),
                              actions: <Widget>[
                                TextButton(
                                  child: Text("Cancel"),
                                  onPressed: () {
                                    Navigator.of(context).pop(false); // Return false when canceled
                                  },
                                ),
                                TextButton(
                                  child: Text("Delete"),
                                  onPressed: () {
                                    Navigator.of(context).pop(true); // Return true when confirmed
                                  },
                                ),
                              ],
                            );
                          },
                        );

                        // Check if deletion is confirmed and proceed
                        if (deleteConfirmed ?? false) {
                          await _adminController.deleteUser(user.email!);
                          _refreshUserList(); // Refresh the user list after deletion
                        }
                      },
                    ),
                  ),
                );
              },
            );
          } else {
            return Text("No users found");
          }
        },
      ),
    );
  }
}*/

class _AdminScreenState extends State<AdminScreen> {
  final AdminController _adminController = AdminController();
  late Future<List<UserModel>> _futureUsers;
  TextEditingController _searchController = TextEditingController();
  String _searchQuery = ''; // Store the current search query

  @override
  void initState() {
    super.initState();
    _futureUsers = _adminController.getAllUsers();
  }

  void _refreshUserList() {
    setState(() {
      _futureUsers = _adminController.getAllUsers();
    });
  }

  List<UserModel> _filterUsers(List<UserModel> users) {
    if (_searchQuery.isEmpty) {
      return users;
    }
    return users.where((user) => user.email!.toLowerCase().contains(_searchQuery.toLowerCase())).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('List Of User'),
        backgroundColor: Color(0xffe4d7ba),
        titleTextStyle: TextStyle(
          color: Colors.black,
          fontSize: 22.0,
          fontWeight: FontWeight.bold,
        ),
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () async {
              await showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: Text("Search by Email"),
                    content: TextField(
                      controller: _searchController,
                      decoration: InputDecoration(
                        labelText: 'Enter email',
                        hintText: 'Email',
                      ),
                      onChanged: (value) {
                        setState(() {
                          _searchQuery = value;
                          _futureUsers = _adminController.getAllUsers().then((users) => _filterUsers(users));
                        });
                      },
                    ),
                    actions: <Widget>[
                      TextButton(
                        child: Text("Search"),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                    ],
                  );
                },
              );
            },
          ),
        ],
      ),
      body: FutureBuilder<List<UserModel>>(
        future: _futureUsers,
        builder: (context, snapshot) {

          if (snapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator();
          } else if (snapshot.hasError) {
            return Text("Error: ${snapshot.error}");
          } else if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                UserModel user = snapshot.data![index];
                return Card(
                  child: ListTile(
                    title: Text(user.name ?? 'No Name'),
                    subtitle: Text('Email: ${user.email}\nRole: ${user.role}\nPhone: ${user.phoneNo}\nAddress: ${user.address}'),
                    trailing: IconButton(
                      icon: Icon(Icons.delete),
                      onPressed: () async {
                        // Show confirmation dialog
                        bool deleteConfirmed = await showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Text("Confirm Deletion"),
                              content: Text("Are you sure you want to delete this user? This action cannot be undone."),
                              actions: <Widget>[
                                TextButton(
                                  child: Text("Cancel"),
                                  onPressed: () {
                                    Navigator.of(context).pop(false); // Return false when canceled
                                  },
                                ),
                                TextButton(
                                  child: Text("Delete"),
                                  onPressed: () {
                                    Navigator.of(context).pop(true); // Return true when confirmed
                                  },
                                ),
                              ],
                            );
                          },
                        );

                        // Check if deletion is confirmed and proceed
                        if (deleteConfirmed ?? false) {
                          await _adminController.deleteUser(user.email!);
                          _refreshUserList(); // Refresh the user list after deletion
                        }
                      },
                    ),
                  ),
                );
              },
            );
          } else {
            return Text("No users found");
          }
        },
      ),
    );
  }
}


