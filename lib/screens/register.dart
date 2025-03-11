import 'package:beauty_manager/screens/main.dart';
import 'package:beauty_manager/services/auth_service.dart';
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
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _submit() async {
    final name = _nameController.text;
    final email = _emailController.text;
    final password = _passwordController.text;
    final isValid = _form.currentState!.validate();
    if (!isValid) {
      return;
    }
    _form.currentState!.save();

    final authService = AuthService();
    final response = await authService.register(name, email, password);
    if (response['success']) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Successfully registered!')));

      if (!mounted) return;
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (ctx) => MainScreen()),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(response['message'] ?? 'Registration failed')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        actions: [
          TextButton(
            onPressed: () {},
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

          Expanded(
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
                          controller: _nameController,
                          text: 'Your name',
                          validator: (value) {
                            if (value == null || value.trim().isEmpty) {
                              return 'Enter name.';
                            }
                            if (value[0] == value[0].toLowerCase()) {
                              return 'The name must start with a capital letter.';
                            }
                            return null;
                          },
                          onSaved: (value) {
                            _nameController.text = value!;
                          },
                        ),
                        const SizedBox(height: 20),
                        CustomForm(
                          controller: _emailController,
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
                            _emailController.text = value!;
                          },
                        ),
                        const SizedBox(height: 20),
                        CustomForm(
                          controller: _passwordController,
                          isPassword: true,
                          text: 'Your password',
                          validator: (value) {
                            if (value == null || value.trim().length < 6) {
                              return 'Password must be at least 6 characters long.';
                            }
                            return null;
                          },
                          onSaved: (value) {
                            _passwordController.text = value!;
                          },
                        ),
                        const SizedBox(height: 20),
                        CustomForm(
                          controller: null,
                          isPassword: true,
                          text: 'Repeat password',
                          validator: (value) {
                            if (value == null || value.trim().isEmpty) {
                              return 'Enter password.';
                            }
                            if (value != _passwordController.text) {
                              return 'Passwords do not match.';
                            }
                            return null;
                          },
                          onSaved: (value) {},
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
