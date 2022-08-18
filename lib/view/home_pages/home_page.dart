import 'package:beirutinexample/controller/global_provider/global_provider.dart';
import 'package:beirutinexample/data/data.dart';
import 'package:beirutinexample/view/pages/ases_el_sene.dart';
import 'package:beirutinexample/view/pages/eid_al_kiyama.dart';
import 'package:beirutinexample/view/pages/maraji3_al_kiyama.dart';
import 'package:beirutinexample/widgets/global_container.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController _currentYearController = TextEditingController();
  int _currentYear = 0;
  String _asesLSene = "";
  String _maraji3AlKiyama = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Consumer<GlobalProvider>(builder: (context, globalProvider, _) {
        return Stack(
          fit: StackFit.loose,
          children: [
            Container(
              // color: Colors.blueAccent,
              child: Padding(
                padding: EdgeInsets.only(
                  top: 70,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text("Selected year : "),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: 60,
                          width: 150,
                          child: Center(
                            child: TextFormField(
                              controller: _currentYearController,
                              keyboardType: TextInputType.number,
                              onChanged: (String val) {
                                if (val.trim().length > 0) {
                                  _currentYear = int.parse(val);
                                  setState(() {});
                                }
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                top: 180,
              ),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    GlobalContainer(
                      title: "Ases el sene",
                      results: globalProvider.asesElSeneString,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    GlobalContainer(
                      title: "Maraji3 al kiyama",
                      results: globalProvider.maraji3AlKiyamaString,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    GlobalContainer(
                      title: "Eid al kiyama",
                      results: globalProvider.eidAlKiyamaString,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    GlobalContainer(
                      title: "Som el ba3outh",
                      results: globalProvider.somElBa3outhString,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    GlobalContainer(
                      title: "Som el kabir",
                      results: globalProvider.somElKabirString,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    GlobalContainer(
                      title: "Eid el sou3oud",
                      results: globalProvider.eidElSou3oudString,
                    ),
                  ],
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: 80,
                width: double.infinity,
                child: ElevatedButton(
                  child: Text('Get all results'),
                  onPressed: () {
                    globalProvider.getAllResults(_currentYear);
                  },
                ),
              ),
            ),
          ],
        );
      }),
    );
  }
}
