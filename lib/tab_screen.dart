import 'package:flutter/material.dart';

class TabScreen extends StatefulWidget {
  const TabScreen({super.key});

  @override
  State<TabScreen> createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 6,
      child: Scaffold(
        appBar: AppBar(
          bottom: const TabBar(
            tabs: [
              Row(children: [Tab(icon: Icon(Icons.directions_car))]),
              Row(children: [Tab(icon: Icon(Icons.directions_transit))]),
              Row(children: [Tab(icon: Icon(Icons.directions_bike))]),
              Row(children: [Tab(icon: Icon(Icons.directions_boat))]),
              Row(children: [Tab(icon: Icon(Icons.directions_railway))]),
              Row(children: [Tab(icon: Icon(Icons.directions_bus))]),
            ],
            isScrollable: true,
          ),
          title: const Text(
            'TabBar Screen',
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: const Color.fromARGB(255, 32, 10, 61),
          iconTheme: const IconThemeData(color: Colors.white),
        ),
        body: TabBarView(
          children: [
            Center(child: const Text('Car')),
            Center(child: const Text('Transit')),
            Center(child: const Text('Bike')),
            Center(child: const Text('Boat')),
            Center(child: const Text('Railway')),
            Center(child: const Text('Bus')),
          ],
        ),
      ),
    );
  }
}
