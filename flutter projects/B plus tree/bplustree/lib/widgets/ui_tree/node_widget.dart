import 'package:flutter/material.dart';

class NodeWidget extends StatelessWidget {
  final List<int> keys;
  final bool isLeaf;

  const NodeWidget({required this.keys, required this.isLeaf, super.key});

  @override
  Widget build(BuildContext context) {
    // Default dimensions
    const double defaultWidth = 130.0;
    const double defaultHeight = 50.0;
    const double nonLeafHeight = 40.0; // Smaller height for non-leaf nodes
    const double widthPerKey = 30.0; // Additional width per key

    // Calculate width based on number of keys
    final double calculatedWidth = defaultWidth + (keys.length - 1) * widthPerKey;
    // Set height based on whether the node is a leaf
    final double calculatedHeight = isLeaf ? defaultHeight : nonLeafHeight;

    return Container(
      width: calculatedWidth,
      height: calculatedHeight,
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black, width: 0.5),
        color:Colors.white,
        borderRadius: BorderRadius.circular(5),
        boxShadow: [BoxShadow(
          color: Colors.grey.withOpacity(0.5),
          spreadRadius: 2,
          blurRadius: 5,
          offset: const Offset(0, 3), // changes position of shadow
        )],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: keys
            .map((key) => Padding(
                padding: const EdgeInsets.symmetric(horizontal: 3),
                child: Text(key.toString())))
            .toList(),
      ),
    );
  }
}
