import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_cascading_select/bloc/choice_bloc_event.dart';
import 'package:flutter_bloc_cascading_select/bloc/choice_bloc_state.dart';
import 'package:flutter_bloc_cascading_select/model/choice.dart';
import 'package:flutter_bloc_cascading_select/model/choice_request.dart';
import 'package:flutter_bloc_cascading_select/service/choice_service.dart';

class ChoiceBloc extends Bloc<ChoiceBlocEvent, ChoiceBlocState> {
  final ChoiceServiceBase service;
  final ChoiceType choiceType;
  ChoiceBloc subBloc;
  ChoiceBloc({
    @required this.service,
    @required this.choiceType,
    this.subBloc,
  })  : assert(service != null),
        assert(choiceType != null),
        super(ChoiceBlocResetState());

  @override
  Stream<ChoiceBlocState> mapEventToState(ChoiceBlocEvent event) async* {
    switch (event.runtimeType) {
      case ChoiceBlocSelectionEvent:
        final casted = event as ChoiceBlocSelectionEvent;
        subBloc?.add(ChoiceBlocResetCascadeEvent());
        subBloc?.add(
          ChoiceBlocFetchChoicesEvent(
            selectedItem: casted.selectedItem,
          ),
        );
        final currentState = state as ChoiceBlocLoadedState;

        yield ChoiceBlocLoadedState(
          items: currentState.items,
          currentChoice: casted.selectedItem,
        );

        break;

      case ChoiceBlocResetCascadeEvent:
        subBloc?.add(ChoiceBlocResetCascadeEvent());
        yield ChoiceBlocResetState();
        break;
      case ChoiceBlocFetchChoicesEvent:
        final casted = event as ChoiceBlocFetchChoicesEvent;

        final request = ChoiceRequest(
          choiceType: choiceType,
          selectedId: casted.selectedItem?.id,
        );

        yield ChoiceBlocLoadingState();

        final choices = await service.getChoices(request);

        yield ChoiceBlocLoadedState(items: choices);

        break;
      default:
        throw Exception('Unknown event');
    }
  }

  String get statusAsString {
    final buffer = StringBuffer();
    // ignore: close_sinks
    ChoiceBloc current = this;
    while (current != null) {
      buffer.writeln('${current.choiceType.asString()}: ${current.state}');
      current = current.subBloc;
    }
    return buffer.toString();
  }

  @override
  Future<void> close() {
    subBloc?.close();
    return super.close();
  }
}
