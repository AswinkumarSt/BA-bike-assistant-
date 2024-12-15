import 'package:flutter/material.dart';

void main() {
  runApp(const HomePage());
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background image
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                    'assets/icons/image.jpg'), // Replace with your image
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Login Card
          Center(
            child: Container(
              width: 250,
              height: 310,
              padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 20),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.9),
                borderRadius: BorderRadius.circular(20),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 10,
                    offset: Offset(0, 5),
                  ),
                ],
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                        Container(
                        width: 40, // Set the width of the container
                        height: 40, // Set the height of the container
                        margin: const EdgeInsets.only(top: 20, left: 0,bottom: 24,right: 5),
                        child: const Image(
                          image: AssetImage('assets/icons/Vector 4.png'),
                        ),
                      ),
                      // Logo
                      const Text(
                        'B.A',
                        style: TextStyle(
                          fontFamily: 'Cursive',
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  // Login text
                  const Text(
                    'Already have an account? Then Login.',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 7, color: Colors.black54),
                  ),
                  const SizedBox(height: 20),
                  // Login Button
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                      Navigator.pushNamed(context, '/loginpage');
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      padding: const EdgeInsets.symmetric(
                        vertical: 12,
                        horizontal: 40,
                      ),
                    ),
                    child: const Text(
                      'Login',
                      style: TextStyle(fontSize: 20,
                      color: Colors.white54,
                      fontFamily: 'Cursive'),
                    ),
                  ),
                  const SizedBox(height: 20),
                  // Sign-up text
                  const Text(
                    'Don\'t have an account? Create an account.',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 7, color: Colors.black54),
                  ),
                  const SizedBox(height: 20),
                  // Sign-up Button
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                      Navigator.pushNamed(context, '/signuppage');
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      padding: const EdgeInsets.symmetric(
                        vertical: 12,
                        horizontal: 40,
                      ),
                    ),
                    child: const Text(
                      'Sign-up',
                      style: TextStyle(fontSize: 20,
                      color: Colors.white54,
                      fontFamily: 'Cursive'),
                    ),
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
