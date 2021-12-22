import 'package:flutter/material.dart';

Widget card(String image, double height, String title, double imgHeight) =>
    Card(
      child: SizedBox(
        height: height,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 10.0,
            ),
            Text(
              title,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 10.0,
            ),
            Container(
              height: imgHeight,
              padding: const EdgeInsets.symmetric(
                horizontal: 10.0,
              ),
              child: Image.asset(image),
            ),
          ],
        ),
      ),
    );
