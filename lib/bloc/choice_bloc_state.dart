import 'package:flutter/foundation.dart';
import 'package:flutter_bloc_cascading_select/model/choice.dart';

abstract class ChoiceBlocState {}

class ChoiceBlocResetState extends ChoiceBlocState {
  @override
  String toString() => 'Reset';
}

class ChoiceBlocLoadingState extends ChoiceBlocState {
  @override
  String toString() => 'Loading';
}

class ChoiceBlocLoadedState extends ChoiceBlocState {
  final List<Choice> items;
  final Choice currentChoice;
  ChoiceBlocLoadedState({
    @required this.items,
    this.currentChoice,
  }) : assert(items != null);

  @override
  String toString() => currentChoice?.description ?? 'Loaded but not selected';
}
