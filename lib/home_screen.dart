import 'package:flutter/material.dart';
import 'package:my_widget/animated_dialogue_screen.dart';
import 'package:my_widget/bottom_sheet_screen.dart';
import 'package:my_widget/dismissable_screen.dart';
import 'package:my_widget/drawer_screen.dart';
import 'package:my_widget/dropdown_screen.dart';
import 'package:my_widget/image_picker_screen.dart';
import 'package:my_widget/image_screen.dart';
import 'package:my_widget/navigationbar_screen.dart';
import 'package:my_widget/step_screen.dart';
import 'package:my_widget/tab_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Common Widget',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: const Color.fromARGB(255, 32, 10, 61),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                _buildButton(
                  context,
                  icon: Icons.stairs,
                  label: 'Goto Step Page',
                  page: const StepScreen(),
                ),
                const SizedBox(height: 12),
                _buildButton(
                  context,
                  icon: Icons.navigation,
                  label: 'Goto Navigation Page',
                  page: const NagivationScreen(),
                ),
                const SizedBox(height: 12),
                _buildButton(
                  context,
                  icon: Icons.view_agenda,
                  label: 'Goto Bottom Sheet Page',
                  page: const BottomSheetScreen(),
                ),
                const SizedBox(height: 12),
                _buildButton(
                  context,
                  icon: Icons.image,
                  label: 'Goto Image Picker Page',
                  page: const ImagePrickerScreen(),
                ),
                const SizedBox(height: 12),
                _buildButton(
                  context,
                  icon: Icons.animation,
                  label: 'Goto Animated Dialogue',
                  page: const AnimatedDialogueScreen(),
                ),
                const SizedBox(height: 12),
                _buildButton(
                  context,
                  icon: Icons.image_aspect_ratio,
                  label: 'Goto Images Screen',
                  page: const ImageScreen(),
                ),
                const SizedBox(height: 12),
                _buildButton(
                  context,
                  icon: Icons.image_aspect_ratio,
                  label: 'Goto Dismissable Screen',
                  page: const DismissableScreen(),
                ),
                const SizedBox(height: 12),
                _buildButton(
                  context,
                  icon: Icons.image_aspect_ratio,
                  label: 'Goto Dismissable Screen',
                  page: const DrawerScreen(),
                ),
                const SizedBox(height: 12),
                _buildButton(
                  context,
                  icon: Icons.arrow_drop_down,
                  label: 'Goto Dropdown Screen',
                  page: const DropDownScreen(),
                ),
                const SizedBox(height: 12),
                _buildButton(
                  context,
                  icon: Icons.tab,
                  label: 'Goto Tab Screen',
                  page: const TabScreen(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildButton(
    BuildContext context, {
    required IconData icon,
    required String label,
    required Widget page,
  }) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 3,
      child: TextButton(
        style: TextButton.styleFrom(
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
        ),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => page),
          );
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 24, color: Colors.blue),
            const SizedBox(width: 8),
            Text(
              label,
              style: const TextStyle(color: Colors.blue, fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
