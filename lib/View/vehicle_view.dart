import 'package:flutter/material.dart';
import '../Controller/vehicle_controller.dart';
import '../Model/vehicle_model.dart';

class AddVehicleView extends StatefulWidget {
  @override
  _AddVehicleViewState createState() => _AddVehicleViewState();
}

class _AddVehicleViewState extends State<AddVehicleView> {
  double fem = 1.0; // Define your fem value
  double ffem = 1.0; // Define your ffem value

  final VehicleController _vehicleController = VehicleController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _plateNumberEditingController = TextEditingController();
  String ownerName = ''; // Owner name fetched based on user role
  String? _vehicleType; // Dropdown selected item

  @override
  void initState() {
    super.initState();
    _fetchOwnerName();
  }

  void _fetchOwnerName() async {
    // Logic to fetch owner name based on user role
    String roleName = 'owner'; // Replace with the actual role check logic
    if (roleName == 'owner') {
      ownerName = (await _vehicleController.fetchUserName()) ?? ''; // Update with your controller method
    }
  }

  void _handleAddVehicle() async {
    if (_formKey.currentState!.validate()) {
      String plateNumber = _plateNumberEditingController.text.trim();

      await _vehicleController.addOrUpdateVehicle(VehicleModel(
          ownerName: ownerName,
          plateNumber: plateNumber,
          vehicleType: _vehicleType ?? ''));
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('New Vehicle Added')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Vehicle'),
        backgroundColor: Color(0xffe4d7ba),
        titleTextStyle: TextStyle(color: Colors.black, fontSize: 22.0, fontWeight: FontWeight.bold),
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.fromLTRB(0 * fem, 40 * fem, 0 * fem, 0 * fem),
          width: double.infinity,
          decoration: BoxDecoration(
            //color: Color(0xffe4d7ba),
          ),
          child: Form(
            key: _formKey,
            /*child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.fromLTRB(0 * fem, 0 * fem, 202 * fem, 36 * fem),
                  child: Text(
                    'Add Vehicle',
                    style: TextStyle(
                      fontSize: 30 * ffem,
                      fontWeight: FontWeight.w500,
                      color: Color(0xff000000),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 20 * fem),
                  width: 294 * fem,
                  height: 50 * fem,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8 * fem),
                    border: Border.all(color: Color(0xaf001a39)),
                    color: Color(0xffffffff),
                  ),
                  child: TextFormField(
                    controller: _plateNumberEditingController,
                    decoration: InputDecoration(
                      labelText: 'Plate Number',
                      border: InputBorder.none,
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter plate number';
                      }
                      return null;
                    },
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 20 * fem),
                  width: 294 * fem,
                  height: 50 * fem,
                  padding: EdgeInsets.symmetric(horizontal: 10 * fem),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8 * fem),
                    border: Border.all(color: Color(0xaf001a39)),
                    color: Color(0xffffffff),
                  ),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                      value: _vehicleType,
                      isExpanded: true,
                      hint: Text('Select Vehicle Type'),
                      items: <String>['Car', 'Motorcycle'].map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      onChanged: (String? newValue) {
                        setState(() {
                          _vehicleType = newValue;
                        });
                      },
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 20 * fem),
                  width: 111 * fem,
                  height: 46 * fem,
                  child: ElevatedButton(
                    onPressed: _handleAddVehicle,
                    child: Text(
                      'Add Car',
                      style: TextStyle(
                        fontSize: 17 * ffem,
                        fontWeight: FontWeight.w700,
                        color: Color(0xffffffff),
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      primary: Color(0xff002d64),
                    ),
                  ),
                ),
              ],
            ),*/
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(width: 40),
                      Image.asset('assets/page-1/images/add-car-91W.png', width: 80 * fem, height: 80 * fem),
                      SizedBox(width: 0 * fem, height: 29), // Adjust the spacing as needed

                      Expanded(
                        child: Container(
                          margin: EdgeInsets.fromLTRB(29* fem, 60 * fem, 30 * fem, 36 * fem),
                          child: Text(
                            'Add Vehicle',
                            style: TextStyle(
                              fontSize: 50 * ffem,
                              fontWeight: FontWeight.w500,
                              color: Color(0xff000000),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 20 * fem),
                  width: 365 * fem,
                  height: 60 * fem,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8 * fem),
                    border: Border.all(color: Color(0xaf001a39)),
                    color: Color(0xffffffff),
                  ),
                  child: TextFormField(
                    controller: _plateNumberEditingController,
                    decoration: InputDecoration(
                      labelText: 'Plate Number',
                      //alignLabelWithHint: true,
                      labelStyle: TextStyle(fontSize: 19 * ffem),
                      prefixIcon: Padding(
                        padding: EdgeInsets.only(right: 8.0),
                        child: Icon(
                          Icons.numbers_rounded,
                          size: 20 * ffem,
                        ),
                      ),
                      border: InputBorder.none,
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter plate number';
                      }
                      return null;
                    },
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 20 * fem),
                  width: 365 * fem,
                  height: 60 * fem,
                  padding: EdgeInsets.symmetric(horizontal: 10 * fem),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8 * fem),
                    border: Border.all(color: Color(0xaf001a39)),
                    color: Color(0xffffffff),
                  ),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                      value: _vehicleType,
                      isExpanded: true,
                      hint: Text('Select Vehicle Type'),
                      style: TextStyle(fontSize: 19 * ffem),


                      items: <String>['Car', 'Motorcycle'].map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value,
                            style: TextStyle(color: Colors.black, fontSize: 22.0),
                          ),
                        );
                      }).toList(),
                      onChanged: (String? newValue) {
                        setState(() {
                          _vehicleType = newValue;
                        });
                      },
                    ),
                  ),
                ),
                SizedBox(height: 30),
                Container(
                  margin: EdgeInsets.only(top: 20 * fem),
                  width: 200 * fem,
                  height: 46* fem,
                  child: ElevatedButton(
                    onPressed: _handleAddVehicle,
                    child: Text(
                      'Add Vehicle',
                      style: TextStyle(
                        fontSize: 17 * ffem,
                        fontWeight: FontWeight.w700,
                        color: Color(0xffffffff),
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      primary: Color(0xff002d64),
                    ),
                  ),
                ),
              ],
            ),

          ),
        ),
      ),
    );
  }
}

class UserVehiclesScreen extends StatefulWidget {
  @override
  _UserVehiclesScreenState createState() => _UserVehiclesScreenState();
}

class _UserVehiclesScreenState extends State<UserVehiclesScreen> {
  final VehicleController _vehicleController = VehicleController();
  List<VehicleModel> _userVehicles = [];

  @override
  void initState() {
    super.initState();
    _loadUserVehicles();
  }

  Future<void> _loadUserVehicles() async {
    List<VehicleModel> userVehicles = await _vehicleController.getUserVehicles();
    setState(() {
      _userVehicles = userVehicles;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Vehicles'),
        backgroundColor: Color(0xffe4d7ba),
        titleTextStyle: TextStyle(color: Colors.black, fontSize: 22.0, fontWeight: FontWeight.bold),
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
      ),
      body: _userVehicles.isEmpty
          ? Center(
        child: Text('No vehicles found for the user'),
      )
          : ListView.builder(
        itemCount: _userVehicles.length,
        itemBuilder: (context, index) {
          VehicleModel vehicle = _userVehicles[index];
          return Card(
            child: ListTile(
              title: Text(vehicle.plateNumber),
              subtitle: Text(vehicle.vehicleType),
              // Add more information as needed
            ),
          );
        },
      ),
    );
  }
}
