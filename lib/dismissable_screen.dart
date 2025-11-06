import 'package:flutter/material.dart';

class DismissableScreen extends StatefulWidget {
  const DismissableScreen({super.key});

  @override
  State<DismissableScreen> createState() => _DismissableScreenState();
}

class _DismissableScreenState extends State<DismissableScreen> {
  List<String> items = ['Dart', 'Python', 'Java', 'Swift', 'Go', 'JavaScript'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Dismissable Screen',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: const Color.fromARGB(255, 32, 10, 61),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: ListView.builder(
        itemCount: items.length,
        padding: const EdgeInsets.symmetric(vertical: 16),
        itemBuilder: (context, index) {
          return Dismissible(
            key: ValueKey<String>(items[index]),
            confirmDismiss: (DismissDirection direction) async {
              if (direction == DismissDirection.startToEnd) {
                // Delete confirmation dialog for left-to-right swipe
                return await showDialog<bool>(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: const Text('Delete'),
                          content: const Text(
                            'Are you sure you want to delete this item?',
                          ),
                          actions: [
                            TextButton(
                              onPressed: () => Navigator.of(context).pop(false),
                              child: const Text('Cancel'),
                            ),
                            TextButton(
                              onPressed: () => Navigator.of(context).pop(true),
                              child: const Text('Yes'),
                            ),
                          ],
                        );
                      },
                    ) ??
                    false;
              } else if (direction == DismissDirection.endToStart) {
                // Save confirmation dialog for right-to-left swipe
                return await showDialog<bool>(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: const Text('Save'),
                          content: const Text(
                            'Are you sure you want to save this item?',
                          ),
                          actions: [
                            TextButton(
                              onPressed: () => Navigator.of(context).pop(false),
                              child: const Text('Cancel'),
                            ),
                            TextButton(
                              onPressed: () => Navigator.of(context).pop(true),
                              child: const Text('Yes'),
                            ),
                          ],
                        );
                      },
                    ) ??
                    false;
              }
              return false; // Just in case
            },
            background: Container(
              height: 50,
              color: Colors.red,
              margin: const EdgeInsets.only(top: 10),
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.only(left: 16),
              child: const Text(
                'Delete',
                style: TextStyle(color: Colors.white),
              ),
            ),
            secondaryBackground: Container(
              height: 50,
              color: Colors.blue,
              margin: const EdgeInsets.only(top: 10),
              alignment: Alignment.centerRight,
              padding: const EdgeInsets.only(right: 16),
              child: const Text('Save', style: TextStyle(color: Colors.white)),
            ),
            onDismissed: (direction) {
              setState(() {
                items.removeAt(index);
              });
            },
            child: Container(
              color: const Color(0xffEBEDFE),
              margin: const EdgeInsets.only(top: 10),
              height: 50,
              child: Center(child: Text(items[index])),
            ),
          );
        },
      ),
    );
  }
}
