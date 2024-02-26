import 'package:flutter/material.dart';

class Homepage extends StatefulWidget {
  final String username;    
  Homepage({required this.username});
  @override
  _homepageState createState() => _homepageState();
}
class _homepageState extends State<Homepage> {

  // String username = 'User';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  MyTabBar1(username: widget.username,),
          );
        
      
     
  }
}

class MyTabBar1 extends StatefulWidget{
    final String username;    
  MyTabBar1({required this.username});
  // const TabBar({super.key});
  // const MyTabBar({Key? key}) : super(key: key);
  @override
  _MyTabBarState createState() => _MyTabBarState();
}

class _MyTabBarState extends State<MyTabBar1> with SingleTickerProviderStateMixin{
  late TabController _tabController;

  @override
  void initState(){
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }
  @override
  Widget build(BuildContext context){
    return DefaultTabController(
        length: 3,
        child: Scaffold(
          bottomNavigationBar: BottomAppBar(
            
              child:TabBar(
                controller: _tabController,
                tabs: [
                Tab(icon: Icon(Icons.home)),
              
                Tab(icon: Icon(Icons.chat)),
                Tab(icon: Icon(Icons.health_and_safety_rounded)),
               ],
              ),
            ),
            // title: const Text('Home'),
          
          body:TabBarView(
            controller: _tabController,
            physics: NeverScrollableScrollPhysics(),
              children: [
                // for home page
                HomeTab( username: widget.username, hasMembership: true,),

                
                // Icon(Icons.home),
                
                // for chat page
                ChatTab(),
                
                // Icon(Icons.chat),
                // for assesment page
                AssesmentTab(),
                
                // Icon(Icons.account_circle_outlined),
              ]
              ),
            ),
         ); 
  }
}

class HomeTab extends StatefulWidget {
  final String username;
    final bool hasMembership;


  HomeTab({required this.username, this.hasMembership = false});
  @override
  _HomeTabState createState() => _HomeTabState();

}

class _HomeTabState extends State<HomeTab> {
  @override
  Widget build(BuildContext context) {
     final w = MediaQuery.of(context).size.width;
    final h = MediaQuery.of(context).size.height;
    return Scaffold(
      // padding: EdgeInsets.all(30),
      // child: Column(
        body: Stack(
        children: [
        Positioned(
          top: -650,
          // left: (w - 280) / 2
          left: -235,
          child: const CircleWidget(),
        ),
         Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            
          Padding(padding: EdgeInsets.symmetric(vertical: 55, horizontal: 30),
          child:Row(
            children: [
              Icon(Icons.calendar_today, color: Colors.white, size: 25),
              SizedBox(width: 8),
              Text(
                '${DateTime.now().day}/${DateTime.now().month}/${DateTime.now().year}',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                ),
              ),
              
            ],
          ),
          ),
          
          // SizedBox(height: 0),
          Padding(padding:EdgeInsets.symmetric(vertical:1, horizontal: 30),
          child:Row(
            children: [
              CircleAvatar(
                child: Icon(Icons.person, size: 62),
                
                radius: 30,
              ),
              SizedBox(width: 20),
              Text(
                'Hello, ${widget.username}!',
                style: TextStyle(fontSize: 40, color: Colors.white),
              ),
            ],
          ),
          ),
          Padding(padding:EdgeInsets.symmetric(vertical: 10, horizontal: 100),
          child:Row(
            children: [
              Icon(Icons.star, color: Colors.white, size: 20),
              SizedBox(width: 8),
          Text(
               widget.hasMembership ? 'Premium Member' : 'Free Member',
               style: TextStyle(fontSize: 15, color: Colors.white),
              ),
          
          ],
          ),
          ),
          Image.asset('assets/images/loading screen3/frame2.png', width: 485, height: 70),
        ],
      ),

       ],
       
      ),
      
       );
  
    // );
  
  }
}

class CircleWidget extends StatelessWidget {
  const CircleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 960,
      height: 960,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.green,
                
              
          ),
      );
  }
}

class ChatTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text('Chat Tab',
        style: TextStyle(color: Colors.blue,fontSize: 25),),
      ),
    );
  }
}
class AssesmentTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: Container(
        padding: EdgeInsets.all(55.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Assessment Test',
              style: TextStyle(fontSize: 34.0, fontWeight: FontWeight.bold,color: Colors.white),
              textAlign: TextAlign.center,
            ),
            // SizedBox(height: 16.0),
            // Expanded(child:Center(
            //   child: Image.asset(
            //     'assets/images/assesment/assesment.png', // Replace with your image path
            //     width: 200,
            //     height: 200,
            //   ),
            // ),
            // ),
            
            SizedBox(height: 200.0),
            Text(
              'Step into the realm of self-discovery.\n The journey to better mental health begins with a single assessment.',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 35.0,color: Colors.green),
            ),
            SizedBox(height: 100.0),
            ElevatedButton(
              onPressed: () {
                // Add functionality for the continue button
                Navigator.pushReplacementNamed(context,'/assesment1');
                
              },
              child: Text('Continue',
              style: TextStyle(fontSize: 24.0),
              ),
            ),
          ],
        ),
      ),
    );
  }
}