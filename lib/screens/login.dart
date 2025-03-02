import 'package:beauty_manager/screens/register.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (ctx) => RegisterScreen()),
              );
            },
            child: Text('Sign Up', 
            style: TextStyle(color: Colors.black,
            fontSize: 20)),
          ),
        ],
      ),
    );
  }
}
