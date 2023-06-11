import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Payment extends StatefulWidget {
  const Payment({Key? key}) : super(key: key);

  @override
  State<Payment> createState() => _PaymentState();
}

class _PaymentState extends State<Payment> {

  int value = 0;
  final paymentLabels = [
    'Credit card / Debit card',
    'Cash On Delivery',
    'Nequi',
  ];

  final paymentIcons = [
    Icons.credit_card,
    Icons.attach_money,
    Icons.payment,
  ];

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size; //setting the width of the device
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.black87,
        title: const Text('Payment', style: TextStyle(color: Colors.amber)),
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.arrow_left,
            color: Colors.amber,
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.separated(
              itemCount: paymentLabels.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: Radio(
                    fillColor: MaterialStateColor.resolveWith(
                        (states) => Colors.black87),
                    value: index,
                    groupValue: value,
                    onChanged: (i) => setState(() => value = i as int),
                  ),
                  title: Text(paymentLabels[index]),
                  trailing: Icon(paymentIcons[index]),
                );
              },
              separatorBuilder: (context, index) {
                return Divider();
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: MaterialButton(
              minWidth: screenSize.width,
              color: Colors.amber,
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
              child: const Text(
                'Pay',
                style: TextStyle(color: Colors.black87),
              ),
              onPressed: () {
                Navigator.pushNamed(context, '/PickDate');
              },
            ),
          )
        ],
      ),
    );
  }
}
