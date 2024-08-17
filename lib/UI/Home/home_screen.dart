import 'package:flutter/material.dart';
import 'package:test_project/Modals/contact.dart';
import 'package:test_project/UI/Home/widget/contact_card.dart';
import 'package:test_project/UI/Home/widget/input_form.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = "HomeScreen";

  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final formkey = GlobalKey<FormState>();

  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  List<Contact> contact = [
    Contact(name: "", phone: ""),
    Contact(name: "", phone: ""),
    Contact(name: "", phone: ""),
  ];

  int pointer = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Contact App"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              InputForm(
                nameValidation: nameValidation,
                phoneValidation: phoneValidation,
                formKey: formkey,
                nameController: nameController,
                phoneController: phoneController,
              ),
              const SizedBox(
                height: 16,
              ),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        addContact();
                      },
                      child: const Text("Add"),
                    ),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        deleteContact();
                      },
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(Colors.red),
                      ),
                      child: const Text("Delete"),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 16,
              ),
              ContactCard(contact: contact[0]),
              const SizedBox(
                height: 16,
              ),
              ContactCard(contact: contact[1]),
              const SizedBox(
                height: 16,
              ),
              ContactCard(contact: contact[2]),
            ],
          ),
        ),
      ),
    );
  }

  String? nameValidation(String value) {
    if (RegExp(r'[!@#<>?":_`~;[\]\\|=+)(*&^%0-9-]').hasMatch(value)) {
      return "Enter Valid Name";
    } else if (value.isEmpty) {
      return "Name can't be Empty";
    } else {
      return null;
    }
  }

  String? phoneValidation(String value) {
    String pattern = r'(^(?:[+0]9)?[0-9]{10,12}$)';
    RegExp regExp = RegExp(pattern);
    if (value.isEmpty) {
      return 'Please enter mobile number';
    } else if (!regExp.hasMatch(value)) {
      return 'Please enter valid mobile number';
    }
    return null;
  }

  void addContact() {
    if (pointer == 3) {
      return;
    }

    if (formkey.currentState!.validate()) {
      contact[pointer].name = nameController.text;
      contact[pointer].phone = phoneController.text;
      contact[pointer].visable = true;
      nameController.clear();
      phoneController.clear();
      pointer++;
    }
    setState(() {});
  }

  deleteContact() {
    if (pointer == 0) {
      return;
    }
    pointer--;
    contact[pointer].visable = false;
    setState(() {});
  }
}
