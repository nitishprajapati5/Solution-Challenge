import 'package:flutter/material.dart';



class HelpScreen extends StatefulWidget {
  @override
  _HelpScreenState createState() => _HelpScreenState();
}

class _HelpScreenState extends State<HelpScreen> {
  bool _helpBefore = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Help Screen'),
      ),
      body: Container(
        // color: Colors.grey[200],
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            Text(
              'Ⓒ',
              style: TextStyle(
                fontSize: 36.0,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
            SizedBox(height: 30.0),
            Text(
              'Assessment',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 40.0,
                color: Colors.blue,
              ),
            ),
            SizedBox(height: 30.0),
            Text(
              'Have you sought professional help before?',
              style: TextStyle(
                fontSize: 22.0,
                color: Colors.blue,
              ),
            ),
            SizedBox(height: 40.0),
            Row(
              children: <Widget>[
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        _helpBefore = true;
                      });
                    },
                    child: Container(
                      height: 60.0,
                      decoration: BoxDecoration(
                        color: _helpBefore ? Colors.blue[200] : Colors.white,
                        borderRadius: BorderRadius.circular(8.0),
                        border: Border.all(color: Colors.blue),
                      ),
                      child: Center(
                        child: Text(
                          'Yes',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20.0,
                            color: _helpBefore ? Colors.white : Colors.blue,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 16.0),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        _helpBefore = false;
                      });
                    },
                    child: Container(
                      height: 60.0,
                      decoration: BoxDecoration(
                        color: _helpBefore ? Colors.white : Colors.blue[200],
                        borderRadius: BorderRadius.circular(8.0),
                        border: Border.all(color: Colors.blue),
                      ),
                      child: Center(
                        child: Text(
                          'No',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20.0,
                            color: _helpBefore ? Colors.blue : Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                  Navigator.pushReplacementNamed(context, '/assesment4');
                },
              child: Text('Continue →'),
            ),
            SizedBox(height: 16.0),
            Text(
              '6 OF 14',
              style: TextStyle(
                fontSize: 20.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}