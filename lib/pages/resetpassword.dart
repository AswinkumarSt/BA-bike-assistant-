import 'package:flutter/material.dart';

class ResetPage extends StatelessWidget {
  const ResetPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                    'assets/icons/image.jpg'), // Replace with your image
                fit: BoxFit.cover,
              ),
            ),
          ),
          Center(
            child: Container(
              width: 289,
              height: 390,
              padding: const EdgeInsets.only(top: 10, left: 0),
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
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                  
                  const SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.only(left: 24, right: 24),
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'New Password',
                        hintStyle: TextStyle(
                          color: Colors.grey.withOpacity(0.6),
                          fontSize: 10,
                        ),
                        suffixIcon: const Icon(Icons.remove_red_eye_rounded,
                            color: Colors.grey),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.only(left: 24, right: 24),
                    child: TextField(
                      obscureText: true,
                      decoration: InputDecoration(
                        hintText: 'Confirm NewPassword',
                        hintStyle: TextStyle(
                          color: Colors.grey.withOpacity(0.6),
                          fontSize: 10,
                        ),
                        suffixIcon: const Icon(Icons.remove_red_eye_rounded, color: Colors.grey),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20)),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
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
                        horizontal: 50,
                      ),
                    ),
                    child: const Text(
                      'Reset',
                      style: TextStyle(fontSize: 20,
                      fontFamily: 'Cursive',
                      color: Colors.white54),
                    ),
                  ),
                  
                  Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                          Navigator.pushNamed(context, '/homepage');
                        },
                        icon: Icon(Icons.arrow_back_outlined),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
