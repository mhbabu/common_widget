import 'package:flutter/material.dart';

class DropDownScreen extends StatefulWidget {
  const DropDownScreen({super.key});

  @override
  State<DropDownScreen> createState() => _DropDownScreenState();
}

class _DropDownScreenState extends State<DropDownScreen> {
  String _dropdownValue = '1';
  final List<String> _items = ['1', '2', '3', '4', '5'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Dropdown Screen',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
        ),
        backgroundColor: const Color(0xff1D1E22),
        iconTheme: const IconThemeData(color: Colors.white),
        elevation: 4,
      ),
      body: SafeArea(
        child: Center(
          child: Container(
            width: 150,
            height: 70,
            decoration: BoxDecoration(
              color: const Color(0xffEBEDFE),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Center(
              child: DropdownButton<String>(
                value: _dropdownValue,
                items: _items.map((String item) {
                  return DropdownMenuItem(value: item, child: Text(item));
                }).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    _dropdownValue = newValue!;
                  });
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
