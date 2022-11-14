import 'package:flutter/material.dart';
import 'package:soko_number/game/structure.dart';
import 'package:soko_number/main.dart';
import 'package:get/get.dart';
import 'package:soko_number/view/widgets/selectlvlbut.dart';

class SelectLevels extends StatefulWidget with Structure {
  SelectLevels({super.key});

  @override
  _SelectLevelsState createState() {
    return _SelectLevelsState();
  }
}

class _SelectLevelsState extends State<SelectLevels> {
  // Structure S = Structure();
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Welcome To SukoNumber",
        ),
      ),
      body: Center(
        child: Column(
          children: [
            const Text("Select Level : "),
            CustomBottomLevels(
                text: "Level 1",
                onPressed: () {
                  setState(() {
                    Structure().selectedLvl = 1;
                    Structure().selectedLevel(Structure().selectedLvl);
                  });
                  Get.to(const MyHomePage());
                }),
            CustomBottomLevels(
                text: "Level 2",
                onPressed: () {
                  setState(() {
                    Structure().selectedLvl = 2;
                    Structure().selectedLevel(Structure().selectedLvl);
                    print(Structure().selectedLvl);
                    print(Structure().selectedLevel(Structure().selectedLvl));
                  });
                  Get.to(const MyHomePage());
                }),
            CustomBottomLevels(
                text: "Level 3",
                onPressed: () {
                  setState(() {
                    Structure().selectedLvl = 3;
                    Structure().selectedLevel(Structure().selectedLvl);
                  });
                  Get.to(const MyHomePage());
                }),
            CustomBottomLevels(
                text: "Level 4",
                onPressed: () {
                  setState(() {
                    Structure().selectedLvl = 4;
                    Structure().selectedLevel(Structure().selectedLvl);
                  });
                  Get.to(const MyHomePage());
                }),
            CustomBottomLevels(
                text: "Level 5",
                onPressed: () {
                  setState(() {
                    Structure().selectedLvl = 5;
                    Structure().selectedLevel(Structure().selectedLvl);
                  });
                  Get.to(const MyHomePage());
                }),
            CustomBottomLevels(
                text: "Level 6",
                onPressed: () {
                  setState(() {
                    Structure().selectedLvl = 6;
                    Structure().selectedLevel(Structure().selectedLvl);
                  });
                  Get.to(const MyHomePage());
                })
          ],
        ),
      ),
    );
  }
}
