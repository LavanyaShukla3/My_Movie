import 'package:flutter/material.dart';
import 'package:my_movie/SearchPageUtilities/customElevatedButton.dart';


class searchPage extends StatefulWidget {
  const searchPage({super.key});

  @override
  State<searchPage> createState() => _searchPageState();
}

class _searchPageState extends State<searchPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Search',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
          backgroundColor:Colors.white,
        centerTitle: true,
      ),

        body: Column(

          children:<Widget>[
            TextField (
              decoration: InputDecoration(
              border: InputBorder.none,
              labelText: 'Search for movies',
              icon: Icon(Icons.search)
          ),
        ),
            SizedBox(height: 20),
            Column(
            children:<Widget>[
            Row(
              children:<Widget> [
                //image:'assets/images/action.png',
                //image:'assets/images/comedy.png',

                Expanded(child: CustomButton(genre: "Action",colour:"blue", OnTap:"Action"),),
                Expanded(child: CustomButton(genre:"Comedy",colour:"green", OnTap:"Comedy"),),
              ],
            ),
              SizedBox(height: 10),
            Row(
              children:<Widget> [
                //image:'assets/images/detective.png',
                //image:'assets/images/horror.png',
                Expanded(child: CustomButton(genre:"Detective",colour:"red", OnTap:"Detective"),),
                Expanded(child: CustomButton(genre:"Horror",colour:"grey", OnTap:"Horror"),),
                ],
            ),
              SizedBox(height: 10),
            Row(
              children:<Widget> [
                //image:'assets/images/romance.png',
                //image:'assets/images/sci-fi.png',
                Expanded(child: CustomButton(genre:"Romance",colour:"pink", OnTap:"Romance"),),
                Expanded(child: CustomButton(genre:"Sci-fi",colour:"teal", OnTap:"Sci-fi"),),
              ],
            ),
            ],
            ),
    ]
    ),
    );
  }
}

