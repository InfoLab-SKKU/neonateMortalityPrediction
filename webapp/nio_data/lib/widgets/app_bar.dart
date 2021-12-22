import 'package:flutter/material.dart';
import 'package:nio_data/constants/colors.dart';

class CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  final String title;
  final String? icon;

  const CustomAppBar({Key? key, required this.title, this.icon})
      : super(
          key: key,
        );
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.mainColor,
      leading: icon != null
          ? GestureDetector(
              child: Image.asset(icon!),
              onTap: () {
                Navigator.pop(context);
              },
            )
          : null,
      title: Text(
        title,
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
      centerTitle: false,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
