import 'package:flutter/material.dart';

import 'appoint_form.dart';

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: MyStatelessScreen(),
//     );
//   }
// }

class InfoScreen extends StatelessWidget {
  // JSON data for lawyers
  final List<Map<String, String>> lawyersData = [
    {
      'name': 'Muhammad Jamil Chaudhary Advocate High Court',
      'study': 'Quaiz-E-Azam Law college',
      'experience': '15 Years',
      'specialized': 'Civil and Narcotics etc...',
      'image': 'assets/1.jpeg',
    },
    {
      'name': 'Attaullah Bhatti Advocate High Court',
      'study': 'Quaiz-E-Azam Law college',
      'experience': '8 year\'s',
      'specialized': 'Civil and Taxpayer property Tax etc..',
      'image': 'assets/2.jpeg',
    },
    {
      'name': 'Ali Hussnain Bhatti',
      'study': 'School of Law University of Punjab',
      'experience': '2 years',
      'specialized': 'Civil Laws',
      'image': 'assets/3.jpeg',
    },
    {
      'name': 'Malik Maqbool Hussain Shakir',
      'study': 'Quaiz- E -Azam Law college',
      'experience': '40 Year\'s',
      'specialized': 'Civil Laws',
      'image': 'assets/4.jpeg',
    },
    {
      'name': 'Asif Shahzad Ch Advocate High Court',
      'study': 'Quaiz- E - Azam Law college',
      'experience': '22 year\'s',
      'specialized': 'Criminal Cases',
      'image': 'assets/5.jpeg',
    },
    {
      'name': 'Mian Talat Mehmood Advocate High Court',
      'study': 'Quaid-E-Azam Law college',
      'experience': '20 year\'s',
      'specialized': 'Civil Laws',
      'image': 'assets/6.jpeg',
    },
    {
      'name': 'Malik Riaz Hussain Bhatti Adv',
      'study': 'Multan Law College Sahiwal',
      'experience': '25+ years',
      'specialized': 'Civil and Criminal Laws',
      'image': 'assets/7.jpeg',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lawyers Information'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 10),
        child: ListView.builder(
          itemCount: lawyersData.length,
          itemBuilder: (context, index) {
            return Card(
              margin: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 8),
                    child: Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: Colors
                              .blue, // Set border color as per your requirement
                          width:
                              2.0, // Set border width as per your requirement
                        ),
                      ),
                      child: CircleAvatar(
                        radius:
                            80.0, // Set the radius of the circle as per your requirement
                        backgroundImage:
                            AssetImage(lawyersData[index]['image']!),
                      ),
                    ),
                  ),

                  // Image.network(
                  //   lawyersData[index]['image']!,
                  //   height: 150,
                  //   width: double.infinity,
                  //   fit: BoxFit.cover,
                  // ),
                  ListTile(
                    title: Text(lawyersData[index]['name']!),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Studied From: ${lawyersData[index]['study']}'),
                        Text('Experience: ${lawyersData[index]['experience']}'),
                        Text(
                            'Specialized: ${lawyersData[index]['specialized']}'),
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.all(8.0),
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        // Handle appoint button click
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => AppointForm(
                              lawyerName: lawyersData[index]['name']!,
                            ),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Colors.blue,
                        onPrimary: Colors.white,
                        padding: const EdgeInsets.all(8.0),
                      ),
                      child: const Text(
                        'Appoint',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),

                  // Padding(
                  //   padding: const EdgeInsets.all(8.0),
                  //   child: ElevatedButton(
                  //     onPressed: () {
                  //       // Handle appoint button click
                  //       // You can add your logic here
                  //     },
                  //     child: const Text('Appoint'),
                  //   ),
                  // ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
