import 'package:beauty_manager/screens/login.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (ctx) => LoginScreen()),
              );
            },
            child: Text('Sign In',
             style: TextStyle(color: Colors.black,
             fontSize: 20)),
          ),
        ],
      ),
    );
  }
}
