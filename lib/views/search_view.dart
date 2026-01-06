import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sunly/widgets/custom_search_field.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(25.0),
          child: Column(
            children: [
              CustomSearchField(text: "Search about city's weather"),
              SizedBox(
                height: 25,
              ),
              Row(
                children: [
                  Icon(CupertinoIcons.exclamationmark_circle),
                  SizedBox(width: 10,),
                  Text(
                    "there is no weather, select city to start",
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
