import 'package:flutter/material.dart';
import '../Controller/patrol_schedule.dart';
import '../Model/patrol_schedule.dart';

// display all schedule and can be edited by admin

class PatrolScheduleScreen extends StatelessWidget {
  final PatrolScheduleController _controller = PatrolScheduleController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Patrol Schedule'),
        backgroundColor: Color(0xffe4d7ba),
        titleTextStyle: TextStyle(color: Colors.black, fontSize: 22.0, fontWeight: FontWeight.bold),
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
      ),
      body: FutureBuilder<List<String>>(
        future: _controller.getGuardNames(),
        builder: (context, guardNamesSnapshot) {
          if (guardNamesSnapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }

          if (!guardNamesSnapshot.hasData || guardNamesSnapshot.data!.isEmpty) {
            return Center(child: Text('No Guard names available'));
          }

          List<String> guardNames = guardNamesSnapshot.data!;

          return StreamBuilder<List<PatrolScheduleModel>>(
            stream: _controller.getPatrolSchedule(),
            builder: (context, scheduleSnapshot) {
              if (scheduleSnapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              }

              if (!scheduleSnapshot.hasData) {
                return Center(child: Text('No Patrol Schedule available'));
              }

              List<PatrolScheduleModel> schedule = scheduleSnapshot.data!;

              // Get unique dates from the schedule
              Set<String?> uniqueDates = schedule.map((entry) => entry.day).toSet();

              return ListView(
                children: uniqueDates.map((date) {
                  // Filter the schedule for the current date
                  List<PatrolScheduleModel> filteredSchedule = schedule.where((entry) => entry.day == date).toList();

                  return Card(
                    margin: EdgeInsets.all(20.0),
                    elevation: 6.0,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Text(
                            'Date: $date',
                            style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                          ),
                        ),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: DataTable(
                            columns: [
                              DataColumn(label: Text('Shift')),
                              DataColumn(label: Text('Start Time')),
                              DataColumn(label: Text('Guard')),
                            ],
                            rows: filteredSchedule.map((entry) {
                              List<String> assignedGuardsForSlot = filteredSchedule
                                  .where((e) => e.shift == entry.shift && e.id != entry.id)
                                  .map((e) => e.guardName!)
                                  .toList();

                              List<String> availableGuards = guardNames.where((name) => !assignedGuardsForSlot.contains(name)).toList();

                              return DataRow(cells: [
                                DataCell(Text(entry.shift ?? '')),
                                DataCell(Text(entry.startTime ?? '')),
                                DataCell(
                                  DropdownButton<String>(
                                    value: entry.guardName,
                                    onChanged: (String? newGuardName) async {
                                      if (newGuardName != null) {
                                        await _controller.updatePatrolScheduleGuard(entry.id!, newGuardName);
                                      }
                                    },
                                    items: availableGuards.map<DropdownMenuItem<String>>((String value) {
                                      return DropdownMenuItem<String>(
                                        value: value,
                                        child: Text(value),
                                      );
                                    }).toList(),
                                  ),
                                ),
                              ]);


                            }).toList(),
                          ),
                        ),
                      ],
                    ),
                  );
                }).toList(),
              );
            },
          );
        },
      ),
    );
  }
}



//display only logged in guard schedule

class PatrolScheduleView extends StatefulWidget {
  @override
  _PatrolScheduleViewState createState() => _PatrolScheduleViewState();
}

class _PatrolScheduleViewState extends State<PatrolScheduleView> {
  final PatrolScheduleController _controller = PatrolScheduleController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Patrol Schedule'),
        backgroundColor: Color(0xffe4d7ba),
        titleTextStyle: TextStyle(color: Colors.black, fontSize: 22.0,
          fontWeight: FontWeight.bold,),
        iconTheme: IconThemeData(
          color: Colors.black, // Setting the back button color to black
        ),
      ),
      body: FutureBuilder<String?>(
        future: _controller.fetchGuardName(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }

          if (!snapshot.hasData || snapshot.data == null) {
            return Center(child: Text('No guard logged in.'));
          }

          String guardName = snapshot.data!;

          return StreamBuilder<List<PatrolScheduleModel>>(
            stream: _controller.getPatrolSchedule(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              }

              if (!snapshot.hasData || snapshot.data!.isEmpty) {
                return Center(child: Text('No schedule available for $guardName.'));
              }

              List<PatrolScheduleModel> schedule = snapshot.data!;

              // Filter the schedule based on the guard's name
              List<PatrolScheduleModel> filteredSchedule = schedule.where((s) => s.guardName == guardName).toList();

              if (filteredSchedule.isEmpty) {
                return Center(child: Text('No schedule available for $guardName.'));
              }

              return ListView.builder(
                itemCount: filteredSchedule.length,
                itemBuilder: (context, index) {
                  PatrolScheduleModel scheduleItem = filteredSchedule[index];
                  return Card(
                    color: Color(0xFFFFFFFF),
                    child: ListTile(
                      title: Text(' ${scheduleItem.day}'),
                      subtitle: Text('${scheduleItem.shift} - ${scheduleItem.startTime}'),
                      // Add more details or actions as needed
                    ),
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}


//Display all schedule cannot be edit

class PatrolScheduleViewAll extends StatefulWidget {
  @override
  _PatrolScheduleViewAllState createState() => _PatrolScheduleViewAllState();
}

class _PatrolScheduleViewAllState extends State<PatrolScheduleViewAll> {
  final PatrolScheduleController _controller = PatrolScheduleController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Patrol Schedules'),
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
      body: Center(
        child: Container(
          width: MediaQuery.of(context).size.width * 0.9,
          height: MediaQuery.of(context).size.height * 0.7,
          margin: EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.0),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 2,
                blurRadius: 5,
                offset: Offset(0, 3),
              ),
            ],
          ),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: FutureBuilder<List<PatrolScheduleModel>>(
                future: _controller.getPatrolSchedule().first,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                    return Center(child: Text('No schedules available'));
                  } else if (snapshot.hasError) {
                    return Center(child: Text('Error: ${snapshot.error}'));
                  } else {
                    List<PatrolScheduleModel> schedules = snapshot.data!;
                    return DataTable(
                      columns: const <DataColumn>[
                        DataColumn(label: Text('Date')),
                        DataColumn(label: Text('Shift')),
                        DataColumn(label: Text('Time')),
                        DataColumn(label: Text('Guard Name')),
                      ],
                      rows: schedules.map((schedule) {
                        return DataRow(cells: <DataCell>[
                          DataCell(Text(' ${schedule.day}')),
                          DataCell(Text(schedule.shift ?? 'N/A')),
                          DataCell(Text(schedule.startTime ?? 'N/A')),
                          DataCell(Text(schedule.guardName ?? 'N/A')),
                        ]);
                      }).toList(),
                    );
                  }
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}



