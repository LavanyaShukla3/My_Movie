import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String appBarTitle;
  final IconData? icon;

  CustomAppBar({required this.appBarTitle, this.icon});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      leading: const BackButton(
          color: Colors.grey,
      ),
      title: Row(
          children: <Widget>[
            Text(
              appBarTitle,
              style: const TextStyle(

                color: Colors.red,
                fontSize: 25.0,
                fontWeight: FontWeight.w400,
              ),
            ),
            Spacer(),
            if (icon != null)
              Icon(
                icon,
                color: Colors.grey,
              ),
          ],
        ),

    );
  }
}
