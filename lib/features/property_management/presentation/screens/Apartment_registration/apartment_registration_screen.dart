import 'package:flutter/material.dart';

class ApartmentRegistrationScreen extends StatefulWidget {
  const ApartmentRegistrationScreen({super.key});

  @override
  State<ApartmentRegistrationScreen> createState() =>
      _ApartmentRegistrationScreenState();
}

class _ApartmentRegistrationScreenState
    extends State<ApartmentRegistrationScreen> {
  String regdropdownvalue = 'Single Apartment Block';

  // List of items in our dropdown menu
  var items = [
    'Single Apartment Block',
    'Multiple Apartment Blocks - Single Estate',
    'Multiple Apartment Blocks - Multiple Estate',
  ];

  String countdropdownvalue = '2';

  // List of items in our dropdown menu
  var numbers = [
    '2',
    '3',
    '4',
    '5',
    '6',
    '7',
    '8',
    '9',
    '10',
  ];

  @override
  Widget build(BuildContext context) {
    double Width = MediaQuery.of(context).size.width;
    double Height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Apartment Registration'),
        ),
        body: Container(
            width: Width,
            height: Height,
            child: SingleChildScrollView(
                child: Column(
              children: [
                Text('Property Detail'),
                Text('Registration type'),
                DropdownButton(
                  // Initial Value
                  value: regdropdownvalue,

                  // Down Arrow Icon
                  icon: const Icon(Icons.keyboard_arrow_down),

                  // Array list of items
                  items: items.map((String items) {
                    return DropdownMenuItem(
                      value: items,
                      child: Text(items),
                    );
                  }).toList(),
                  // After selecting the desired option,it will
                  // change button value to selected value
                  onChanged: (String? newValue) {
                    setState(() {
                      regdropdownvalue = newValue!;
                    });
                  },
                ),
                Row(
                  children: [
                    Text('Number of Estates'),
                    Spacer(),
                    DropdownButton(
                      // Initial Value
                      value: countdropdownvalue,

                      // Down Arrow Icon
                      icon: const Icon(Icons.keyboard_arrow_down),

                      // Array list of items
                      items: numbers.map((String items) {
                        return DropdownMenuItem(
                          value: items,
                          child: Text(items),
                        );
                      }).toList(),
                      // After selecting the desired option,it will
                      // change button value to selected value
                      onChanged: (String? newValue) {
                        setState(() {
                          countdropdownvalue = newValue!;
                        });
                      },
                    ),
                  ],
                ),
                Text('Estate 1'),
                Form(
                    child: Column(
                  children: [
                    Text('Name of Estate'),
                    Text('Location'),
                    Text('Number of Apartment Blocks')
                  ],
                )),
                Text('Apartment 1'),
                Form(
                    child: Column(
                  children: [
                    Text('Name of Aparment'),
                    Text('Number of Rental Spaces')
                  ],
                ))
              ],
            ))),
      ),
    );
  }
}
