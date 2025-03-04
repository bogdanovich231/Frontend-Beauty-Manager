import 'package:beauty_manager/screens/login.dart';
import 'package:beauty_manager/widgets/custom_button.dart';
import 'package:beauty_manager/widgets/custom_form.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _form = GlobalKey<FormState>();
  var _enteredName = '';
  var _enteredEmail = '';
  var _enteredPassword = '';
  var _repeatPassword = '';

  void _submit() {
    final isValid = _form.currentState!.validate();
    if (!isValid) {
      return;
    }
    _form.currentState!.save();
    print(
      "Name: $_enteredName,Email: $_enteredEmail, Password: $_enteredPassword, Repeat Password: $_repeatPassword",
    );
  }

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

                child: Form(
                  key: _form,
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        CustomForm(
                          text: 'Your name',
                          validator: (value) {
                            if (value == null || value.trim().isEmpty) {
                              return 'Enter name';
                            }
                            if (value[0] == value[0].toLowerCase()) {
                              return 'The name must start with a capital letter.';
                            }
                            return null;
                          },
                          onSaved: (value) {
                            _enteredName = value!;
                          },
                        ),
                        const SizedBox(height: 20),
                        CustomForm(
                          text: 'Your email',
                          validator: (value) {
                            if (value == null ||
                                value.trim().isEmpty ||
                                !value.contains('@')) {
                              return 'Please enter a valid email address.';
                            }
                            return null;
                          },
                          onSaved: (value) {
                            _enteredEmail = value!;
                          },
                        ),
                        const SizedBox(height: 20),
                        CustomForm(
                          text: 'Your password',
                          validator: (value) {
                            if (value == null || value.trim().length < 6) {
                              return 'Password must be at least 6 characters long.';
                            }
                            return null;
                          },
                          onSaved: (value) {
                            _enteredPassword = value!;
                          },
                        ),
                        const SizedBox(height: 20),
                        CustomForm(
                          text: 'Repeat password',
                          validator: (value) {
                            if (value == null || value.trim().isEmpty) {
                              return 'Enter password';
                            }
                            if (value == 'password') {
                              return 'Passwords do not match.';
                            }
                            return null;
                          },
                          onSaved: (value) {
                            _repeatPassword = value!;
                          },
                        ),

                        const SizedBox(height: 35),
                        CustomButton(
                          text: 'Sign Up',
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
          ),
        ],
      ),
    );
  }
}
