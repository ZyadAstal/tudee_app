import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../widgets/custom_app_bar.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_text_field.dart';

class WelcomeScreen extends StatefulWidget {
  WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  final TextEditingController nameController = TextEditingController();

  @override
  void initState() {
    super.initState();
    checkIfUserExists();
  }

  void checkIfUserExists() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? savedName = prefs.getString('userName');

    if (savedName != null && savedName.isNotEmpty) {
      if (mounted) {
        Navigator.pushReplacementNamed(context, '/home');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFAF0EC),
      appBar: CustomAppBar(),
      body: Padding(
        padding: EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Welcome',
              style: TextStyle(
                color: Color(0xFF38B4EE),
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Text(
              "Let's get started",
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 24),
            Text(
              'What should we call you?',
              style: TextStyle(color: Colors.grey),
            ),
            SizedBox(height: 8),
            CustomTextField(
              controller: nameController,
              hintText: 'Your name',
            ),
            SizedBox(height: 20),
            CustomButton(
              text: 'Save',
              onPressed: () async {
                String name = nameController.text.trim();
                String finalName = name.isEmpty ? 'Zyad' : name;

                SharedPreferences prefs = await SharedPreferences.getInstance();
                await prefs.setString('userName', finalName);

                if (context.mounted) {
                  Navigator.pushReplacementNamed(context, '/home');
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
