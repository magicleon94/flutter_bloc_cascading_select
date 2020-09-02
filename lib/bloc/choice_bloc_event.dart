import 'package:flutter/foundation.dart';
import 'package:flutter_bloc_cascading_select/model/choice.dart';

abstract class ChoiceBlocEvent {}

class ChoiceBlocSelectionEvent extends ChoiceBlocEvent {
  final Choice selectedItem;
  ChoiceBlocSelectionEvent({
    @required this.selectedItem,
  }) : assert(selectedItem != null);
}

class ChoiceBlocResetCascadeEvent extends ChoiceBlocEvent {}

class ChoiceBlocFetchChoicesEvent extends ChoiceBlocEvent {
  final Choice selectedItem;
  ChoiceBlocFetchChoicesEvent({
    this.selectedItem,
  });
}
