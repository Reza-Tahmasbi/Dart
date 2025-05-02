import 'package:bplustree/models/node.dart';
import 'package:bplustree/utils/tuple.dart';
import 'package:flutter/material.dart';

Tuple2<double, double> layoutSubtree(
  Node node,
  double x,
  double y,
  Map<Node, Offset> positions,
) {
  const double nodeWidth = 100; // Fixed width for simplicity
  const double nodeHeight = 50; // Fixed height
  const double verticalSpacing = 100; // Space between levels

  if (node.isLeaf) {
    positions[node] = Offset(x + nodeWidth / 2, y);
    return const Tuple2(nodeWidth, nodeHeight);
  } else {
    InternalNode internal = node as InternalNode;
    double currentX = x;
    double maxChildHeight = 0;

    for (var child in internal.children) {
      // Avoid pattern matching; explicitly extract values
      final Tuple2<double, double> childResult = layoutSubtree(
        child,
        currentX,
        y + verticalSpacing,
        positions,
      );
      final double childWidth = childResult.item1;
      final double childHeight = childResult.item2;
      currentX += childWidth;
      maxChildHeight = maxChildHeight > childHeight ? maxChildHeight : childHeight;
    }

    double totalWidth = currentX - x;
    double subtreeWidth = totalWidth > nodeWidth ? totalWidth : nodeWidth;
    double parentX = x + subtreeWidth / 2;
    positions[node] = Offset(parentX, y);
    double subtreeHeight = nodeHeight + verticalSpacing + maxChildHeight;

    return Tuple2(subtreeWidth, subtreeHeight);
  }
}

void collectEdges(Node node, List<List<Node>> edges) {
  if (!node.isLeaf) {
    InternalNode internal = node as InternalNode;
    for (var child in internal.children) {
      edges.add([node, child]); // [parent, child]
      collectEdges(child, edges);
    }
  }
}