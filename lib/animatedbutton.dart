import 'package:flutter/material.dart';

class NeuBotton extends StatelessWidget {
  final onTap;
  final onTap1;
  final redirectP;
  final redirectB;
  bool isPressed;
  bool isPressed1;

  NeuBotton(
      {this.redirectB,
      this.redirectP,
      this.onTap1,
      this.onTap,
      required this.isPressed,
      required this.isPressed1});
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: onTap,
          child: AnimatedContainer(
            duration: Duration(milliseconds: 200),
            height: 180,
            width: 180,
            onEnd: redirectP,
            decoration: BoxDecoration(
                color: isPressed ? Colors.grey[400] : Colors.black87,
                borderRadius: BorderRadius.circular(12),
                boxShadow: isPressed
                    ? [
                        //No shadows if the button is pressed
                      ]
                    : [
                        //Dark shadow at bottom right
                        BoxShadow(
                          color: Colors.grey.shade500,
                          offset: Offset(6, 6),
                          blurRadius: 9,
                          spreadRadius: 1,
                        ),

                        //Light Shadow at top left
                        BoxShadow(
                          color: Colors.white,
                          offset: Offset(-6, -6),
                          blurRadius: 9,
                          spreadRadius: 1,
                        ),
                      ]),
            child: Column(
              children: [
                SizedBox(height: 8,),
                Icon(
                  Icons.person,
                  size: 130,
                  color: isPressed ? Colors.grey[400] : Colors.amber,
                ),
                SizedBox(height: 5,),
                Text(
                  'Cliente',
                  style: TextStyle(
                      color: isPressed ? Colors.grey[400] : Colors.amber,
                      fontFamily: 'CrimsonText',
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        GestureDetector(
          onTap: onTap1,
          child: AnimatedContainer(
              duration: Duration(milliseconds: 200),
              height: 180,
              width: 180,
              onEnd: redirectB,
              decoration: BoxDecoration(
                  color: isPressed1 ? Colors.grey[400] : Colors.black87,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: isPressed1
                      ? [
                          //No shadows
                        ]
                      : [
                          //Dark shadow at bottom right
                          BoxShadow(
                            color: Colors.grey.shade500,
                            offset: Offset(6, 6),
                            blurRadius: 9,
                            spreadRadius: 1,
                          ),

                          //Light Shadow at top left
                          BoxShadow(
                            color: Colors.white,
                            offset: Offset(-6, -6),
                            blurRadius: 9,
                            spreadRadius: 1,
                          ),
                        ]),
              child: Column(
                children: [
                  SizedBox(height: 8,),
                  Icon(
                    Icons.assignment_ind,
                    size: 130,
                    color: isPressed1 ? Colors.grey[400] : Colors.amber,
                  ),
                  SizedBox(height: 5,),
                  Text(
                    'Barberia/Tatuador',
                    style: TextStyle(
                        color: isPressed ? Colors.grey[400] : Colors.amber,
                        fontFamily: 'CrimsonText',
                        fontWeight: FontWeight.bold),
                  ),
                ],
              )),
        ),
      ],
    );
  }
/*      children: [
        GestureDetector(
          onTap: onTap,
          child: Container(
            height: 160,
            width: 160,
            decoration: BoxDecoration(
                color: Colors.grey[150],
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  //Dark shadow at bottom right
                  BoxShadow(
                    color: Colors.grey.shade500,
                    offset: Offset(6, 6),
                    blurRadius: 15,
                    spreadRadius: 1,
                  ),

                  //Light Shadow at top left
                  BoxShadow(
                    color: Colors.white,
                    offset: Offset(6, 6),
                    blurRadius: 15,
                    spreadRadius: 1,
                  ),
                ]),
            child: const Icon(
              Icons.assignment_ind,
              size: 60,
              color: Colors.amber,
            ),
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        GestureDetector(
          onTap: onTap,
          child: Container(
            height: 160,
            width: 160,
            decoration: BoxDecoration(
                color: Colors.grey[150],
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  //Dark shadow at bottom right
                  BoxShadow(
                    color: Colors.grey.shade500,
                    offset: Offset(6, 6),
                    blurRadius: 15,
                    spreadRadius: 1,
                  ),

                  //Light Shadow at top left
                  BoxShadow(
                    color: Colors.white,
                    offset: Offset(6, 6),
                    blurRadius: 15,
                    spreadRadius: 1,
                  ),
                ]),
            child: const Icon(
              Icons.assignment_ind,
              size: 60,
              color: Colors.amber,
            ),
          ),
        ),
      ],*/
}
