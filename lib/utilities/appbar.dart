import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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

      //to remove the back button in appbar and align the text to leftmost
      automaticallyImplyLeading: false,

      title: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              appBarTitle,
              style: GoogleFonts.signika(
                color: Colors.red,
                fontSize: 22.0,
                fontWeight: FontWeight.w400,
              ),
            ),
            Spacer(),
            if (icon != null)
              Icon(
                icon,
                color: Colors.black,
              ),
          ],
        ),

    );
  }
}
