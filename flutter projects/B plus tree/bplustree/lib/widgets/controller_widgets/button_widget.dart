import 'package:bplustree/bloc/bplus_tree_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../bloc/bplus_tree_event.dart';

class ButtonWidget extends StatefulWidget {
  final String title;
  final String buttonCaption;
  final double buttonWidth;
  const ButtonWidget(
      {super.key,
      required this.title,
      required this.buttonCaption,
      this.buttonWidth = 75});

  @override
  _ButtonWidgetState createState() => _ButtonWidgetState();
}

class _ButtonWidgetState extends State<ButtonWidget> {
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
  Widget build(
    BuildContext context,
  ) {
    final ThemeData themeData = Theme.of(context);
    return Column(
      children: [
        Text(widget.title, style: themeData.textTheme.labelMedium),
        const SizedBox(
          height: 5,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            IconButton(
              style: ButtonStyle(
                backgroundColor: WidgetStateProperty.all(Colors.white),
                foregroundColor: WidgetStateProperty.all(Colors.black),
                shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0),
                    side: const BorderSide(color: Colors.grey, width: 0.5),
                  ),
                ),
              ),
              onPressed: () {
                int currentValue = int.tryParse(_controller.text) ?? 1;
                setState(() {
                  if (currentValue > 1) {
                    _controller.text = (currentValue - 1).toString();
                  }
                });
              },
              icon: const Icon(CupertinoIcons.minus, size: 18, weight: 700),
            ),
            const SizedBox(
              width: 5,
            ),
            SizedBox(
              height: 44,
              width: 70,
              child: TextField(
                controller: _controller,
                textAlign: TextAlign.center,
                keyboardType: TextInputType.number,
                onChanged: _validateInput,
                decoration: const InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(12)),
                    borderSide: BorderSide(
                        color: Colors.blue, width: 0.5), // When focused
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(12)),
                    borderSide:
                        BorderSide(color: Colors.grey, width: 0.5), // When not focused
                  ),
                  filled: true,
                  fillColor: Colors.white,
                ),
              ),
            ),
            const SizedBox(
              width: 5,
            ),
            IconButton(
              style: ButtonStyle(
                backgroundColor: WidgetStateProperty.all(Colors.white),
                foregroundColor: WidgetStateProperty.all(Colors.black),
                shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0),
                    side: const BorderSide(color: Colors.grey, width: 0.5),
                  ),
                ),
              ),
              onPressed: () {
                int currentValue = int.tryParse(_controller.text) ?? 0;
                setState(() {
                  _controller.text = (currentValue + 1).toString();
                });
              },
              icon: const Icon(CupertinoIcons.add, size: 18, weight: 700),
            ),
            const SizedBox(
              width: 5,
            ),
            SizedBox(
              height: 40,
              width: widget.buttonWidth.toDouble(),
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: WidgetStateProperty.all(Colors.white),
                  foregroundColor: WidgetStateProperty.all(Colors.black),
                  shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0),
                      side: const BorderSide(color: Colors.grey, width: 0.5),
                    ),
                  ),
                ),
                onPressed: () {
                  final int insertedKey = int.tryParse(_controller.text) ?? 0;
                  BlocProvider.of<BPlusTreeBloc>(context)
                      .add(InsertKeyEvent(insertedKey));
                },
                child: Text(widget.buttonCaption,
                    style: themeData.textTheme.labelSmall),
              ),
            ),
          ],
        ),
      ],
    );
  }
}