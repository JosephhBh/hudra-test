import 'package:beirutinexample/widgets/global_container.dart';
import 'package:flutter/material.dart';

class EidAlKiyama extends StatelessWidget {
  final String results;
  EidAlKiyama({
    required this.results,
  });

  @override
  Widget build(BuildContext context) {
    return GlobalContainer(
      title: "Eid al kiyama",
      results: results,
    );
  }
}
