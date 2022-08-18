import 'package:beirutinexample/widgets/global_container.dart';
import 'package:flutter/material.dart';

class Maraji3AlKiyama extends StatelessWidget {
  final String results;
  Maraji3AlKiyama({
    required this.results,
  });

  @override
  Widget build(BuildContext context) {
    return GlobalContainer(
      title: "Maraji3 al kiyama",
      results: results,
    );
  }
}
