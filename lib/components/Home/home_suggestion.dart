import 'package:flutter/material.dart';

class HomeSuggestion extends StatefulWidget {
  const HomeSuggestion({super.key});

  @override
  State<HomeSuggestion> createState() => _HomeSuggestionState();
}

class _HomeSuggestionState extends State<HomeSuggestion> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Container(
        height: 300,
        color: Colors.blue,
        alignment: Alignment.center,
        child: Text("推荐", style: TextStyle(color: Colors.white, fontSize: 20)),
      ),
    );
  }
}
