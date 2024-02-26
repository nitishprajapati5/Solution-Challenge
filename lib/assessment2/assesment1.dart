import 'package:flutter/material.dart';



class MentalHealthAssessmentScreen extends StatefulWidget {
  @override
  _MentalHealthAssessmentScreenState createState() =>
      _MentalHealthAssessmentScreenState();
}

class _MentalHealthAssessmentScreenState
    extends State<MentalHealthAssessmentScreen> {
  int _currentPage = 1;
  String? _previousSelection;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mental Health Assessment'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              '$_currentPage OF 14',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('What\'s your health goal today?',
                    style: TextStyle(color: Colors.white,fontSize: 30),),
                  
                  SizedBox(height: 16.0),
                  Column(
                    children: [
                      _buildRadioButton('I wanna reduce stress',Colors.white),
                      _buildRadioButton('I wanna try Al Therapy',Colors.white),
                      _buildRadioButton('I want to cope with trauma',Colors.white),
                      _buildRadioButton('I want to be a better person',Colors.white),
                      _buildRadioButton('Just trying out the app, mate!',Colors.white),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: _currentPage < 14
          ? Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                // onPressed: () {
                //   setState(() {
                //     _currentPage++;
                //   });
                // },
                 onPressed: () {
                  Navigator.pushReplacementNamed(context, '/assesment2');
                },
                child: Text('Continue'),
              ),
            )
          : null,
    );
  }

  Widget _buildRadioButton(String label,Color color) {
    return Row(
      children: [
        Radio(
          value: label,
          groupValue: _currentPage == 1 ? null : _previousSelection,
          onChanged: (value) {
            setState(() {
              _currentPage == 1 ? _currentPage++ : null;
              _previousSelection = value as String?;
            });
          },
          activeColor: color,
        ),
        Text(label,
        style: TextStyle(color: Colors.white),),
      ],
    );
  }
}