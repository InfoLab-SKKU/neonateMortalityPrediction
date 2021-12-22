import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:nio_data/constants/colors.dart';

Widget customBtn(String title, Function() callback) => TextButton(
      onPressed: callback,
      child: Text(
        title,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.white,
          fontSize: 16.0,
        ),
      ),
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(AppColors.mainColor),
        padding: MaterialStateProperty.all(
            const EdgeInsets.symmetric(vertical: 25.0, horizontal: 10.0)),
      ),
    );
