import 'package:flutter/material.dart';

class AnimatedDialogueScreen extends StatefulWidget {
  const AnimatedDialogueScreen({super.key});

  @override
  State<AnimatedDialogueScreen> createState() => _AnimatedDialogueScreenState();
}

class _AnimatedDialogueScreenState extends State<AnimatedDialogueScreen> {
  void _openAnimatedDialogue(BuildContext context) {
    showGeneralDialog(
      context: context,
      barrierDismissible: true, // 👈 allows closing by tapping outside
      barrierLabel: 'Dialog',
      transitionDuration: const Duration(
        milliseconds: 400,
      ), // 👈 smooth animation
      pageBuilder: (context, animation1, animation2) {
        return const SizedBox.shrink(); // placeholder, actual UI below
      },
      transitionBuilder: (context, a1, a2, widget) {
        final curvedValue =
            Curves.easeInOut.transform(a1.value) - 1.0; // 👈 for smooth scale

        return Transform(
          transform: Matrix4.translationValues(0.0, curvedValue * -50, 0.0),
          child: Opacity(
            opacity: a1.value,
            child: AlertDialog(
              title: const Text('Hello 👋'),
              content: const Text('Hi, I’m Mahadi Hassan Babu'),
              shape: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16.0),
                borderSide: BorderSide.none,
              ),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text('Close'),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Animated Dialogue',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: const Color.fromARGB(255, 32, 10, 61),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Center(
            child: MaterialButton(
              height: 50,
              minWidth: 200,
              color: const Color(0xff1D1E22),
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10),
                ),
              ),
              onPressed: () => _openAnimatedDialogue(context), // ✅ fixed
              child: const Text(
                'Animated Dialogue',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
