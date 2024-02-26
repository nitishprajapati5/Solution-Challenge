// import 'dart:math';

import 'package:flutter/material.dart';

class DistressScreen extends StatefulWidget {
  @override
  _DistressScreenState createState() => _DistressScreenState();
}

class _DistressScreenState extends State<DistressScreen> {
  bool _physicalDistress = false;
  String _physicalPainLocation = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Distress Screen'),
      ),
      body: Container(
        // color: Colors.grey[200],
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            Text(
              'Assessment',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20.0,
                color: Colors.blue,
              ),
            ),
            SizedBox(height: 20.0),
            Text(
              'Are you experiencing any physical distress?',
              style: TextStyle(
                fontSize: 20.0,
                color: Colors.blue,
              ),
            ),
            SizedBox(height: 20.0),
            
            // children: <Widget>[
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        _physicalDistress = true;
                      });
                    },
                    child: Container(
                      height: 30.0,
                      decoration: BoxDecoration(
                        color: _physicalDistress ? Colors.blue[200] : Color.fromRGBO(37, 20, 4, 1),
                        borderRadius: BorderRadius.circular(8.0),
                        border: Border.all(color: Colors.blue),
                      ),
                      child: Center(
                        child: 
                        Column(
                          children: <Widget>[
                            SizedBox( height: 80,),
                            Icon(Icons.check_circle, color: _physicalDistress ? Colors.white : Colors.blue, size: 50,),
                            Text(
                              'Yes, one or multiple',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 30.0,
                                color: _physicalDistress ? Color.fromRGBO(37, 20, 4, 1): Colors.blue,
                              ),
                            ),
                            SizedBox( height: 40),
                            
                            Text(
                              '  I\'m experiencing physical pain in different places \n  over my body.',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 15.0,
                                color: _physicalDistress ? Color.fromRGBO(37, 20, 4, 1) : Colors.blue,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 20.0, height: 20,),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        _physicalDistress = false;
                        _physicalPainLocation = '';
                      });
                    },
                    child: Container(
                      height: 30.0,
                      decoration: BoxDecoration(
                        color: _physicalDistress ? Color.fromRGBO(37, 20, 4, 1) : Colors.blue[200],
                        borderRadius: BorderRadius.circular(15.0),
                        border: Border.all(color: Colors.blue),
                      ),
                      child: Center(
                        child:
                        Column(
                          children: <Widget>[
                            SizedBox( height: 80,),
                        Icon(Icons.cancel_outlined, color: _physicalDistress ? Colors.blue : Color.fromRGBO(37, 20, 4, 1), size: 50,), 
                        Text(
                          'No Physical Pain At All',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 30.0,
                            color: _physicalDistress ? Colors.blue : Color.fromRGBO(37, 20, 4, 1),
                          ),
                        ),
                        SizedBox( height: 40,width: 20),
                            
                            Text(
                              '  I\’m not experiencing any physical pain in my \n  body at all :)',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 15.0,
                                color: _physicalDistress ? Colors.blue : Color.fromRGBO(37, 20, 4, 1),
                              ),
                            ),
                          ],
                      ),
                    ),
                  ),
                ),
                ),
              // ],
            
            SizedBox(height: 20.0),
            // _physicalDistress
            //     ? TextField(
            //         decoration: InputDecoration(
            //           hintText: 'Enter physical pain location...',
            //         ),
            //         onChanged: (value) {
            //           setState(() {
            //             _physicalPainLocation = value;
            //           });
            //         },
            //       )
            //     : Container(),
            // SizedBox(height: 20.0),
            // ElevatedButton(
            //   onPressed: () {
            //     // Continue button pressed
            //     print('Physical Distress: $_physicalDistress');
            //     print('Pain Location: $_physicalPainLocation');
            //   },
            ElevatedButton(
               onPressed: () {
                  Navigator.pushReplacementNamed(context, '/assesment5');
                },
              //() {
              //   // Continue button pressed
              //   print('Physical Distress: $_physicalDistress');
              //   print('Pain Location: $_physicalPainLocation');

              // },
              child: Text('Continue →'),
            ),
          ],

        ),
      ),
    );
  }
}
