import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ErrorScreen extends StatelessWidget {
  final String message;
  final String errorCode;

  const ErrorScreen({super.key, required this.message, required this.errorCode});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          //Tło jak home
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
            bottom: -80,
            right: -50,
            child: Container(
              height: 180,
              width: 180,
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor.withOpacity(0.7),
                shape: BoxShape.circle,
              ),
            ),
          ),

          // Wyśrodkowanie treści
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (errorCode == "404")
                  SvgPicture.asset(
                    'assets/images/error_404.svg',
                    width: 250,
                    height: 250,
                  )
                else
                  Column(
                    children: [
                      SvgPicture.asset(
                        'assets/images/logo.svg',
                        width: 90,
                        height: 90,
                      ),
                      const SizedBox(height: 10),
                      Text(
                        errorCode,
                        style: const TextStyle(
                          fontSize: 60,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),

                const SizedBox(height: 20),

                //TEKST BŁĘDU
                Text(
                  message,
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 30),

                //PRZYCISK POWROTU DO HOME
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.black,
                    padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                  ),
                  child: const Text(
                    "Go Back",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

//Obsługowanie i przekierowywanie błędów
class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments as String?;

    switch (settings.name) {
      case '/error404':
        return _errorRoute(message: "Page Not Found", errorCode: "404");

      case '/error500':
        return _errorRoute(message: args ?? "Internal Server Error", errorCode: "500");

      case '/errorNetwork':
        return _errorRoute(message: "Network Connection Error", errorCode: "503");

      default:
        return _errorRoute(message: "404 Page not found", errorCode: "404");
    }
  }

  static Route<dynamic> _errorRoute({required String message, required String errorCode}) {
    return MaterialPageRoute(
      builder: (_) => ErrorScreen(message: message, errorCode: errorCode),
      fullscreenDialog: true,
    );
  }
}
