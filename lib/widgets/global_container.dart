import 'package:flutter/material.dart';

class GlobalContainer extends StatelessWidget {
  final String title;
  final String results;
  GlobalContainer({
    required this.title,
    required this.results,
  });
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          color: Colors.grey.withOpacity(0.5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            textBaseline: TextBaseline.alphabetic,
            children: [
              Text(title + " : "),
              Container(
                height: 40,
                child: Center(
                  child: Text(results),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
