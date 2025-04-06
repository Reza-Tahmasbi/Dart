import 'package:equatable/equatable.dart';

abstract class BPlusTreeEvent {}

class InsertKeyEvent extends BPlusTreeEvent with EquatableMixin {
  final int key;
  InsertKeyEvent(this.key);

  @override
  List<Object?> get props => [key];
}

class AddRandomKey extends BPlusTreeEvent with EquatableMixin {
  AddRandomKey();

  @override
  List<Object?> get props => [];
}

class SearchKey extends BPlusTreeEvent with EquatableMixin {
  final int key;
  SearchKey(this.key);

  @override
  List<Object?> get props => [key];
}

class FindRangeValues extends BPlusTreeEvent with EquatableMixin {
  final int start;
  final int end;
  FindRangeValues(this.start, this.end);

  @override
  List<Object?> get props => [start, end];
}

class ResetTree extends BPlusTreeEvent with EquatableMixin {
  ResetTree();

  @override
  List<Object?> get props => [];
}

class RemoveKey extends BPlusTreeEvent with EquatableMixin {
  final int key;
  RemoveKey(this.key);

  @override
  List<Object?> get props => [key];
}