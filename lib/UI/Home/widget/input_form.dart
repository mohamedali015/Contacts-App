import 'package:flutter/material.dart';

class InputForm extends StatelessWidget {
  final Function nameValidation;
  final Function phoneValidation;
  final GlobalKey formKey;
  final TextEditingController nameController;
  final TextEditingController phoneController;

  InputForm({
    super.key,
    required this.nameValidation,
    required this.phoneValidation,
    required this.formKey,
    required this.nameController,
    required this.phoneController,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: [
          TextFormField(
            controller: nameController,
            validator: (value) {
              return nameValidation(value ?? "");
            },
            keyboardType: TextInputType.name,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            decoration: const InputDecoration(
              hintText: "Enter Your Name",
              suffixIcon: Icon(Icons.edit),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          TextFormField(
            controller: phoneController,
            validator: (value) {
              return phoneValidation(value ?? "");
            },
            keyboardType: TextInputType.phone,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            decoration: const InputDecoration(
              hintText: "Enter Your Phone Number",
              suffixIcon: Icon(Icons.phone),
            ),
          ),
        ],
      ),
    );
  }
}
