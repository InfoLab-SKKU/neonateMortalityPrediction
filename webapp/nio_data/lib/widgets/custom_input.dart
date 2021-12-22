import 'package:flutter/material.dart';

class CustomInput extends StatelessWidget {
  final String title;
  final int inputVal;
  late final controller = TextEditingController();

  CustomInput({
    Key? key,
    required this.title,
    required this.inputVal,
  }) : super(key: key) {
    controller.text = inputVal.toString();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        vertical: 2,
        horizontal: 10.0,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(fontSize: 16.0),
          ),
          Container(
            width: 210.0,
            height: 35.0,
            child: TextField(
              controller: controller,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
              ),
            ),
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(
                Radius.circular(5.0),
              ),
              border: Border.all(),
            ),
          ),
        ],
      ),
    );
  }
}
