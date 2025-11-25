import 'package:flutter/material.dart';

class HomeMoreList extends StatefulWidget {
  const HomeMoreList({super.key});

  @override
  State<HomeMoreList> createState() => _HomeMoreListState();
}

class _HomeMoreListState extends State<HomeMoreList> {
  @override
  Widget build(BuildContext context) {
    return SliverGrid.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
      ),
      itemBuilder: (BuildContext context, int index) {
        return Container(
          alignment: Alignment.center,
          color: Colors.blue,
          child: Text(
            "商品",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
        );
      },
    );
  }
}
