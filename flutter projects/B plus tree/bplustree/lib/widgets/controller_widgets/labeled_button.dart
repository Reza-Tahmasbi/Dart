// StatefulWidget for AddWidget to handle the TextEditingController correctly
import 'package:bplustree/bloc/bplus_tree_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../bloc/bplus_tree_event.dart';

class LabeledButton extends StatefulWidget {
  final String title;
  final String buttonCaption;
  final double buttonWidth;
  const LabeledButton({super.key, required this.title, required this.buttonCaption, this.buttonWidth = 75});

  @override
  _LabeledButtonWidgetState createState() => _LabeledButtonWidgetState();
}

class _LabeledButtonWidgetState extends State<LabeledButton> {
  final TextEditingController _controller = TextEditingController(text: "100");
  @override
  void dispose() {
    _controller.dispose(); // Dispose of the controller to avoid memory leaks
    super.dispose();
  }

  void _validateInput(String value) {
    int? number = int.tryParse(value);
    if (number == null || number < 1) {
      _controller.text = "1";
      _controller.selection = TextSelection.fromPosition(
          TextPosition(offset: _controller.text.length));
    }
  }

  @override
  Widget build(BuildContext context,) {
    final ThemeData themeData = Theme.of(context);
    return Column(
      children: [
        Text(widget.title,
            style: themeData.textTheme.labelMedium),
        SizedBox(
          height: 5,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: 6,
            ),
            SizedBox(
              height: 40,
              width: widget.buttonWidth,
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: WidgetStateProperty.all(Colors.white),
                  foregroundColor: WidgetStateProperty.all(Colors.black),
                  shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                      side: const BorderSide(color: Colors.grey, width: 0.5),
                    ),
                  ),
                ),
                onPressed: () {
                  final int insertedKey = int.tryParse(_controller.text) ?? 0;
                  BlocProvider.of<BPlusTreeBloc>(context)
                      .add(InsertKeyEvent(insertedKey));
                },
                child: Text(widget.buttonCaption, style: themeData.textTheme.labelSmall,),
              ),
            ),
          ],
        ),
      ],
    );
  }
}