import 'package:flutter/material.dart';

class BottomSheetScreen extends StatefulWidget {
  const BottomSheetScreen({super.key});

  @override
  State<BottomSheetScreen> createState() => _BottomSheetScreenState();
}

class _BottomSheetScreenState extends State<BottomSheetScreen> {
  Future _displayBottomModalSheet(BuildContext context) {
    return showModalBottomSheet(
      context: context,
      backgroundColor: Colors.blue,
      barrierColor: Colors.black87.withOpacity(0.5),
      // isDismissible: false,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
      ),
      builder: (context) => Container(
        height: 200,
        child: Center(
          child: Text(
            'Flutter Guy',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'BottomSheetScreen',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: const Color.fromARGB(255, 32, 10, 61),
        iconTheme: const IconThemeData(
          color: Colors.white,
        ), // 👈 This fixes the arrow color
      ),
      body: SafeArea(
        child: Center(
          child: MaterialButton(
            height: 50,
            minWidth: 200,
            color: const Color(0xff1D1E22),
            onPressed: () {
              _displayBottomModalSheet(context);
            },
            child: const Text('OPEN', style: TextStyle(color: Colors.white)),
          ),
        ),
      ),
    );
  }
}
