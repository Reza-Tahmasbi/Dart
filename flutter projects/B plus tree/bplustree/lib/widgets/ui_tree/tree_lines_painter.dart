import 'package:bplustree/models/node.dart';
import 'package:flutter/material.dart';

class TreeLinesPainter extends CustomPainter {
  final Map<Node, Offset> positions;
  final List<List<Node>> edges;
  final double nodeHeight;

  TreeLinesPainter(this.positions, this.edges, this.nodeHeight);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.black
      ..strokeWidth = 2;

    for (var edge in edges) {
      Node parent = edge[0];
      Node child = edge[1];
      Offset parentPos = positions[parent]!;
      Offset childPos = positions[child]!;
      canvas.drawLine(
        Offset(parentPos.dx, parentPos.dy + nodeHeight), // Bottom of parent
        Offset(childPos.dx, childPos.dy), // Top of child
        paint,
      );
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}