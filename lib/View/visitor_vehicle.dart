import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:intl/intl.dart'; // Import the intl package
import 'package:shared_preferences/shared_preferences.dart';
import '../Controller/visitor_vehicle.dart';
import '../Model/visitor_vehicle.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:charts_flutter/flutter.dart' as charts;



//register visitor
class VisitorRegistrationView extends StatefulWidget {
  @override
  _VisitorRegistrationViewState createState() => _VisitorRegistrationViewState();
}

class _VisitorRegistrationViewState extends State<VisitorRegistrationView> {
  final VisitorVehicleController _controller = VisitorVehicleController();
  final TextEditingController _plateNumberController = TextEditingController();
  final TextEditingController _visitorNameController = TextEditingController();

  //final TextEditingController _vehicleTypeController = TextEditingController();
  final TextEditingController _visitorEmailController = TextEditingController();
  DateTime _selectedStartTime = DateTime.now();
  DateTime _selectedEndTime = DateTime.now().add(Duration(hours: 2));
  String _selectedAccessType = 'visitor';
  String _selectedVehicleType = 'Car';

  //String? _selectedAccessType;
  bool showServiceTextField = false;
  String? serviceType; // Variable to store the service type


  //String ownerName = '';

  String? ownerName = FirebaseAuth.instance.currentUser?.email;

  //List<VisitorVehicle> visitors = [];

  @override
  void initState() {
    super.initState();
    _loadVisitors();
    //_loadUserName();
  }

  _loadVisitors() async {
    if (ownerName != null) {
      // Step 1: Fetch the user name based on the email
      final prefs = await SharedPreferences.getInstance();
      String? userName = await _controller.getUserNameByEmail(ownerName!);
      await prefs.setString("userName", userName!);
    }
  }

  Future<void> _selectDateTime(bool isStartTime) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: isStartTime ? _selectedStartTime : _selectedEndTime,
      firstDate: DateTime.now().subtract(Duration(days: 365)),
      lastDate: DateTime.now().add(Duration(days: 365)),
    );

    if (pickedDate != null) {
      final TimeOfDay? pickedTime = await showTimePicker(
        context: context,
        initialTime: TimeOfDay(
          hour: isStartTime ? _selectedStartTime.hour : _selectedEndTime
              .hour,
          minute: isStartTime ? _selectedStartTime.minute : _selectedEndTime
              .minute,
        ),
      );

      if (pickedTime != null) {
        setState(() {
          if (isStartTime) {
            _selectedStartTime = DateTime(
              pickedDate.year,
              pickedDate.month,
              pickedDate.day,
              pickedTime.hour,
              pickedTime.minute,
            );
          } else {
            _selectedEndTime = DateTime(
              pickedDate.year,
              pickedDate.month,
              pickedDate.day,
              pickedTime.hour,
              pickedTime.minute,
            );
          }
        });
      }
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /*appBar: AppBar(title: Text("Register Visitor Vehicle"),
                  backgroundColor: Color(0xffe4d7ba),
                  titleTextStyle: TextStyle(color: Colors.black, fontSize: 22.0, fontWeight: FontWeight.bold),
                  iconTheme: IconThemeData(
                  color: Colors.black,
                  ),
              ),*/


      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.fromLTRB(
                    19 * 1.0, 48 * 1.0, 19 * 1.0, 58 * 1.0),
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.fromLTRB(
                          0 * 1.0, 0 * 1.0, 310 * 1.0, 43 * 1.0),
                      child: TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        style: TextButton.styleFrom(
                          padding: EdgeInsets.zero,
                        ),
                        child: Container(
                          child: Center(
                            child: SizedBox(
                              width: 50 * 1.0,
                              height: 50 * 1.0,
                              child: Image.asset(
                                'assets/page-1/images/back-arrow-mkp.png',
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(
                          0 * 1.0, 0 * 1.0, 23 * 1.0, 0 * 1.0),
                      width: double.infinity,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            margin: EdgeInsets.fromLTRB(
                                0 * 1.0, 0 * 1.0, 30 * 1.0, 0 * 1.0),
                            width: 80 * 1.0,
                            height: 80 * 1.0,
                            child: Image.asset(
                              'assets/page-1/images/add-user-male-7AU.png',
                              fit: BoxFit.contain,
                            ),
                          ),
                          RichText(
                            text: TextSpan(
                              style: TextStyle(
                                fontSize: 26 * 1.0,
                                fontWeight: FontWeight.w400,
                                color: Color(0xff000000),
                              ),
                              children: [
                                TextSpan(
                                  text: 'Register ',
                                  style: TextStyle(
                                    fontSize: 30 * 1.0,
                                    fontWeight: FontWeight.w400,
                                    color: Color(0xff000000),
                                  ),
                                ),
                                TextSpan(
                                  text: 'Visitor',
                                  style: TextStyle(
                                    fontSize: 30 * 1.0,
                                    fontWeight: FontWeight.w700,
                                    color: Color(0xff000000),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              Center(
                child: Text('- Please complete all the details below -',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    color: Colors.black87,
                  ),),
              ),


              SizedBox(height: 40,),
              SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    _buildTextField(
                      controller: _plateNumberController,
                      labelText: 'Plate Number',
                    ),
                    _buildTextField(
                      controller: _visitorNameController,
                      labelText: 'Visitor Name',
                    ),
                    _buildTextField(
                      controller: _visitorEmailController,
                      labelText: 'Visitor Email',
                    ),

                    Container(
                      margin: EdgeInsets.symmetric(vertical: 2.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '',
                            style: TextStyle(
                              fontSize: 16.0,
                              //fontWeight: FontWeight.bold,
                            ),
                          ),
                          DropdownButtonFormField<String>(
                            value: _selectedVehicleType,
                            hint: Text('Select Vehicle Type'),
                            onChanged: (String? newValue) {
                              setState(() {
                                _selectedVehicleType = newValue!;
                              });
                            },
                            items: <String>['Car', 'Motorcycle']
                                .map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.white70,
                              contentPadding: EdgeInsets.symmetric(
                                  horizontal: 16.0, vertical: 18.0),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.blue),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),

              ),


              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Card(
                      child: ListTile(
                        title: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Center(child: Text("Start Time")),
                            SizedBox(height: 4),
                            // Add some space between the text and time
                            Center(child: Text(
                                _formatDateTime(_selectedStartTime))),
                          ],
                        ),
                        onTap: () => _selectDateTime(true),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Card(
                      child: ListTile(
                        title: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Center(child: Text("End Time")),
                            SizedBox(height: 4),
                            // Add some space between the text and time
                            Center(
                                child: Text(_formatDateTime(_selectedEndTime))),
                          ],
                        ),
                        onTap: () => _selectDateTime(false),
                      ),
                    ),
                  ),
                ],
              ),

              Card(
                child: Center(
                  child: Column(
                    children: [
                      DropdownButton<String>(
                        value: _selectedAccessType,
                        onChanged: (String? newValue) {
                          setState(() {
                            _selectedAccessType = newValue!;
                            if (_selectedAccessType == 'Service') {
                              showServiceTextField = true;
                            } else {
                              showServiceTextField = false;
                              serviceType =
                              null; // Reset the serviceType if not 'Service'
                            }
                          });
                        },
                        items: <String>['visitor', 'Service']
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                      if (showServiceTextField)
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: TextField(
                            decoration: InputDecoration(
                              labelText: 'Type of Service',
                              border: OutlineInputBorder(),
                            ),
                            onChanged: (value) {
                              setState(() {
                                serviceType =
                                    value; // Update the serviceType when text changes
                              });
                            },
                          ),
                        ),
                    ],
                  ),
                ),
              ),


              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () async {
                  final prefs = await SharedPreferences.getInstance();
                  String? userName = prefs.getString('userName');
                  var userId = FirebaseAuth.instance.currentUser?.uid ??
                      'unknown_user';
                  // Determine the value to be passed based on the selectedAccessType
                  String accessTypeToSend = _selectedAccessType!;
                  if (_selectedAccessType == 'Service' && serviceType != null) {
                    accessTypeToSend =
                    serviceType!; // Use the serviceType value if selected access type is 'Service'
                  }


                  String result = await _controller.registerVehicle(
                    userName!,
                    _plateNumberController.text,
                    _selectedStartTime,
                    _selectedEndTime,
                    _visitorNameController.text,
                    //_selectedAccessType,
                    accessTypeToSend,
                    _selectedVehicleType,
                    //_vehicleTypeController.text,
                    userId,
                    _visitorEmailController.text,
                  );
                  showDialog(
                    context: context,
                    builder: (context) =>
                        AlertDialog(content: Text(result)),
                  );
                },
                style: ElevatedButton.styleFrom(
                  primary: Color(0x818f7f35),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6),
                  ),
                ),
                child: Center(
                  child: Text('Register Visitor',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                    ),),
                ),
              ),
            ],
          ),
        ),
      ),

    );
  }


  /*String _formatDateTime(DateTime dateTime) {
        final kualaLumpurTime = dateTime.toLocal(); // Convert to local time
        final formatter = DateFormat.yMd().add_Hm().format(kualaLumpurTime);
        return formatter;
      }*/
  String _formatDateTime(DateTime dateTime) {
    final formatter = DateFormat.yMd().add_Hm().format(dateTime
        .toUtc()
        .add(Duration(hours: 8))); // Format to Kuala Lumpur time
    return formatter;
  }


  Widget _buildTextField({
    required TextEditingController controller,
    required String labelText,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          labelText: labelText,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.blue, width: 2.0),
            borderRadius: BorderRadius.circular(10.0),
          ),
        ),
      ),
    );
  }
}



//all visitor history for admin
class VisitorVehicleListView extends StatefulWidget {
  @override
  _VisitorVehicleListViewState createState() => _VisitorVehicleListViewState();
}

class _VisitorVehicleListViewState extends State<VisitorVehicleListView> {
  VisitorVehicleController _controller = VisitorVehicleController();
  late Future<List<VisitorVehicle>> _vehiclesFuture;

  @override
  void initState() {
    super.initState();
    _vehiclesFuture = _controller.getRegisteredVehicles();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Registered Visitor Vehicles'),
        backgroundColor: Color(0xffe4d7ba),
        titleTextStyle: TextStyle(color: Colors.black, fontSize: 22.0, fontWeight: FontWeight.bold),
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
      ),
      body: FutureBuilder<List<VisitorVehicle>>(
        future: _vehiclesFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            List<VisitorVehicle> vehicles = snapshot.data ?? [];
            return ListView.builder(
              itemCount: vehicles.length,
              itemBuilder: (context, index) {
                VisitorVehicle vehicle = vehicles[index];
                return Card(
                  child: ListTile(
                    title: Text(vehicle.plateNumber, style: TextStyle(fontWeight: FontWeight.bold),),
                    subtitle: Text('Visitor: ${vehicle.visitorName} | Access: ${vehicle.status}'),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => VisitorDetailsPage(visitor: vehicle),
                        ),
                      );
                    },
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}


//visitor history for logged in owner
class OwnerVisitorsView extends StatefulWidget {
  @override
  _OwnerVisitorsViewState createState() => _OwnerVisitorsViewState();
}

class _OwnerVisitorsViewState extends State<OwnerVisitorsView> {
  final VisitorVehicleController _controller = VisitorVehicleController();
  String? ownerEmail = FirebaseAuth.instance.currentUser?.email;
  List<VisitorVehicle> visitors = [];

  @override
  void initState() {
    super.initState();
    _loadVisitors();
  }

  _loadVisitors() async {
    if (ownerEmail != null) {
      // Step 1: Fetch the user name based on the email
      String? userName = await _controller.getUserNameByEmail(ownerEmail!);

      // Step 2: If userName is fetched, use it to query the visitors collection
      if (userName != null) {
        var list = await _controller.getVisitorsByOwnerName(userName);
        setState(() {
          visitors = list;
        });
      } else {
        print('User with email $ownerEmail not found.');
      }
    }
  }


  //edit visitor name and num plate
  void _editVisitor(VisitorVehicle visitor) async {
    TextEditingController nameController = TextEditingController(text: visitor.visitorName);
    TextEditingController plateNumberController = TextEditingController(text: visitor.plateNumber);

    await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Edit Visitor Details'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              TextField(
                controller: nameController,
                decoration: InputDecoration(labelText: 'Visitor Name'),
              ),
              SizedBox(height: 16),
              TextField(
                controller: plateNumberController,
                decoration: InputDecoration(labelText: 'Plate Number'),
              ),
            ],
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () async {
                // Update visitor details
                visitor.visitorName = nameController.text;
                visitor.plateNumber = plateNumberController.text;

                // Update the details in Firestore
                await _controller.updateVisitorDetails(visitor);

                // Refresh the list
                _loadVisitors();

                Navigator.of(context).pop(); // Close the dialog
              },
              child: Text('Save'),
            ),
          ],
        );
      },
    );
  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text("My Visitors"),
        backgroundColor: Color(0xffe4d7ba),
        titleTextStyle: TextStyle(color: Colors.black, fontSize: 22.0,
          fontWeight: FontWeight.bold,),
        iconTheme: IconThemeData(
          color: Colors.black, // Setting the back button color to black
        ),

      ),
      body: ListView.builder(
        itemCount: visitors.length,
        itemBuilder: (context, index) {
          var visitor = visitors[index];
          return Card(
            child: /*ListTile(
              title: Text(visitor.visitorName),
              subtitle: Text(visitor.plateNumber),
              onTap: () {
                // Navigate to the details page when the list tile is tapped
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => VisitorDetailsPage(visitor: visitor),
                  ),
                );
              },
            ),*/
            ListTile(
              title: Text(visitor.visitorName),
              subtitle: Text(visitor.plateNumber),
              trailing: IconButton(
                icon: Icon(Icons.edit),
                onPressed: () {
                  _editVisitor(visitor);
                },
              ),
              onTap: () {
                // Navigate to the details page when the list tile is tapped
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => VisitorDetailsPage(visitor: visitor),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}


//details page for visitor history
class VisitorDetailsPage extends StatelessWidget {
  final VisitorVehicle visitor;

  VisitorDetailsPage({required this.visitor});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Visitor Details"),
        backgroundColor: Color(0xffe4d7ba),
        titleTextStyle: TextStyle(color: Colors.black, fontSize: 22.0,
          fontWeight: FontWeight.bold,),
        iconTheme: IconThemeData(
          color: Colors.black, // Setting the back button color to black
        ),
      ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
            child: SizedBox(
              height: 450,
              child: Card(
                elevation: 4.0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildInfoRow("Plate Number         :", visitor.plateNumber),
                      _buildDivider(),
                      _buildInfoRow("Visitor Name          :", visitor.visitorName),
                      _buildDivider(),
                      _buildInfoRow("Access Status        :", visitor.status),
                      _buildDivider(),
                      _buildInfoRow("Access Start Time :", DateFormat('yyyy-MM-dd HH:mm:ss').format(visitor.accessStartTime)),
                      _buildDivider(),
                      _buildInfoRow("Access End Time    :", DateFormat('yyyy-MM-dd HH:mm:ss').format(visitor.accessEndTime)),
                      _buildDivider(),
                      _buildInfoRow("Type of Access       :", visitor.typeOfAccess),
                      _buildDivider(),
                      _buildInfoRow("Vehicle Type           :", visitor.vehicleType),
                      _buildDivider(),
                      _buildInfoRow("Visitor Email           :", visitor.visitorEmail),
                      // Add more rows as needed
                    ],
                  ),
                ),
              ),
            ),
        ),
    );
  }

  Widget _buildInfoRow(String title, String content) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 17.0,
            ),
          ),
          SizedBox(width: 16.0),
          Expanded(
            child: Text(
              content,
              style: TextStyle(
                fontSize: 16.0,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDivider() {
    return Divider(
      color: Colors.grey[400],
      thickness: 0.5,
    );
  }
}





// Yearly Analysis Report
class YearlyVisitorList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<int>>(
      future: VisitorVehicleController().getYearlyVisitorCount(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else {
          List<int> yearlyData = snapshot.data ?? [];
          return Scaffold(
            appBar: AppBar(
              title: Text("Yearly Visitor Analysis"),
            ),
            body: Card(
              child: ListView.builder(
                itemCount: yearlyData.length,
                itemBuilder: (context, index) => ListTile(
                  title: Text("Year ${DateTime.now().year - index}"),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => YearlyVisitorDetailPage(year: DateTime.now().year - index),
                      ),
                    );
                  },
                ),
              ),
            ),
          );
        }
      },
    );
  }
}

class YearlyVisitorDetailPage extends StatelessWidget {
  final int year;

  YearlyVisitorDetailPage({required this.year});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<int>>(
      future: VisitorVehicleController().fetchMonthlyVisitorDataForYear(year),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else {
          List<int> monthlyData = snapshot.data ?? [];
          List<MonthData> monthDataList = [
            MonthData("Jan", monthlyData.length > 0 ? monthlyData[0] : 0),
            MonthData("Feb", monthlyData.length > 1 ? monthlyData[1] : 0),
            MonthData("Mar", monthlyData.length > 2 ? monthlyData[2] : 0),
            MonthData("Apr", monthlyData.length > 3 ? monthlyData[3] : 0),
            MonthData("May", monthlyData.length > 4 ? monthlyData[4] : 0),
            MonthData("Jun", monthlyData.length > 5 ? monthlyData[5] : 0),
            MonthData("Jul", monthlyData.length > 6 ? monthlyData[6] : 0),
            MonthData("Aug", monthlyData.length > 7 ? monthlyData[7] : 0),
            MonthData("Sep", monthlyData.length > 8 ? monthlyData[8] : 0),
            MonthData("Oct", monthlyData.length > 9 ? monthlyData[9] : 0),
            MonthData("Nov", monthlyData.length > 10 ? monthlyData[10] : 0),
            MonthData("Dec", monthlyData.length > 11 ? monthlyData[11] : 0),
          ];
          print(monthlyData);

          List<charts.Series<MonthData, String>> series = [
            charts.Series(
              id: "Visitors",
              data: monthDataList,
              domainFn: (MonthData data, _) => data.month,
              measureFn: (MonthData data, _) => data.visitors,
                colorFn: (MonthData data, _) {
                  // Assigning different colors based on the month.
                  // Adjust as per your requirements.
                  if (data.month == "Jan") {
                    return charts.MaterialPalette.red.shadeDefault;
                  } else if (data.month == "Feb") {
                    return charts.MaterialPalette.blue.shadeDefault;
                  } else if (data.month == "Mar") {
                    return charts.MaterialPalette.green.shadeDefault;
                  } else if (data.month == "Apr") {
                    return charts.MaterialPalette.purple.shadeDefault;
                  } else if (data.month == "May") {
                    return charts.MaterialPalette.deepOrange.shadeDefault;
                  } else if (data.month == "Jun") {
                    return charts.MaterialPalette.yellow.shadeDefault;
                  } else if (data.month == "Jul") {
                    return charts.MaterialPalette.cyan.shadeDefault;
                  } else if (data.month == "Aug") {
                    return charts.MaterialPalette.lime.shadeDefault;
                  } else if (data.month == "Sep") {
                    return charts.MaterialPalette.indigo.shadeDefault;
                  } else if (data.month == "Oct") {
                    return charts.MaterialPalette.teal.shadeDefault;
                  } else if (data.month == "Nov") {
                    return charts.MaterialPalette.gray.shadeDefault;
                  } else if (data.month == "Dec") {
                    return charts.MaterialPalette.pink.shadeDefault;
                  } else {
                    return charts.MaterialPalette.gray.shadeDefault; // Default color
                  }
                },
            )
          ];

          return Scaffold(
            appBar: AppBar(
              title: Text("Visitors in $year"),
            ),
            body: Center(
              child: Card(
                child: charts.BarChart(
                  series,
                  animate: true,
                  barRendererDecorator: charts.BarLabelDecorator<
                      String>(), // To show labels on bars
                ),
              ),
            ),
          );
        }
      },
    );
  }
}


//Guard search number plate>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
class SearchNumberPlateView extends StatefulWidget {
  @override
  _SearchNumberPlateViewState createState() => _SearchNumberPlateViewState();
}

class _SearchNumberPlateViewState extends State<SearchNumberPlateView> {
  final VisitorVehicleController _controller = VisitorVehicleController();
  List<VisitorVehicle> _vehicles = [];
  List<VisitorVehicle> _searchResult = [];

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  _loadData() async {
    _vehicles = await _controller.getRegisteredVehicles();
    _refreshList(); // Refresh the list initially
  }

  _refreshList() {
    setState(() {
      _searchResult = _vehicles;
    });
  }

  _searchNumberPlateDialog(BuildContext context) async {
    String? result = await showDialog<String>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Search by Number Plate'),
          content: TextField(
            onChanged: (value) {
              String searchValue = value.toLowerCase();
              setState(() {
                _searchResult = _vehicles.where((vehicle) =>
                    vehicle.plateNumber.toLowerCase().contains(searchValue)
                ).toList();
              });
            },
            decoration: InputDecoration(hintText: "Enter number plate"),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('OK'),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search Number Plate'),
        backgroundColor: Color(0xffe4d7ba),
        titleTextStyle: TextStyle(color: Colors.black, fontSize: 22.0, fontWeight: FontWeight.bold),
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.refresh), // Refresh icon
            onPressed: _refreshList, // Call refresh function
          ),
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () => _searchNumberPlateDialog(context),
          ),

        ],
      ),
      body: ListView.builder(
        itemCount: _searchResult.length,
        itemBuilder: (context, index) {
          VisitorVehicle vehicle = _searchResult[index];
          return Card(
            child: ListTile(
              title: Text('Plate Number: ${vehicle.plateNumber}'),
              subtitle: Text('Status: ${vehicle.status}'),
            ),
          );
        },
      ),
    );
  }
}









