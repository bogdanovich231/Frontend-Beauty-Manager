import 'package:beauty_manager/screens/register.dart';
import 'package:beauty_manager/widgets/custom_button.dart';
import 'package:beauty_manager/widgets/custom_form.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _form = GlobalKey<FormState>();
  var _enteredEmail = '';
  var _enteredPassword = '';

  void _submit() {
    final isValid = _form.currentState!.validate();
    if (!isValid) {
      return;
    }
    _form.currentState!.save();
    print("Email: $_enteredEmail, Password: $_enteredPassword");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        actions: [
          TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (ctx) => RegisterScreen()),
              );
            },
            child: Text(
              'Sign Up',
              style: TextStyle(color: Colors.black, fontSize: 20),
            ),
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 26, top: 24),
            child: const Text(
              'Sign In',
              style: TextStyle(fontSize: 35, fontWeight: FontWeight.w700),
            ),
          ),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
            child: const Text(
              "Glad to see you again, it's been a while, come in soon to use the services of our masters.",
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
                child: Form(
                  key: _form,
                  child: Column(
                    children: [
                      CustomForm(
                        text: 'Your email',
                        validator: (value) {
                          if (value == null ||
                              value.trim().isEmpty ||
                              !value.contains("@")) {
                            return 'Please enter a valid email address.';
                          }
                          return null;
                        },
                        onSaved: (value) {
                          _enteredEmail = value!;
                        },
                      ),
                      const SizedBox(height: 25),
                      CustomForm(
                        text: 'Your password',
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return 'Enter a password.';
                          }
                          return null;
                        },
                        onSaved: (value) {
                          _enteredPassword = value!;
                        },
                      ),

                      const SizedBox(height: 35),
                      CustomButton(
                        text: 'Sign In',
                        backgroundColor: Colors.black,
                        textColor: Colors.white,
                        onPressed: _submit,
                        width: double.infinity,
                        height: 63,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
