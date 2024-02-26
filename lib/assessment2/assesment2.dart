import 'package:flutter/material.dart';



class MoodScreen extends StatefulWidget {
  
  @override
  _MoodScreenState createState() => _MoodScreenState();
}

class _MoodScreenState extends State<MoodScreen> {
  String _mood = 'Neutral';

  final List<String> _moods = [
    'Neutral',
    'Happy',
    'Sad',
    'Angry',
    'Anxious',
    'Excited',
    'Tired',
    'Stressed',
    'Depressed',
    'Confused',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: const Color(0xff251404),
      appBar: AppBar(
        title: Text('Mood Screen'),
      ),
      body: Container(
        // color: const Color.fromARGB(255, 133, 60, 60),
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            Text(
              'How would you describe your mood ?',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20.0,
              ),
            ),
            SizedBox(height: 16.0),
            Container(
              height: 80.0,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: _moods.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        _mood = _moods[index];
                      });
                    },
                    child: Container(
                      margin: EdgeInsets.only(right: 8.0),
                      padding: EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                        color: _mood == _moods[index] ? Colors.blue[200] : Colors.white,
                        borderRadius: BorderRadius.circular(8.0),
                        border: Border.all(color: Colors.blue),
                      ),
                      child: Center(
                        child: Text(
                          _moods[index],
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20.0,
                            color: _mood == _moods[index] ? Colors.white : Colors.blue,
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                  Navigator.pushReplacementNamed(context, '/assesment3');
                },
              child: Text('Continue'),
            ),
          ],
        ),
      ),
    );
  }
}