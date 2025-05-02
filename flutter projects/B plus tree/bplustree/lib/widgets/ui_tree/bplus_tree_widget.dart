import 'package:bplustree/models/node.dart';
import 'package:bplustree/widgets/ui_tree/layout_utils.dart';
import 'package:bplustree/widgets/ui_tree/node_widget.dart';
import 'package:bplustree/widgets/ui_tree/tree_lines_painter.dart';
import 'package:flutter/material.dart';

import '../../utils/tuple.dart';

class BPlusTreeWidget extends StatelessWidget {
  final Node? root;

  const BPlusTreeWidget({required this.root, super.key});

  @override
  Widget build(BuildContext context) {
    if (root == null) {
      return const Center(child: Text('Tree is empty'));
    }

    Map<Node, Offset> positions = {};
    List<List<Node>> edges = [];
    // Avoid pattern matching; explicitly extract values
    final Tuple2<double, double> result = layoutSubtree(root!, 0, 0, positions);
    final double totalWidth = result.item1;
    final double totalHeight = result.item2;
    
    collectEdges(root!, edges);

    List<Widget> nodeWidgets = positions.entries.map((entry) {
      Node node = entry.key;
      Offset pos = entry.value;
      const double width = 100; // Matches layoutSubtree
      return Positioned(
        left: pos.dx - width / 2,
        top: pos.dy,
        child: NodeWidget(keys: node.keys, isLeaf: node.isLeaf),
      );
    }).toList();

    Widget lines = CustomPaint(
      painter: TreeLinesPainter(positions, edges, 50), // nodeHeight = 50
    );

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: SizedBox(
          width: totalWidth,
          height: totalHeight,
          child: Stack(
            children: [
              lines,
              ...nodeWidgets,
            ],
          ),
        ),
      ),
    );
  }
}