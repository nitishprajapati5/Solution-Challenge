import 'package:flutter/material.dart';



class medications extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: const Color(0xff251404),
        appBar: AppBar(
          title: Text('Medications'),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(26.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  'Are you taking any medications ?',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SquareButton(
                      onPressed: () {},
                      title: 'Prescribed Medications',
                    ),
                    SquareButton(
                      onPressed: () {},
                      title: 'I\'m not taking any',
                    ),
                  ],
                ),
               
               
                SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                     SquareButton(onPressed: (){}, title: 'Over the counter supplements',),
                    SquareButton(
                      onPressed: () {},
                      title: 'Prefer not to say',
                    ),

                    
                  ],
                ),
                SizedBox(height: 50),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SquareButton(
                      onPressed: () {
                        Navigator.pushReplacementNamed(context, '/home1');
                      },
                      title: 'Continue →',
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// class SquareButton extends StatelessWidget {
//   final VoidCallback onPressed;
//   final String title;

//   const SquareButton({required this.onPressed, required this.title});

//   @override
//   Widget build(BuildContext context) {
//     return ElevatedButton(
//       onPressed: onPressed,
//       style: ElevatedButton.styleFrom(
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(10),
//         ),
//         padding: EdgeInsets.symmetric(vertical: 50, horizontal: 25),
//       ),
//       child: Text(
//         title,
//         style: TextStyle(fontSize: 16),
//       ),
//     );
//   }
// }

class SquareButton extends StatefulWidget {
  final VoidCallback onPressed;
  final String title;

  const SquareButton({
    required this.onPressed,
    required this.title,
  });

  @override
  _SquareButtonState createState() => _SquareButtonState();
}

class _SquareButtonState extends State<SquareButton> {
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        setState(() {
          isSelected = !isSelected;
        });
        widget.onPressed();
      },
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
          side: BorderSide(
            color: isSelected ? Colors.blue : const Color.fromARGB(0, 96, 24, 24),
          ),
        ),
        padding: EdgeInsets.symmetric(vertical: 50, horizontal: 25),
        primary: isSelected ? Colors.blue : null,
      ),
      child: Text(
        widget.title,
        style: TextStyle(
          fontSize: 16,
          color: isSelected ? Colors.white : null,
        ),
      ),
    );
  }
}
