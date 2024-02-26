import 'package:flutter/material.dart';
// import 'gender.dart';


class AgeAssessment extends StatefulWidget {
  @override
  _AgeAssessmentState createState() => _AgeAssessmentState();
}

class _AgeAssessmentState extends State<AgeAssessment> {
  int _selectedAge = 16;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Age Assessment'),
        backgroundColor: Color.fromARGB(255, 241, 151, 16),
      ),
      
      body:
     Container(
        // color: Color.fromARGB(203, 174, 3, 3),
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            Text(
              'What\'s your age?',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Color(0xFF2E4A6A),
              ),
            ),
            
            SizedBox(height: 20),
            Expanded(
            child:Center(
              child:
            
            ListWheelScrollView(
              itemExtent: 150, // Increased itemExtent for better visibility
              diameterRatio: 4, 
              // magnification: 1.5,// Adjust the diameterRatio for better visibility
              onSelectedItemChanged: (index) {
                setState(() {
                  _selectedAge = 0 + index;
                  
                });
              },
              children: List.generate(101, (index) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      _selectedAge = 0 + index;
                    });
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: _selectedAge == 0 + index
                          ? Colors.green
                          : Colors.white,
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 10,
                          spreadRadius: 5,
                          offset: Offset(0, 3),
                          
                        ),
                      ],
                    ),
                    padding: EdgeInsets.symmetric(vertical: 50, horizontal: 105),
                    margin: EdgeInsets.only(bottom: 15),
                    child: Text(
                      '${0 + index}',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: _selectedAge == 0 + index
                            ? Colors.white
                            : Color(0xFF2E4A6A),
                      ),
                    ),
                  ),
                
                );
              }
              ),
            ),
            ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                  Navigator.pushReplacementNamed(context, '/gender');
                },
                
              style: ElevatedButton.styleFrom(
                primary: Color.fromARGB(255, 227, 146, 16),
                minimumSize: Size(double.infinity, 60),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              child: Text(
                'Continue →',
                style: TextStyle(
                  fontSize: 30,
                  color: Colors.white,
                ),
              ),
            ),
          ],
            ),
          

          


        ),
      );
    
  }
}
