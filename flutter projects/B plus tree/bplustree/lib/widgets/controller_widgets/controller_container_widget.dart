import 'package:bplustree/widgets/controller_widgets/button_widget.dart';
import 'package:bplustree/widgets/controller_widgets/key_per_node_widget.dart';
import 'package:bplustree/widgets/controller_widgets/labeled_button.dart';
import 'package:flutter/material.dart';

class ResponsiveContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    double width =
        MediaQuery.of(context).size.width * 0.98; // 80% of screen width
    double height =
        MediaQuery.of(context).size.height * 0.35; // 30% of screen height

    return Center(
      child: Container(
        margin: const EdgeInsets.all(20.0),
        width: width,
        height: height,
        decoration: BoxDecoration(
          border: Border.all(color: Color(0xffECECEC), width: 1),
          color: Color(0xffF8F8F8),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Center(
            child: Column(
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(("B plus tree"),
                      style: themeData.textTheme.bodyMedium),
                ),
              ],
            ),
            SizedBox(
              height: 6,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  KeyPerNodeWidget(title: "Keys per inner node"),
                  SizedBox(
                    width: 35,
                  ),
                  KeyPerNodeWidget(title: "Keys per leaf node"),
                  SizedBox(
                    width: 35,
                  ),
                  KeyPerNodeWidget(title: ""),
                  ButtonWidget(
                    title: "Find a range of values",
                    buttonCaption: "Find",
                    buttonWidth: 80,
                  ),
                  SizedBox(
                    width: 35,
                  ),
                  ButtonWidget(
                    title: "Search for a Key",
                    buttonCaption: "Search",
                    buttonWidth: 100,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 16,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ButtonWidget(title: "Add a Key", buttonCaption: "Add"),
                  SizedBox(
                    width: 35,
                  ),
                  LabeledButton(
                    title: "Add a random key",
                    buttonCaption: "Add Random",
                    buttonWidth: 140,
                  ),
                  SizedBox(
                    width: 35,
                  ),
                  LabeledButton(
                      title: "",
                      buttonCaption: "Play insertions",
                      buttonWidth: 150),
                  SizedBox(
                    width: 35,
                  ),
                  LabeledButton(
                    title: "",
                    buttonCaption: "Reset",
                    buttonWidth: 100,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 16,
            ),
            Text("Click keys to remove",
                style: themeData.textTheme.labelMedium),
          ],
        )),
      ),
    );
  }
}