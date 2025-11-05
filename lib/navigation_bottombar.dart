import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  /***********************
    BOTTOM NAVIGATION BAR
   ***********************/
  int _selectedIndex = 0;
  List<Widget> _pages = [
    Container(color: Colors.red),
    Container(color: Colors.green),
    Container(color: Colors.blue),
    Container(color: Colors.deepOrange),
    Container(color: Colors.indigo),
  ];

 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Common Widget',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: const Color.fromARGB(255, 32, 10, 61),
        iconTheme: const IconThemeData(
          color: Colors.white,
        ), // 👈 This fixes the arrow color
      ),

      /*********************************
       BOTTOM NAVIGATION BAR START HERE
       *********************************/
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: [
          BottomNavigationBarItem(
            label: '',
            icon: SvgPicture.asset('assets/images/home-svgrepo-com.svg'),
          ),
          BottomNavigationBarItem(
            label: '',
            icon: SvgPicture.asset('assets/images/search-svgrepo-com.svg'),
          ),
          BottomNavigationBarItem(
            label: '',
            icon: SvgPicture.asset('assets/images/plus-circle-svgrepo-com.svg'),
          ),
          BottomNavigationBarItem(
            label: '',
            icon: SvgPicture.asset('assets/images/user-svgrepo-com.svg'),
          ),
          BottomNavigationBarItem(
            label: '',
            icon: Container(
              height: 30,
              width: 30,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/profile.jpg'),
                ),
                shape: BoxShape.circle,
              ),
            ),
          ),
        ],
      )
      
    );
  }
}
