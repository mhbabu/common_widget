import 'package:flutter/material.dart';

class ListViewScreen extends StatefulWidget {
  const ListViewScreen({super.key});

  @override
  State<ListViewScreen> createState() => _ListViewScreenState();
}

class _ListViewScreenState extends State<ListViewScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff6f6f6),
      appBar: AppBar(
        title: const Text(
          'List View Screen',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
        ),
        backgroundColor: const Color(0xff1D1E22),
        iconTheme: const IconThemeData(color: Colors.white),
        elevation: 4,
      ),
      body: ListView(
        children: [
          Container(
            height: 200,
            alignment: Alignment.center,
            color: Colors.orange.shade200,
            margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: const Text('Item 1'),
          ),

          // 👇 Horizontal Category List
          SizedBox(
            height: 130, // increased height for text below
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 10,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    // Circle box
                    Container(
                      width: 80,
                      height: 80,
                      margin: const EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                        color: Colors.green.shade100,
                        shape: BoxShape.circle,
                      ),
                      alignment: Alignment.center,
                      child: Text(
                        '${index + 1}',
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),

                    const SizedBox(
                      height: 5,
                    ), // spacing between circle and text
                    // Text below circle (like category name)
                    Text(
                      'Category ${index + 1}',
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                );
              },
            ),
          ),

          // Other list items
          Container(
            height: 200,
            alignment: Alignment.center,
            color: Colors.orange.shade200,
            margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: const Text('Item 2'),
          ),
          Container(
            height: 200,
            alignment: Alignment.center,
            color: Colors.orange.shade200,
            margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: const Text('Item 3'),
          ),
          Container(
            height: 200,
            alignment: Alignment.center,
            color: Colors.orange.shade200,
            margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
            child: const Text('Item 4'),
          ),
        ],
      ),
    );
  }
}
