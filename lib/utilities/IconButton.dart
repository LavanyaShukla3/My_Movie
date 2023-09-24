import 'package:flutter/material.dart';
import 'package:my_movie/moviedb/listPage.dart';
import 'package:my_movie/moviedb/navigationPage.dart';
import 'package:my_movie/moviedb/searchPage.dart';
import 'package:my_movie/moviedb/userInfoPage.dart';
import 'package:my_movie/moviedb/moviehomepage.dart';

class IconButtons extends StatefulWidget {
  IconButtons({required this.page, required this.icon});
  final String page;
  final String icon;

  @override
  State<IconButtons> createState() => _IconButtonsState();
}

class _IconButtonsState extends State<IconButtons> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => getPage(),
          ),
        );
      },
      child: getIcon(),
    );
  }

  Widget getPage() {
    switch (widget.page) {
      case "movie_Homepage":
        return movie_Homepage();
      case "searchPage":
        return searchPage();
      case "navigationPage":
        return navigationPage();
      case "listPage":
        return listPage();
      case "userInfoPage":
        return userInfoPage();
      default:
        return movie_Homepage(); // Default to movie_Homepage if not recognized
    }
  }

  Icon getIcon() {
    switch (widget.icon) {
      case "home":
        return Icon(Icons.home);
      case "search":
        return Icon(Icons.search);
      case "assistant_navigation":
        return Icon(Icons.assistant_navigation);
      case "list":
        return Icon(Icons.list);
      case "supervised_user_circle":
        return Icon(Icons.supervised_user_circle);
      default:
        return Icon(Icons.home);
    }
  }
}
