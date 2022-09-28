import 'package:flutter/material.dart';
import 'package:smart_nyumba_landlord/features/property_management/presentation/screens/Apartment_registration/apartment_registration_screen.dart';

class PropertyScreen extends StatefulWidget {
  const PropertyScreen({super.key});

  @override
  State<PropertyScreen> createState() => _PropertyScreenState();
}

class _PropertyScreenState extends State<PropertyScreen> {
  Map<String, bool> values = {
    'Apartment Building': false,
    'Office Block Building': false,
    'Masionette': false,
    'Bungalow': false,
  };

  var tmpArray = [];

  getCheckboxItems() {
    values.forEach((key, value) {
      if (value == true) {
        tmpArray.add(key);
      }
    });

    // Printing all selected items on Terminal screen.

    // Here you will get all your selected Checkbox items.

    // Clear array after use.
    tmpArray.clear();
  }

  @override
  Widget build(BuildContext context) {
    double Width = MediaQuery.of(context).size.width;
    double Height = MediaQuery.of(context).size.height;
    var value;
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: Width,
          height: Height,
          decoration: const BoxDecoration(color: Colors.white70),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: Width / 2.3,
                      width: Width / 2.3,
                      child: Card(
                        color: Colors.white70,
                        shape: RoundedRectangleBorder(
                          side: BorderSide(
                              color: Color.fromARGB(255, 29, 73, 186)),
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                      ),
                    ),
                    Container(
                      height: Width / 2.3,
                      width: Width / 2.3,
                      child: Card(
                        color: Color.fromARGB(255, 29, 73, 186),
                        shape: RoundedRectangleBorder(
                          side: BorderSide.none,
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                      ),
                    )
                  ],
                ),
                Container(
                  height: Width,
                  width: Width / 1.1,
                  child: Card(
                    elevation: 5,
                    color: Colors.white70,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 10, top: 6),
                          child: InkWell(
                            child: Container(
                              height: 40,
                              width: 160,
                              decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black54,
                                    offset: const Offset(
                                      5.0,
                                      5.0,
                                    ),
                                    blurRadius: 10.0,
                                    spreadRadius: 1.0,
                                  ), //BoxShadow
                                  BoxShadow(
                                    color: Colors.white70,
                                    offset: const Offset(0.0, 0.0),
                                    blurRadius: 0.0,
                                    spreadRadius: 0.0,
                                  ), //BoxShadow
                                ],
                                color: Color.fromARGB(31, 151, 149, 149),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                                border: Border.all(
                                    color: Colors.black45,
                                    width: 1,
                                    style: BorderStyle.solid),
                              ),
                              child: const Center(
                                  child: Text(
                                'Register Property',
                                style: TextStyle(
                                    color: Colors.black87,
                                    fontWeight: FontWeight.w700,
                                    decoration: TextDecoration.none,
                                    fontFamily: 'Roboto Condensed',
                                    fontSize: 18),
                              )),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10, top: 6),
                          child: const Text(
                            'Type of Property',
                            style: TextStyle(
                                color: Colors.black87,
                                fontWeight: FontWeight.w400,
                                decoration: TextDecoration.none,
                                fontFamily: 'Roboto Serif',
                                fontSize: 14),
                          ),
                        ),
                        Expanded(
                          child: ListView(
                            children: values.keys.map((String key) {
                              // ignore: unnecessary_new
                              return new Theme(
                                  data: ThemeData(
                                    checkboxTheme: CheckboxThemeData(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(5),
                                      ),
                                    ),
                                  ),
                                  child: CheckboxListTile(
                                    contentPadding:
                                        EdgeInsets.only(left: 10, top: 1),
                                    controlAffinity:
                                        ListTileControlAffinity.leading,
                                    title: Text(
                                      key,
                                      style: const TextStyle(
                                          color: Colors.black87,
                                          fontWeight: FontWeight.w400,
                                          decoration: TextDecoration.none,
                                          fontFamily: 'Roboto Serif',
                                          fontSize: 14),
                                    ),
                                    value: values[key],
                                    activeColor:
                                        Color.fromARGB(255, 29, 73, 186),
                                    checkColor: Colors.white,
                                    onChanged: (value) {
                                      setState(() {
                                        values[key] = value!;
                                      });
                                    },
                                  ));
                            }).toList(),
                          ),
                        ),
                        Align(
                          alignment: Alignment.centerRight,
                          child: Padding(
                            padding:
                                const EdgeInsets.only(right: 10, bottom: 10),
                            child: InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const ApartmentRegistrationScreen()),
                                );
                              },
                              child: Container(
                                height: 35,
                                width: 130,
                                decoration: BoxDecoration(
                                  // boxShadow: [
                                  //   BoxShadow(
                                  //     color: Colors.black54,
                                  //     offset: const Offset(
                                  //       5.0,
                                  //       5.0,
                                  //     ),
                                  //     blurRadius: 10.0,
                                  //     spreadRadius: 1.0,
                                  //   ), //BoxShadow
                                  //   BoxShadow(
                                  //     color: Colors.white70,
                                  //     offset: const Offset(0.0, 0.0),
                                  //     blurRadius: 0.0,
                                  //     spreadRadius: 0.0,
                                  //   ), //BoxShadow
                                  // ],
                                  color: Color.fromARGB(255, 29, 73, 186),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                  border: Border.all(
                                      color: Color.fromARGB(255, 29, 73, 186),
                                      width: 1,
                                      style: BorderStyle.solid),
                                ),
                                child: const Center(
                                    child: Text(
                                  'Add Property',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w700,
                                      decoration: TextDecoration.none,
                                      fontFamily: 'Roboto Condensed',
                                      fontSize: 18),
                                )),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Container(
                  height: Width / 1.1,
                  width: Width / 1.1,
                  child: Card(
                    elevation: 5,
                    color: Colors.white70,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
