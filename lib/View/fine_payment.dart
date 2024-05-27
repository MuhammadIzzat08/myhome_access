/**import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:http/http.dart' as http;

class PaymentView extends StatelessWidget {
  final String visitorEmail;

  const PaymentView({Key? key, required this.visitorEmail}) : super(key: key);

  Future<void> initPayment({
    required double amount,
    required BuildContext context,
  }) async {
    try {
      final response = await http.post(
        Uri.parse('https://us-central1-myhomeaccess-365ff.cloudfunctions.net/stripePaymentIntentRequest'), // Replace with your server endpoint
        body: {
          'email': visitorEmail,
          'amount': amount.toString(),
        },
      );

      final jsonResponse = jsonDecode(response.body);

      await Stripe.instance.initPaymentSheet(
        paymentSheetParameters: SetupPaymentSheetParameters(
          paymentIntentClientSecret: jsonResponse['paymentIntent'],
          merchantDisplayName: 'Your Merchant Name',
        ),
      );

      await Stripe.instance.presentPaymentSheet();

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Payment successful')),
      );
    } catch (error) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Payment failed: $error')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Stripe Payment'),
      ),
      body: Center(
        child: ElevatedButton(
          child: const Text('Pay RM30'),
          onPressed: () async {
            await initPayment(
              amount: 30.0,  // The amount can be dynamically set as needed
              context: context,
            );
          },
        ),
      ),
    );
  }
}
**/
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:http/http.dart' as http;
import 'package:cloud_firestore/cloud_firestore.dart';

class PaymentView extends StatelessWidget {
  final String visitorEmail;

  const PaymentView({Key? key, required this.visitorEmail}) : super(key: key);

  Future<void> initPayment({
    required double amount,
    required BuildContext context,
  }) async {
    try {
      final response = await http.post(
        Uri.parse('https://us-central1-myhomeaccess-365ff.cloudfunctions.net/stripePaymentIntentRequest'), // Replace with your server endpoint
        body: {
          'email': visitorEmail,
          'amount': amount.toString(),
        },
      );

      final jsonResponse = jsonDecode(response.body);

      await Stripe.instance.initPaymentSheet(
        paymentSheetParameters: SetupPaymentSheetParameters(
          paymentIntentClientSecret: jsonResponse['paymentIntent'],
          merchantDisplayName: 'MyHome Access',
        ),
      );

      await Stripe.instance.presentPaymentSheet();

      // Update the fined status in Firestore after successful payment
      await updateFinedStatus();

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Payment successful')),
      );
    } catch (error) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Payment failed: $error')),
      );
    }
  }

  Future<void> updateFinedStatus() async {
    final FirebaseFirestore _firestore = FirebaseFirestore.instance;

    try {
      QuerySnapshot querySnapshot = await _firestore
          .collection('visitor')
          .where('visitorEmail', isEqualTo: visitorEmail)
          .get();

      if (querySnapshot.docs.isNotEmpty) {
        await _firestore
            .collection('visitor')
            .doc(querySnapshot.docs.first.id)
            .update({'fined': false});
      }
    } catch (error) {
      print('Error updating fined status: $error');
    }
  }

  /*@override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Fine Payment'),
        backgroundColor: Color(0xffe4d7ba),
        titleTextStyle: TextStyle(color: Colors.black, fontSize: 22.0, fontWeight: FontWeight.bold),
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
      ),
      body: Center(
        child: ElevatedButton(
          child: const Text('Pay RM30'),
          onPressed: () async {
            await initPayment(
              amount: 30.0,  // The amount can be dynamically set as needed
              context: context,
            );
          },
        ),
      ),
    );
  }*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Fine Payment'),
        backgroundColor: Color(0xffe4d7ba),
        titleTextStyle: TextStyle(color: Colors.black, fontSize: 22.0, fontWeight: FontWeight.bold),
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
      ),

      body: Column(
        children: [
          SizedBox(height: 20.0),
          Image.asset(
            'assets/page-1/images/clamp.png', // Replace with your asset path and image
            height: 270.0, // Adjust the height as needed
          ),
          SizedBox(height: 0.0),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Notice: Vehicle Fined',
                        style: TextStyle(
                          fontSize: 24.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.red,
                        ),
                      ),
                      SizedBox(height: 16), // Add spacing between the title and the message
                      Text(
                        'Dear Visitor,\n\n'
                            'We regret to inform you that your vehicle has been clamped and fined due to exceeding the allotted visit time. '
                            'To release the clamp and resolve the fine, we kindly request you to make the necessary payment. '
                            'Your prompt action is appreciated.\n\n'
                            '** After you have made the payment, you are required to inform the guard to unclamp your car.\n\n'
                            'Thank you for your understanding and cooperation.',
                        style: TextStyle(fontSize: 18.0),
                      ),
                    ],
                  ),

                ),
                SizedBox(height: 20.0),
                ElevatedButton(
                  onPressed: () async {
                    await initPayment(
                      amount: 30.0,  // The amount can be dynamically set as needed
                      context: context,
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 15.0),
                    primary: Color(0xfffc3f53), // Background color
                    onPrimary: Colors.white, // Text color
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    elevation: 5.0, // Add some elevation for a subtle shadow
                  ),
                  child: Text(
                    'Proceed Payment',
                    style: TextStyle(fontSize: 18.0),
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
