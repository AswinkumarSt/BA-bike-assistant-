import 'package:flutter/material.dart';

class SelectionPage extends StatelessWidget {
  const SelectionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/icons/image2.jpg'),
                  fit: BoxFit.cover,
                  opacity: 1),
            ),
          ),
          Center(
            child: Container(
              width: 280,
              height: 410,
              padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 20),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.8),
                borderRadius: BorderRadius.circular(20),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 11,
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
                ],
               ),
            ),
          ),
        ],
      ),
    );
  }
}
