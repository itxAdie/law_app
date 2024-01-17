import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class AppointForm extends StatelessWidget {
  final String lawyerName;

  AppointForm({required this.lawyerName});

  String? yourName;
  String? contactNumber;
  String? caseDetails;
  String? selectedFeeRange;
  String? selectedCity;

  Future<void> _submitForm() async {
    // Perform action on form submission
    print('Form Submitted');
    print('Lawyer Name: $lawyerName');
    print('Your Name: $yourName');
    print('Your Contact Number: $contactNumber');
    print('Your Case details: $caseDetails');
    print('Your Fee Range: $selectedFeeRange');
    print('Selected City: $selectedCity');

    // Open WhatsApp with a pre-filled message
    final whatsappUrl = 'https://wa.me/+923457513486?text=${Uri.encodeComponent(
      'Lawyer Name: $lawyerName\nClient Name: $yourName\nClient Contact Number: $contactNumber\nCase details: $caseDetails\nClient Fee Range: $selectedFeeRange\nSelected City: $selectedCity',
    )}';

    if (await canLaunch(whatsappUrl)) {
      await launch(whatsappUrl);
    } else {
      print('Could not launch WhatsApp');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Appoint Form'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Lawyer Name: $lawyerName',
                style: const TextStyle(
                    fontWeight: FontWeight.bold, fontSize: 18.0),
              ),
              const SizedBox(height: 16.0),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Your Name',
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue),
                  ),
                ),
                onChanged: (value) => yourName = value,
              ),
              const SizedBox(height: 16.0),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Your Contact Number',
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue),
                  ),
                ),
                keyboardType: TextInputType.phone,
                onChanged: (value) => contactNumber = value,
              ),
              const SizedBox(height: 16.0),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Your Case details',
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue),
                  ),
                ),
                maxLines: 3,
                onChanged: (value) => caseDetails = value,
              ),
              const SizedBox(height: 16.0),
              DropdownButtonFormField<String>(
                value: selectedFeeRange,
                decoration: const InputDecoration(
                  labelText: 'Your Fee Range',
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue),
                  ),
                ),
                items: const [
                  DropdownMenuItem(
                      value: '20000-50000', child: Text('20000 - 50000')),
                  DropdownMenuItem(
                      value: '50000-100000', child: Text('50000 - 100000')),
                  DropdownMenuItem(
                      value: '100000-200000', child: Text('100000 - 200000')),
                ],
                onChanged: (String? value) {
                  // Handle dropdown value change
                  print('Selected Fee Range: $value');
                  selectedFeeRange = value;
                },
              ),
              const SizedBox(height: 16.0),
              DropdownButtonFormField<String>(
                value: selectedCity,
                decoration: const InputDecoration(
                  labelText: 'Select Your City',
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue),
                  ),
                ),
                items: const [
                  DropdownMenuItem(value: 'Okara', child: Text('Okara')),
                  DropdownMenuItem(
                      value: 'Ranala Khurd', child: Text('Ranala Khurd')),
                  DropdownMenuItem(
                      value: 'Depal Pur', child: Text('Depal Pur')),
                ],
                onChanged: (String? value) {
                  // Handle dropdown value change
                  print('Selected City: $value');
                  selectedCity = value;
                },
              ),
              const SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: _submitForm,
                style: ElevatedButton.styleFrom(
                  primary: Colors.blue,
                  onPrimary: Colors.white,
                  textStyle: const TextStyle(fontWeight: FontWeight.bold),
                ),
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(16.0),
                  child: const Center(child: Text('Submit')),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
