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

  // Map of options for the second dropdown based on the first dropdown selection
  final Map<String, List<String>> _dependentOptions = {
    'Royal Enfield': ['Meteor 350', 'Himalayan 450', 'Classic reborn'],
    'Yamaha': ['Mt-15', 'R15'],
    'Honda ': ['CB-350RS', 'CB-350', 'Highness', 'Unicorn'],
    'Jawa': ['42 bobber'],
  };

  @override
  Widget build(BuildContext context) {
    // Get the current options for the second dropdown
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
                        width: 40, // Set the width of the container
                        height: 40, // Set the height of the container
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
                  // First dropdown
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
                        _selectedOption2 =
                            ''; // Reset the second dropdown when the first changes
                      });
                    },
                    dropdownColor: Colors.white,
                    icon: const Icon(Icons.arrow_drop_down),
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                    ),
                  ),
                  // Second dropdown
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                      Navigator.pushNamed(context, '');
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
                      style: TextStyle(fontSize: 20,
                      fontFamily: 'Cursive',
                      color: Colors.white54),
                    ),
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
