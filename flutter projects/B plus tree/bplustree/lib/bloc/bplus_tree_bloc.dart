import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bplustree/models/bplus_tree.dart';
import 'bplus_tree_event.dart';
import 'bplus_tree_state.dart';

class BPlusTreeBloc extends Bloc<BPlusTreeEvent, BPlusTreeState> {
  BPlusTreeBloc()
      : super(BPlusTreeState(
          tree: BPlusTree(4), // maxKeys = 4, as shown in the UI
          searchResult: null,
          rangeResult: [],
          lastInsertedKey: null,
          lastRemovedKey: null,
          lastSplitKey: null,
          isBuilding: false,
        )) {
    on<InsertKeyEvent>((event, emit) {
      state.tree.insert(event.key, event.key);
      emit(BPlusTreeState(
        tree: state.tree,
        searchResult: state.searchResult,
        rangeResult: state.rangeResult,
        lastInsertedKey: event.key,
        lastRemovedKey: state.lastRemovedKey,
        lastSplitKey: state.lastSplitKey,
        isBuilding: state.isBuilding,
      ));
    });

    on<AddRandomKey>((event, emit) {
      state.tree.addRandom();
      emit(BPlusTreeState(
        tree: state.tree,
        searchResult: state.searchResult,
        rangeResult: state.rangeResult,
        lastInsertedKey: -1, // Placeholder to indicate an insertion happened
        lastRemovedKey: state.lastRemovedKey,
        lastSplitKey: state.lastSplitKey,
        isBuilding: state.isBuilding,
      ));
    });

    on<SearchKey>((event, emit) {
      final int? result = state.tree.search(event.key);
      emit(BPlusTreeState(
        tree: state.tree,
        searchResult: result,
        rangeResult: state.rangeResult,
        lastInsertedKey: state.lastInsertedKey,
        lastRemovedKey: state.lastRemovedKey,
        lastSplitKey: state.lastSplitKey,
        isBuilding: state.isBuilding,
      ));
    });

    on<FindRangeValues>((event, emit) {
      final List<MapEntry<int, int>> result =
          state.tree.findRange(event.start, event.end);
      emit(BPlusTreeState(
        tree: state.tree,
        searchResult: state.searchResult,
        rangeResult: result,
        lastInsertedKey: state.lastInsertedKey,
        lastRemovedKey: state.lastRemovedKey,
        lastSplitKey: state.lastSplitKey,
        isBuilding: state.isBuilding,
      ));
    });

    on<ResetTree>((event, emit) {
      state.tree.reset();
      emit(BPlusTreeState(
        tree: state.tree,
        searchResult: null,
        rangeResult: [],
        lastInsertedKey: null,
        lastRemovedKey: null,
        lastSplitKey: null,
        isBuilding: false,
      ));
    });

    on<RemoveKey>((event, emit) {
      state.tree.remove(event.key);
      emit(BPlusTreeState(
        tree: state.tree,
        searchResult: state.searchResult,
        rangeResult: state.rangeResult,
        lastInsertedKey: state.lastInsertedKey,
        lastRemovedKey: event.key,
        lastSplitKey: state.lastSplitKey,
        isBuilding: state.isBuilding,
      ));
    });
  }
}
