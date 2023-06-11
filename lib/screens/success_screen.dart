import 'package:flutter/material.dart';

class Success extends StatefulWidget {
  const Success({Key? key}) : super(key: key);

  @override
  State<Success> createState() => _SuccessState();
}

class _SuccessState extends State<Success> {
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Image(image: AssetImage('Assets/Pay_success.gif')),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text('Payment successfully!',style: TextStyle(color: Colors.blueGrey),),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10,right: 20,left: 20),
            child: MaterialButton(
              height: 40,
              minWidth: screenSize.width,
              color: Colors.amber,
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
              child: const Text(
                'Thanks!',
                style: TextStyle(color: Colors.black87,fontSize: 18),
              ),
              onPressed: () {
                Navigator.pushNamed(context, '/BarberList');
              },
            ),
          )
        ],
      ),
    );
  }
}
