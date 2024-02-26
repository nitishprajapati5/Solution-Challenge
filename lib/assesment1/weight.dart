import 'package:flutter/material.dart';
import 'package:vibration/vibration.dart';
// import 'package:mindfuldost_hub/main.dart';


class WeightPage extends StatefulWidget {
  final Color backgroundColor;
  WeightPage({this.backgroundColor =const Color(0xff251404)});
  @override
  _WeightPageState createState() => _WeightPageState();
}

class _WeightPageState extends State<WeightPage> {
  int _weight = 1;
  // int _weightUnit = 0; // 0 for kg, 1 for lbs

  // final List<String> _weightUnits = ['kg', 'lbs'];

  final List<int> _weights = List<int>.generate(200, (int index) => index + 1);

  void _vibrate() {
    Vibration.vibrate(duration: 50);
  }

  @override
  Widget build(BuildContext context) {
    const title = 'Weight';

    return MaterialApp(
      title: title,
      home: Scaffold(
        backgroundColor: const Color(0xff251404),
        appBar: AppBar(
          title: const Text(title),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'What\'s your weight?',
                style: TextStyle(fontSize: 40,
                color: Colors.white),
              ),
              SizedBox(height: 20),
              Container(
                height: 100,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: _weights.length,
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          _weight = _weights[index];
                          _vibrate();
                        });
                      },
                      child: Container(
                        width: 80,
                        margin: const EdgeInsets.symmetric(horizontal: 8),
                        child: Column(
                          children: [
                            Container(
                              width: 2,
                              height: 20,
                              color: const Color.fromARGB(255, 216, 203, 203), // Bold line
                            ),
                            SizedBox(height: 5),
                            Container(
                              width: 30,
                              height: 30,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: _weight == _weights[index]
                                    ? Color.fromARGB(255, 209, 45, 45)
                                    : Color.fromARGB(255, 176, 168, 168),
                              ),
                              alignment: Alignment.center,
                              child: Text(
                                (index + 1).toString(),
                                style: TextStyle(
                                  fontSize: _weight == _weights[index] ? 24 : 16,
                                  color: _weight == _weights[index]
                                      ? Colors.red
                                      : Colors.white,
                                ),
                              ),
                            ),
                            SizedBox(height: 5),
                            Container(
                              width: 2,
                              height: 20,
                              color: const Color.fromARGB(255, 236, 234, 234), // Bold line
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
              SizedBox(height: 20),
              Container(
                width: 30,
                height: 30,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: const Color.fromARGB(255, 222, 212, 212),
                    width: 2,
                  ),
                ),
                child: Center(
                  child: Text(
                    _weight.toString(),
                    style: TextStyle(
                      fontSize: 20,
                      color: const Color.fromARGB(255, 230, 219, 219),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
              onPressed: () {
                  Navigator.pushReplacementNamed(context, '/home1');
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
      ),
    );
      
    
  }
}
