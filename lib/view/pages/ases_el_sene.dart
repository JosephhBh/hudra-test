import 'package:beirutinexample/widgets/global_container.dart';
import 'package:flutter/material.dart';

class AsesElSene extends StatelessWidget {
  final String results;
  AsesElSene({
    required this.results,
  });

  @override
  Widget build(BuildContext context) {
    return GlobalContainer(
      title: "Ases el sene",
      results: results,
    );
  }
}
