import '../Model/report_model.dart';

class ReportController {
  ReportModel model = ReportModel();

  Future<List<Map<String, dynamic>>> getReportForDay(int year, int month, int day) async {
    return await model.getReportForDay(year, month, day);
  }

  /*Future<List<Map<String, dynamic>>> getReportForMonth(int year, int month) async {
    return await model.getReportForMonth(year, month);
  }

  Future<List<Map<String, dynamic>>> getReportForYear(int year) async {
    return await model.getReportForYear(year);
  }*/

  Future<List<Map<String, dynamic>>> getReportForSelectedDate(String selectedDate) async {
    return await model.getReportForSelectedDate(selectedDate);
    }
}
