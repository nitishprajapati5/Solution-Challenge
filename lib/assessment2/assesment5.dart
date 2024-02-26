import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';
import 'package:syncfusion_flutter_core/theme.dart';


class MentalHealthAssessment extends StatefulWidget {
  @override
  _RangesliderState createState() => _RangesliderState();
}

class _RangesliderState extends State<MentalHealthAssessment> {
  double _selectvalue = 8.0;

@override
Widget build(BuildContext context) {
  return Scaffold(
    //  SizedBox(height: 20),
     body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children:[

        Text( 
          'How would you rate your sleep quality?',
        style: TextStyle(fontSize: 24,color: Colors.orange,fontWeight: FontWeight.bold,fontStyle: FontStyle.italic,fontFamily: 'Roboto')
        ),
        SizedBox(height: 60),
        Container(
          height: 500,
          // width: 600,
          child:
          SfSliderTheme(
            data: SfSliderThemeData(
                    activeTrackHeight: 35,
                    inactiveTrackHeight: 30,
                    activeDividerRadius: 0,
                    inactiveDividerRadius: 20,
                    thumbRadius: 32,
                    thumbColor: Colors.orange,
                  ),
     
     child:SfSlider.vertical(

       min: 0.0,
       max: 12.0,
       value: _selectvalue,
       stepSize: 3.0,
       interval: 20,
       showTicks: true,
       showLabels: true,
       minorTicksPerInterval: 1,
       thumbIcon: Icon(Icons.bedtime),
       showDividers: true,
       activeColor: Colors.orange,
        inactiveColor: Color.fromARGB(255, 167, 207, 22).withOpacity(0.5),
       onChanged: (dynamic values){
         setState(() {
            _selectvalue = values as double;
         });
       },
     ),
        ),
        ),
      SizedBox(height: 80),
      Text('You selected: $_selectvalue hours',
      style: TextStyle(fontSize: 18,color: Colors.orange,fontWeight: FontWeight.bold,fontStyle: FontStyle.italic,fontFamily: 'Roboto')),
      SizedBox(height: 20),
      ElevatedButton(
       onPressed: () {
                  Navigator.pushReplacementNamed(context, '/assesment6');
                },
        child: Text('Continue'),
      ),
      ]
    ),
   );
}
}