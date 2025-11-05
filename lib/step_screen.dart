import 'package:flutter/material.dart';

class StepScreen extends StatefulWidget {
  const StepScreen({super.key});

  @override
  State<StepScreen> createState() => _StepScreenState();
}

class _StepScreenState extends State<StepScreen> {

  bool _secureText = true;
  int _currentStep = 0;
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  List<Step> stepList() => [
    Step(
      isActive: _currentStep >= 0,
      state: _currentStep <= 0 ? StepState.editing : StepState.complete,
      title: const Text('Account'),
      content: Column(
        children: [
          TextField(
            controller: _emailController,
            decoration: InputDecoration(
              hintText: 'Email address',
              label: RichText(
                text: const TextSpan(
                  text: 'Email',
                  style: TextStyle(color: Colors.grey, fontSize: 16),
                  children: [
                    TextSpan(
                      text: ' *',
                      style: TextStyle(
                        color: Colors.red,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              border: OutlineInputBorder(),
              prefixIcon: Icon(Icons.email_outlined),
              suffixIcon: IconButton(
                onPressed: () {
                  setState(() {
                    _emailController.clear();
                  });
                },
                icon: Icon(Icons.clear),
              ),
            ),
            keyboardType: TextInputType.emailAddress,
            textInputAction: TextInputAction.next,
          ),
          const SizedBox(height: 10),
          TextField(
            controller: _passwordController,
            decoration: InputDecoration(
              label: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Password',
                    style: TextStyle(color: Colors.grey, fontSize: 16),
                  ),
                  Text(
                    ' *',
                    style: TextStyle(
                      color: Colors.red,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              border: OutlineInputBorder(),
              prefixIcon: Icon(Icons.lock),
              suffixIcon: IconButton(
                onPressed: () {
                  setState(() {
                    _secureText = !_secureText;
                  });
                },
                icon: Icon(
                  _secureText
                      ? Icons.visibility_off_outlined
                      : Icons.visibility,
                ),
              ),
            ),
            keyboardType: TextInputType.text,
            textInputAction: TextInputAction.done,
            obscureText: _secureText,
          ),
        ],
      ),
    ),
    Step(
      isActive: _currentStep >= 1,
      state: _currentStep <= 1 ? StepState.editing : StepState.complete,
      title: const Text('Address'),
      content: Center(child: Text('Address')),
    ),
    Step(
      isActive: _currentStep >= 2,
      state: StepState.complete,
      title: const Text('Confirm'),
      content: Center(child: Text('Confirm')),
    ),
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
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(8.0),
          // child: Card(child: _pages[_selectedIndex]), // Bottom Navigation bar display
          child: Stepper(
            currentStep: _currentStep,
            type: StepperType.horizontal,
            elevation: 0,
            steps: stepList(),
            onStepContinue: () {
              if (_currentStep < stepList().length - 1) {
                setState(() {
                  _currentStep++;
                });
              }
            },
            onStepCancel: () {
              if (_currentStep > 0) {
                setState(() {
                  _currentStep--;
                });
              }
            },
          ),
        ),
      ),
    );
  }
}
