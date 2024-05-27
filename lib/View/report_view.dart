import 'package:flutter/material.dart';
import '../Controller/report_controller.dart';

class ReportScreen extends StatelessWidget {
  final ReportController _controller = ReportController();

  @override
  Widget build(BuildContext context) {
    int selectedYear = 2023;
    int selectedMonth = 12;
    int selectedDay = 1;

    return Scaffold(
      appBar: AppBar(
        title: Text('Report'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () async {
                List<Map<String, dynamic>> data = await _controller.getReportForDay(selectedYear, selectedMonth, selectedDay);
                _showData(context, data);
              },
              child: Text('Fetch Daily Report'),
            ),
            /*ElevatedButton(
              onPressed: () async {
                List<Map<String, dynamic>> data = await _controller.getReportForMonth(selectedYear, selectedMonth);
                _showData(context, data);
              },
              child: Text('Fetch Monthly Report'),
            ),
            ElevatedButton(
              onPressed: () async {
                List<Map<String, dynamic>> data = await _controller.getReportForYear(selectedYear);
                _showData(context, data);
              },
              child: Text('Fetch Yearly Report'),
            ),*/
          ],
        ),
      ),
    );
  }

  void _showData(BuildContext context, List<Map<String, dynamic>> data) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Report'),
            content: SingleChildScrollView(
              child: Column(
                children: data.map((entry) {
                  return ListTile(
                    title: Text(entry['day'] ?? 'No Date'),
                    subtitle: Text('${entry['guardName']?? 'No Guard'} - ${entry['shift']} - ${entry['startTime']}'),
                  );
                }).toList(),
              ),
            ),
            actions: [
              ElevatedButton(
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
