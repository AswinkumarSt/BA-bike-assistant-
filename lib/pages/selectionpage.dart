import 'package:breakie/pages/42bobberpage.dart';
import 'package:breakie/pages/Highnesspage.dart';
import 'package:breakie/pages/cb-350rspage.dart';
import 'package:breakie/pages/classicrebornpage.dart';
import 'package:breakie/pages/himalayan450page.dart';
import 'package:breakie/pages/meteor350Page.dart';
import 'package:breakie/pages/mt-15page.dart';
import 'package:breakie/pages/r15page.dart';
import 'package:flutter/material.dart';

class SelectionPage extends StatefulWidget {
  const SelectionPage({super.key});

  @override
  State<SelectionPage> createState() => _SelectionPageState();
}

class _SelectionPageState extends State<SelectionPage> {
  String _selectedOption1 =
      'Royal Enfield'; // Default value for the first dropdown
  String _selectedOption2 = ''; // Default value for the second dropdown

  final Map<String, List<String>> _dependentOptions = {
    'Royal Enfield': ['Meteor 350', 'Himalayan 450', 'Classic reborn'],
    'Yamaha': ['Mt-15', 'R15'],
    'Honda': ['CB-350RS', 'Highness'],
    'Jawa': ['42 bobber'],
  };

  @override
  Widget build(BuildContext context) {
    List<String> optionsForSecondDropdown =
        _dependentOptions[_selectedOption1] ?? [];
    if (_selectedOption2.isEmpty ||
        !optionsForSecondDropdown.contains(_selectedOption2)) {
      _selectedOption2 = optionsForSecondDropdown.isNotEmpty
          ? optionsForSecondDropdown[0]
          : '';
    }

    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/icons/image2.jpg'),
                fit: BoxFit.cover,
                opacity: 1,
              ),
            ),
          ),
          Center(
            child: Container(
              width: 280,
              height: 410,
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
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
                        width: 40,
                        height: 40,
                        margin: const EdgeInsets.only(
                          top: 20,
                          left: 0,
                          bottom: 24,
                          right: 5,
                        ),
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
                  const SizedBox(height: 20),
                  const Text(
                    'Choose your brand',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black54,
                    ),
                  ),
                  const SizedBox(height: 10),
                  DropdownButton<String>(
                    value: _selectedOption1,
                    items: _dependentOptions.keys
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(
                          value,
                          style: const TextStyle(fontSize: 16),
                        ),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      setState(() {
                        _selectedOption1 = newValue!;
                        _selectedOption2 = '';
                      });
                    },
                    dropdownColor: Colors.white,
                    icon: const Icon(Icons.arrow_drop_down),
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'Choose your Model',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black54,
                    ),
                  ),
                  const SizedBox(height: 10),
                  DropdownButton<String>(
                    value: optionsForSecondDropdown.isNotEmpty
                        ? _selectedOption2
                        : null,
                    items: optionsForSecondDropdown
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(
                          value,
                          style: const TextStyle(fontSize: 16),
                        ),
                      );
                    }).toList(),
                    onChanged: optionsForSecondDropdown.isNotEmpty
                        ? (String? newValue) {
                            setState(() {
                              _selectedOption2 = newValue!;
                            });
                          }
                        : null,
                    dropdownColor: Colors.white,
                    icon: const Icon(Icons.arrow_drop_down),
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      if (_selectedOption2.isNotEmpty) {
                        switch (_selectedOption2) {
                          case 'Meteor 350':
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Meteor350Page(),
                              ),
                            );
                            break;
                          case '42 bobber':
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Bobber42Page(),
                              ),
                            );
                            break;
                          case 'CB-350RS':
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => CB350RSPage(),
                              ),
                            );
                            break;
                          case 'Highness':
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => HighnessPage(),
                              ),
                            );
                            break;

                          case 'Himalayan 450':
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Himalayan450Page(),
                              ),
                            );
                            break;
                          case 'Classic reborn':
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ClassicRebornPage(),
                              ),
                            );
                            break;
                          case 'Mt-15':
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Mt15Page(),
                              ),
                            );
                            break;
                          case 'R15':
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => R15Page(),
                              ),
                            );
                            break;
                          default:
                            break;
                        }
                      }
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
                      'Submit',
                      style: TextStyle(
                        fontSize: 20,
                        fontFamily: 'Cursive',
                        color: Colors.white54,
                      ),
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
