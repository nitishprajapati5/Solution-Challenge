import 'package:flutter/material.dart';

class GenderScreen extends StatefulWidget {
  @override
  _GenderScreenState createState() => _GenderScreenState();
}

class _GenderScreenState extends State<GenderScreen> {
  String selectedGender = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Gender'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'What\'s your gender?',
              style: TextStyle(fontSize: 40,
              color: Color.fromARGB(255, 237, 117, 12)
              )
              ,
            ),
            SizedBox(height: 20),
            buildGenderButton('Male'),
            SizedBox(height: 20),
            buildGenderButton('Female'),
            SizedBox(height: 20),
            buildGenderButton('Prefer to Skip'),
            SizedBox(height: 20),

            // Container(
            //   alignment: Alignment.center,
            //   child:ButtonBar(
            //   layoutBehavior: ButtonBarLayoutBehavior.constrained,
            //   buttonMinWidth: 200.0,
            // children: [
            ElevatedButton(
              onPressed: () {
                if (selectedGender.isNotEmpty) {
                  print('Selected Gender: $selectedGender');
                  Navigator.pushReplacementNamed(context, '/weight');

                  
                } else {
                  print('Please select a gender.');
                }
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.blue,
                minimumSize: Size(200.0, 60),
              ),
              child: Text('Continue'),
            ),
          ],
              )
        ),
  
        //   ],
        // ),
  
      );
    

  }
  
    

    


  Widget buildGenderButton(String gender) {
    return ElevatedButton(
      onPressed: () {
        setState(() {
          selectedGender = gender;
        });
      },
      style: ElevatedButton.styleFrom(
        primary: selectedGender == gender ? Colors.blue : null,
        minimumSize: Size(double.infinity, 60),
      ),
      child: Text(gender),
    );
  }
}
