import 'package:flutter/material.dart';

import 'package:youkanheal_dashboard/pages/ban_the_bag.dart';
import 'package:youkanheal_dashboard/pages/drawer_widget.dart';

import 'package:youkanheal_dashboard/pages/green_protocol.dart';
import 'package:youkanheal_dashboard/pages/sustainable_mensuration.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'AppBar Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // List of institutions (dummy data)
  final List<Map<String, String>> institutions = [
    {
      'type': 'college',
      'logo': 'assets/college_logo.png',
      'name': 'St Teresas College',
      'place': 'Ernakulam',
      'value': '1600',
      'date': 'May 2024',
    },
    {
      'type': 'school',
      'logo': 'assets/school_logo.png',
      'name': 'Chinmaya',
      'place': 'Ernakulam',
      'value': '1000',
      'date': 'Aug 2024',
    },
    {
      'type': 'college',
      'logo': 'assets/college_logo.png',
      'name': 'ABC College',
      'place': 'location',
      'value': '100',
      'date': 'Jul 2024',
    },
  ];

  String selectedCategory = 'all'; // Default selected category

  // Function to filter institutions based on selected category
  List<Map<String, String>> get filteredInstitutions {
    if (selectedCategory == 'all') {
      return institutions;
    } else {
      return institutions
          .where((institution) => institution['type'] == selectedCategory)
          .toList();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const DrawerWidget(),
      appBar: AppBar(
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(Icons.menu),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            );
          },
        ),
        title: Center(
          child: Image.asset(
            'assets/logo.png',
            fit: BoxFit.contain,
            height: 40,
          ),
        ),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.account_circle),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const SizedBox(height: 20),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                'Challenge Dashboard',
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Container(
                width: 375,
                height: 200,
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 3, 98, 18),
                  borderRadius: BorderRadius.circular(15.0),
                ),
                child: const Padding(
                  padding: EdgeInsets.all(12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'Total Number of Participants',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15.0,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.left,
                      ),
                      SizedBox(height: 4),
                      Text(
                        '300',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 27.0,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.left,
                      ),
                      SizedBox(height: 8),
                      Divider(color: Colors.white),
                      SizedBox(height: 8),
                      Center(
                        child: Column(
                          children: <Widget>[
                            Text(
                              'Sustainable Mensuration',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 17.0,
                                fontWeight: FontWeight.bold,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            SizedBox(height: 6),
                            Text(
                              '2200',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 29.0,
                                fontWeight: FontWeight.bold,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                'Statistics',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Container(
                width: 375,
                height: 225,
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 228, 229, 229),
                  borderRadius: BorderRadius.circular(15.0),
                ),
              ),
            ),
            const SizedBox(height: 20),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                'Institutions',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Container(
                width: 375,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15.0),
                ),
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          // Filter button for All
                          TextButton(
                            onPressed: () {
                              setState(() {
                                selectedCategory = 'all';
                              });
                            },
                            child: Text(
                              'All',
                              style: TextStyle(
                                fontSize: 16.0,
                                fontWeight: FontWeight.bold,
                                color: selectedCategory == 'all'
                                    ? Colors.green
                                    : Colors.grey,
                                decoration: selectedCategory == 'all'
                                    ? TextDecoration.underline
                                    : null,
                              ),
                            ),
                          ),
                          // Filter button for Colleges
                          TextButton(
                            onPressed: () {
                              setState(() {
                                selectedCategory = 'college';
                              });
                            },
                            child: Text(
                              'Colleges',
                              style: TextStyle(
                                fontSize: 16.0,
                                fontWeight: FontWeight.bold,
                                color: selectedCategory == 'college'
                                    ? Colors.green
                                    : Colors.grey,
                                decoration: selectedCategory == 'college'
                                    ? TextDecoration.underline
                                    : null,
                              ),
                            ),
                          ),
                          // Filter button for Schools
                          TextButton(
                            onPressed: () {
                              setState(() {
                                selectedCategory = 'school';
                              });
                            },
                            child: Text(
                              'Schools',
                              style: TextStyle(
                                fontSize: 16.0,
                                fontWeight: FontWeight.bold,
                                color: selectedCategory == 'school'
                                    ? Colors.green
                                    : Colors.grey,
                                decoration: selectedCategory == 'school'
                                    ? TextDecoration.underline
                                    : null,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Divider(color: Colors.grey),
                    // Institutions list
                    Column(
                      children: filteredInstitutions.map((institution) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8.0, vertical: 4.0),
                          child: Container(
                            width: 375,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                              color: const Color.fromARGB(255, 241, 243, 243),
                            ),
                            child: ListTile(
                              leading: Image.asset(
                                institution['logo']!,
                                height: 50,
                                width: 50,
                              ),
                              title: Text(
                                institution['name']!,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16.0,
                                  color: Colors.black,
                                ),
                              ),
                              subtitle: Text(
                                '${institution['place']} - ${institution['value']} students (${institution['date']})',
                              ),
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                  ],
                ),
              ),
            ),
            // Add clickable boxes here
            const SizedBox(height: 20),
// Vertically aligned boxes
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                // First box
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            const GreenProtocol(message: 'Hello 1'),
                      ),
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Container(
                      width: 375,
                      height: 200,
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 3, 98, 18),
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Image.asset(
                              'assets/green.png', // Path to the small logo
                              height: 40, // Adjust the height as needed
                              width: 40, // Adjust the width as needed
                            ),
                            const SizedBox(height: 10),
                            const Text(
                              'Green\nProtocol',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 27.0,
                                fontWeight: FontWeight.bold,
                              ),
                              textAlign: TextAlign.left,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                // Second box
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            const SustainableMensuration(message: 'Hello 2'),
                      ),
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Container(
                      width: 375,
                      height: 200,
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 3, 98, 18),
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Image.asset(
                              'assets/sustainable_mensuration.png', // Path to the small logo
                              height: 40, // Adjust the height as needed
                              width: 40, // Adjust the width as needed
                            ),
                            const SizedBox(height: 10),
                            const Text(
                              'Sustainable\nMensuration',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 27.0,
                                fontWeight: FontWeight.bold,
                              ),
                              textAlign: TextAlign.left,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                // Third box
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            const BanTheBag(message: 'Hello 3'),
                      ),
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Container(
                      width: 375,
                      height: 200,
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 3, 98, 18),
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Image.asset(
                              'assets/ban_the_bag.png', // Path to the small logo
                              height: 40, // Adjust the height as needed
                              width: 40, // Adjust the width as needed
                            ),
                            const SizedBox(height: 10),
                            const Text(
                              'Ban The Bag',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 27.0,
                                fontWeight: FontWeight.bold,
                              ),
                              textAlign: TextAlign.left,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
