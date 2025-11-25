import 'package:flutter/material.dart';

class HomeCategory extends StatefulWidget {
  const HomeCategory({super.key});

  @override
  State<HomeCategory> createState() => _HomeCategoryState();
}

class _HomeCategoryState extends State<HomeCategory> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 10,
        itemBuilder: (context, index) {
          return Container(
            width: 80,
            height: 100,
            alignment: Alignment.center,
            margin: EdgeInsets.symmetric(horizontal: 10),
            color: Colors.blue,
            child: Text(
              "分类$index",
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
          );
        },
      ),
    );
  }
}
