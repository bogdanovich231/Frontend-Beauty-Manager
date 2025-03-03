import 'package:beauty_manager/screens/login.dart';
import 'package:beauty_manager/widgets/custom_button.dart';
import 'package:beauty_manager/widgets/custom_form.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        actions: [
          TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (ctx) => LoginScreen()),
              );
            },
            child: Text(
              'Sign In',
              style: TextStyle(color: Colors.black, fontSize: 20),
            ),
          ),
        ],
      ),
      backgroundColor: Theme.of(context).primaryColor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 26, top: 24),
            child: const Text(
              'Sign Up',
              style: TextStyle(fontSize: 35, fontWeight: FontWeight.w700),
            ),
          ),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
            child: const Text(
              "Sign up if you haven't joined our beauty community yet, do it soon to use the services of our masters.",
              style: TextStyle(fontSize: 20),
            ),
          ),
          const SizedBox(height: 30),

          Flexible(
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40),
                  topRight: Radius.circular(40),
                ),
              ),

              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 26,
                  vertical: 50,
                ),

                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CustomForm(text: 'Your name'),
                    const SizedBox(height: 20),
                    CustomForm(text: 'Your email'),
                    const SizedBox(height: 20),
                    CustomForm(text: 'Your password'),
                    const SizedBox(height: 20),
                    CustomForm(text: 'Repeat password'),

                    const SizedBox(height: 35),
                    CustomButton(
                      text: 'Sign Up',
                      backgroundColor: Colors.black,
                      textColor: Colors.white,
                      onPressed: () {},
                      width: double.infinity,
                      height: 63,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
