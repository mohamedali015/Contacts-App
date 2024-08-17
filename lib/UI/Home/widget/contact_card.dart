import 'package:flutter/material.dart';
import 'package:test_project/Modals/contact.dart';

class ContactCard extends StatelessWidget {
  Contact contact;

  ContactCard({super.key, required this.contact});

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: contact.visable,
      child: Container(
        padding: EdgeInsets.all(16),
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Name: ${contact.name}"),
            const SizedBox(
              height: 10,
            ),
            Text("Phone: ${contact.phone}"),
          ],
        ),
      ),
    );
  }
}
