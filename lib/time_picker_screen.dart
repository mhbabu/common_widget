import 'package:flutter/material.dart';

class TimePickerScreen extends StatefulWidget {
  const TimePickerScreen({super.key});

  @override
  State<TimePickerScreen> createState() => _TimePickerScreenState();
}

class _TimePickerScreenState extends State<TimePickerScreen> {
  TimeOfDay _timeOfDay = TimeOfDay(hour: 12, minute: 10); // TimeOfDay.now()

  Future<void> _selectTime() async {
    TimeOfDay? _picked = await showTimePicker(
      initialTime: _timeOfDay,
      context: context,
    );

    if (_picked != null) {
      setState(() {
        _timeOfDay = _picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Time Picker Screen',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
        ),
        backgroundColor: const Color(0xff1D1E22),
        iconTheme: const IconThemeData(color: Colors.white),
        elevation: 4,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              _timeOfDay.hour.toString() +
                  ':' +
                  _timeOfDay.minute.toString().padLeft(2, '0'),
              style: const TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 20),
            MaterialButton(
              height: 50,
              minWidth: 150,
              onPressed: () {
                _selectTime();
              },
              color: const Color(0xff1D1E22),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              child: const Text(
                'Open Time Picker',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
