import 'package:beauty_manager/screens/login.dart';
import 'package:beauty_manager/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
// import 'package:beauty_manager/screens/login.dart';
import 'package:beauty_manager/screens/register.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: -57.49,
            left: 306.81,
            child: Container(
              height: 200,
              width: 200,
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                shape: BoxShape.circle,
              ),
            ),
          ),
          Positioned(
            top: 219,
            left: 106,
            child: SvgPicture.asset(
              'assets/images/logo.svg',
              width: 217,
              height: 118.17,
            ),
          ),
          const Positioned(
            top: 301,
            left: 81,
            child: Text(
              'MANAGER',
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.w300,
                letterSpacing: 19,
              ),
            ),
          ),
          Positioned(
            top: 480,
            left: 0,
            right: 0,
            child: Container(
              padding: const EdgeInsets.all(26),
              height: 428,
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40),
                  topRight: Radius.circular(40),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 30),
                  const Text(
                    'Welcome',
                    style: TextStyle(fontSize: 35, fontWeight: FontWeight.w700),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'Welcome to the beautiful manager, here you can choose your favorite service and sign up for it with our beautiful app.',
                    style: TextStyle(fontWeight: FontWeight.w400, fontSize: 20),
                  ),
                  const SizedBox(height: 30),
                  Row(
                    children: [
                      CustomButton(
                        text: 'Sign In',
                        backgroundColor: Colors.white,
                        textColor: Colors.black,
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (ctx) => LoginScreen()),
                          );
                        },
                        width: 178,
                        height: 63,
                      ),
                      const SizedBox(width: 15),
                      CustomButton(
                        text: 'Sign Up',
                        backgroundColor: Colors.black,
                        textColor: Colors.white,
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (ctx) => RegisterScreen(),
                            ),
                          );
                        },
                        width: 178,
                        height: 63,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
