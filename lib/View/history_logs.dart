/*
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../Controller/history_logs.dart';
import '../Model/history_logs.dart';

class HistoryLogsView extends StatefulWidget {
  @override
  _HistoryLogsViewState createState() => _HistoryLogsViewState();
}

class _HistoryLogsViewState extends State<HistoryLogsView> {
  final HistoryLogsController _controller = HistoryLogsController();
  String? userEmail = FirebaseAuth.instance.currentUser?.email;
  String? userName = await _controller.fetchUserNameFromEmail(userEmail!);


  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text('History Logs'),
          bottom: TabBar(
            tabs: [
              Tab(text: 'Emergency'),
              Tab(text: 'Visitor'),
            ],
          ),
        ),
        body: Column(
          children: [
            Expanded(  // Ensure the TabBarView takes the remaining space in the Column
              child: TabBarView(
                children: [
                  _buildHistoryLogsTab("emergency_alerts"),
                  _buildHistoryLogsTab("visitor"),
                ],
              ),
            ),
            _buildUserSchedule(),  // Move the FutureBuilder to a separate method
          ],
        ),
      ),
    );
  }

  Widget _buildUserSchedule() {
    return FutureBuilder<String?>(
      future: _controller.fetchUserName(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        }

        if (!snapshot.hasData || snapshot.data == null) {
          return Center(child: Text('No guard logged in.'));
        }

        String userName = snapshot.data!;
        String? userEmail = FirebaseAuth.instance.currentUser?.email; // Get the logged-in user email

        return StreamBuilder<List<HistoryLogsItem>>(
          stream: _controller.getVisitorLogsStream(userEmail!),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            }

            if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return Center(child: Text('No schedule available for $userName.'));
            }

            List<HistoryLogsItem> schedule = snapshot.data!;
            List<HistoryLogsItem> filteredSchedule = schedule.where((s) => s.userName == userName).toList();

            if (filteredSchedule.isEmpty) {
              return Center(child: Text('No schedule available for $userName.'));
            }

            return Expanded(  // Ensure the ListView takes the remaining space
              child: ListView.builder(
                itemCount: filteredSchedule.length,
                itemBuilder: (context, index) {
                  HistoryLogsItem scheduleItem = filteredSchedule[index];
                  // Return your ListTile or any other widget as needed
                },
              ),
            );
          },
        );
      },
    );
  }



  Widget _buildUserSchedule() {
    return FutureBuilder<String?>(
      future: _controller.fetchUserName(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        }

        if (!snapshot.hasData || snapshot.data == null) {
          return Center(child: Text('No user logged in.'));
        }

        String userName = snapshot.data!;
        String? userEmail = FirebaseAuth.instance.currentUser?.email; // Get the logged-in user email

        return StreamBuilder<List<HistoryLogsItem>>(
          stream: _controller.getVisitorLogsStream(userEmail!),
          builder: (context, snapshot) {
    String? userEmail = FirebaseAuth.instance.currentUser?.email; // Get logged-in user email
    return FutureBuilder<String?>(
      future: fetchUserNameFromEmail(userEmail!),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        }

        if (!snapshot.hasData || snapshot.data == null) {
          return Center(child: Text('No user found.'));
        }

        String userName = snapshot.data!;

        return StreamBuilder<List<HistoryLogsItem>>(
          stream: _controller.getVisitorLogsStream(userName), // Use the fetched name for the query
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            }

            if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return Center(child: Text('No schedule available for $userName.'));
            }

            List<HistoryLogsItem> schedule = snapshot.data!;

            // Filter the schedule to show items only related to the logged-in user
            List<HistoryLogsItem> filteredSchedule = schedule.where((s) => s.userName == userEmail).toList();

            if (filteredSchedule.isEmpty) {
              return Center(child: Text('No schedule available for $userName.'));
            }

            return Expanded(
              child: ListView.builder(
                itemCount: filteredSchedule.length,
                itemBuilder: (context, index) {
                  HistoryLogsItem scheduleItem = filteredSchedule[index];
                  return ListTile(
                    title: Text('Type: ${scheduleItem.type}'), // Show the type of the log as the title
                    subtitle: Text('Message: ${scheduleItem.message}'), // Show the message associated with the log as the subtitle
                    onTap: () {
                      _showDetailsDialog(context, scheduleItem, 'visitor');
                    },
                  );
                },
              ),
            );
          },
        );
      },
    );
  }


  String? userEmail = FirebaseAuth.instance.currentUser?.email; // Assuming you are using FirebaseAuth
  Widget _buildHistoryLogsTab(String collection) {
    String? userEmail = FirebaseAuth.instance.currentUser?.email;

    print("Logged-in User Email: $userEmail"); // Log the user email

    return StreamBuilder<List<HistoryLogsItem>>(
      stream: collection == "emergency_alerts"
          ? _controller.getEmergencyLogsStream()
          : _controller.getVisitorLogsStream(userEmail!),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Center(child: CircularProgressIndicator());
        }

        List<HistoryLogsItem> data = snapshot.data!;

        // Filter the list to only show visitors relevant to the logged-in user
        List<HistoryLogsItem> filteredData = data.where((item) => item.userName == userEmail).toList();

        print("Total Items Fetched: ${data.length}"); // Log total items fetched
        print("Filtered Items Count: ${filteredData.length}"); // Log filtered items count


        return ListView.builder(
          itemCount: filteredData.length,
          itemBuilder: (context, index) {
            HistoryLogsItem item = filteredData[index];
            return ListTile(
              title: (collection == "emergency_alerts" || collection == "visitor")
                  ? (collection == "emergency_alerts"
                  ? Text(item.type ?? '')
                  : Text(item.visitorName ?? '')) // Display visitor's name for the visitor collection
                  : Text("Unknown Collection: $collection"),
              subtitle: (collection == "emergency_alerts")
                  ? Text(item.message ?? '')
                  : (collection == "visitor")
                  ? Text(item.status ?? '') // Display visitor's status or other relevant info
                  : null,
              onTap: () {
                _showDetailsDialog(context, item, collection);
              },
            );
          },
        );
      },
    );
  }*/

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../Controller/history_logs.dart';
import '../Model/history_logs.dart';

class HistoryLogsView extends StatefulWidget {
  @override
  _HistoryLogsViewState createState() => _HistoryLogsViewState();
}

class _HistoryLogsViewState extends State<HistoryLogsView> {
  final HistoryLogsController _controller = HistoryLogsController();
  String name = '';

  @override
  void initState() {
    super.initState();
    _loadUserName();
    _fetchName();
  }

  String? userEmail;
  String? userName;

  _loadUserName() async {
    userEmail = FirebaseAuth.instance.currentUser?.email;
    userName = await _controller.fetchUserName();
    setState(() {}); // Refresh the UI after setting the userName
  }

  void _fetchName() async {
    // Replace this logic with your own logic to fetch the guard name
    String roleName = 'name'; // Replace with the actual role check logic
    if (roleName == 'name') {
      name = (await _controller.fetchUserName()) ?? '';
    }
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text('History Logs'),
          bottom: TabBar(
            tabs: [
              Tab(text: 'Emergency'),
              Tab(text: 'Visitor'),
            ],
          ),
        ),
        body: Column(
          children: [
            Expanded(
              child: TabBarView(
                children: [
                  _buildHistoryLogsTab("emergency_alerts"),
                  _buildHistoryLogsTab("visitor"),
                ],
              ),
            ),
            _buildUserSchedule(),
          ],
        ),
      ),
    );
  }

  Widget _buildUserSchedule() {
    if (userName == null) {
      return Center(child: CircularProgressIndicator());
    }

    return StreamBuilder<List<HistoryLogsItem>>(
      stream: _controller.getVisitorLogs(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        }

        if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return Center(child: Text('No visitor record available for $userName.'));
        }

        List<HistoryLogsItem> schedule = snapshot.data!;
        List<HistoryLogsItem> filteredSchedule = schedule.where((s) => s.userName == userEmail).toList();

        /*if (filteredSchedule.isEmpty) {
          return Center(child: Text('No schedule available for $userName.'));
        }*/

        return Expanded(
          child: ListView.builder(
            itemCount: filteredSchedule.length,
            itemBuilder: (context, index) {
              HistoryLogsItem scheduleItem = filteredSchedule[index];
              return ListTile(
                title: Text('Type: ${scheduleItem.type}'),
                subtitle: Text('Message: ${scheduleItem.message}'),
                onTap: () {
                  _showDetailsDialog(context, scheduleItem, 'visitor');
                },
              );
            },
          ),
        );
      },
    );
  }

  Widget _buildHistoryLogsTab(String collection) {
    if (userName == null) {
      return Center(child: CircularProgressIndicator());
    }

    return StreamBuilder<List<HistoryLogsItem>>(
      stream: collection == "emergency_alerts"
          ? _controller.getEmergency()
          : _controller.getVisitorLogs(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Center(child: CircularProgressIndicator());
        }

        List<HistoryLogsItem> data = snapshot.data!;
        List<HistoryLogsItem> filteredData = data.where((item) => item.userName == userEmail).toList();

        print("Total Items Fetched: ${data.length}");
        print("Filtered Items Count: ${filteredData.length}");

        return ListView.builder(
          itemCount: filteredData.length,
          itemBuilder: (context, index) {
            HistoryLogsItem item = filteredData[index];
            return ListTile(
              title: collection == "emergency_alerts"
                  ? Text(item.type ?? '')
                  : Text(item.visitorName ?? ''),
              subtitle: collection == "emergency_alerts"
                  ? Text(item.message ?? '')
                  : Text(item.status ?? ''),
              onTap: () {
                _showDetailsDialog(context, item, collection);
              },
            );
          },
        );
      },
    );
  }



  void _showDetailsDialog(BuildContext context, HistoryLogsItem item,
      String collection) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Details'),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (collection == 'emergency_alerts') ...[
                Text('Type: ${item.type}'),
                Text('Message: ${item.message}'),
                Text('Timestamp: ${item.timestamp}'),
                // Display the image if available
                if (item.imageUrl != null) Image.network(item.imageUrl!),
              ],

              // Additional details for the 'Visitor' tab
              if (collection == 'visitor') ...[
                Text('Access Start Time: ${item.accessStartTime}'),
                Text('Access End Time: ${item.accessEndTime}'),
                Text('Plate Number: ${item.plateNumber}'),
                Text('Status: ${item.status}'),
                Text('Type of Access: ${item.typeOfAccess}'),
                Text('Vehicle Type: ${item.vehicleType}'),
                Text('Visitor Name: ${item.visitorName}'),
              ],
              // Add more details as needed
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Close'),
            ),
          ],
        );
      },
    );
  }
}