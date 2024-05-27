import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../Controller/visitor_vehicle.dart';

class PaymentTransactionsView extends StatelessWidget {
  final VisitorVehicleController _controller = VisitorVehicleController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Payment Transactions"),
        backgroundColor: Color(0xffe4d7ba),
        titleTextStyle: TextStyle(color: Colors.black, fontSize: 22.0, fontWeight: FontWeight.bold),
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
      ),
      body: StreamBuilder(
        stream: _controller.getPaymentTransactions(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return Text('Something went wrong');
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator();
          }

          return ListView(
            children: snapshot.data!.docs.map((DocumentSnapshot document) {
              Map<String, dynamic> data = document.data()! as Map<String, dynamic>;
              return ListTile(
                title: Text('${data['visitorName']} already paid the fine'),
                subtitle: Text('Vehicle Type: ${data['vehicleType']} - Plate Number: ${data['plateNumber']}'),
                trailing: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    Text('Start: ${_formatDateTime(data['accessStartTime'])}'),
                    Text('End: ${_formatDateTime(data['accessEndTime'])}'),
                  ],
                ),
              );
            }).toList(),
          );
        },
      ),
    );
  }

  String _formatDateTime(dynamic dateTime) {
    if (dateTime is Timestamp) {
      DateTime dt = dateTime.toDate();
      final formatter = DateFormat('yyyy-MM-dd HH:mm:ss').format(dt);
      return formatter;
    } else if (dateTime is String) {
      return dateTime;
    }
    return 'Invalid date';
    }
}