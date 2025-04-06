import 'package:equatable/equatable.dart';
import '../models/bplus_tree.dart';

class BPlusTreeState extends Equatable {
  // The current B+ tree (already included).
  final BPlusTree tree;
  // The result of a search operation (the value found, or null if not found).
  final int? searchResult;
  // The result of a range query (list of key-value pairs).
  final List<MapEntry<int, int>>? rangeResult;
  // The key that was last inserted (for insertion animation).
  final int? lastInsertedKey;
  // The key that was last removed (for deletion animation).
  final int? lastRemovedKey;
  // The key that was promoted during the last split (for splitting animation).
  final int? lastSplitKey;
  // A flag to indicate if the tree is being built (for tree-building animation).
  final bool isBuilding;

  const BPlusTreeState(
      {this.searchResult,
      required this.rangeResult,
      this.lastInsertedKey,
      this.lastRemovedKey,
      this.lastSplitKey,
      this.isBuilding = false,
      required this.tree});

  @override
  List<Object?> get props => [
        tree,
        searchResult,
        rangeResult,
        lastInsertedKey,
        lastRemovedKey,
        lastSplitKey,
        isBuilding
      ];
}
