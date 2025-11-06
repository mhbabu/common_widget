import 'package:flutter/material.dart';

class DrawerScreen extends StatefulWidget {
  const DrawerScreen({super.key});

  @override
  State<DrawerScreen> createState() => _DrawerScreenState();
}

class _DrawerScreenState extends State<DrawerScreen> {
  _buildHeader() {
    return DrawerHeader(
      decoration: BoxDecoration(
        color: Color(0xff1D1E22),
        // image: DecorationImage(
        //   image: AssetImage('assets/images/profile.jpg'),
        //   fit: BoxFit.fill,
        // ),
      ),
      child: Column(
        children: [
          CircleAvatar(
            backgroundImage: AssetImage('assets/images/profile.jpg'),
            radius: 40,
          ),
          const SizedBox(height: 20),
          Text(
            'Mahadi Hassan Babu',
            style: TextStyle(color: Colors.white, fontSize: 15),
          ),
        ],
      ),
    );
  }

  _buildItem({
    required IconData icon,
    required String title,
    required GestureTapCallback onTap,
  }) {
    return ListTile(
      leading: Icon(icon),
      title: Text(title),
      onTap: onTap,
      minLeadingWidth: 5,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Drawer Screen',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: const Color.fromARGB(255, 32, 10, 61),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            _buildHeader(),
            _buildItem(
              icon: Icons.home_rounded,
              title: 'Home',
              onTap: () => Navigator.pop(context),
            ),
            _buildItem(
              icon: Icons.notifications_rounded,
              title: 'Notifications',
              onTap: () => Navigator.pushNamed(context, 'Notifications'),
            ),
            _buildItem(
              icon: Icons.person,
              title: 'Profile',
              onTap: () => Navigator.pushNamed(context, 'Profile'),
            ),
            _buildItem(
              icon: Icons.settings,
              title: 'Setting',
              onTap: () => Navigator.pushNamed(context, 'Settings'),
            ),
          ],
        ),
      ),
    );
  }
}
