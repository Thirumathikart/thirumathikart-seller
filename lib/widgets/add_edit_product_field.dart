import 'package:flutter/material.dart';

List<String> list = <String>['One', 'Two', 'Three', 'Four'];
String dropdownvalue = 'One';

class AddEditProductField extends StatelessWidget {
  const AddEditProductField(
      {Key? key, required this.productName, required this.namecontroller})
      : super(key: key);
  final String productName;
  final TextEditingController namecontroller;
  @override
  Widget build(BuildContext context) => Container(
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              productName,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 10),
            TextFormField(
              controller: namecontroller,
              decoration: InputDecoration(
                hintText: 'Enter ${productName.toLowerCase()}',
                border: const OutlineInputBorder(),
              ),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter ${productName.toLowerCase()}';
                }
                return null;
              },
            ),
          ],
        ),
      );
}
