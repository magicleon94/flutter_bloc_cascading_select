import 'package:flutter/foundation.dart';
import 'package:flutter_bloc_cascading_select/model/choice.dart';

class ChoiceRequest {
  final ChoiceType choiceType;
  final int selectedId;
  ChoiceRequest({
    @required this.choiceType,
    this.selectedId,
  }) : assert(choiceType != null);
}
