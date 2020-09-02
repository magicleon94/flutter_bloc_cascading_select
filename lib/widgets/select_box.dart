import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_cascading_select/bloc/choice_bloc.dart';
import 'package:flutter_bloc_cascading_select/bloc/choice_bloc_event.dart';
import 'package:flutter_bloc_cascading_select/bloc/choice_bloc_state.dart';
import 'package:flutter_bloc_cascading_select/model/choice.dart';

class SelectBox extends StatefulWidget {
  final ChoiceBloc bloc;

  const SelectBox({
    Key key,
    this.bloc,
  }) : super(key: key);
  @override
  _SelectBoxState createState() => _SelectBoxState();
}

class _SelectBoxState extends State<SelectBox> {
  ChoiceBloc bloc;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    bloc ??= widget.bloc ?? BlocProvider.of<ChoiceBloc>(context);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChoiceBloc, ChoiceBlocState>(
      cubit: bloc,
      builder: (context, state) {
        if (state is ChoiceBlocLoadingState) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        var dropdownItems = <DropdownMenuItem<Choice>>[];
        Choice currentChoice;
        if (state is ChoiceBlocLoadedState) {
          dropdownItems = state.items
              .map<DropdownMenuItem<Choice>>(
                (item) => DropdownMenuItem(
                  child: Text(item.description),
                  value: item,
                ),
              )
              .toList();
          currentChoice = state.currentChoice;
        }
        return DropdownButton<Choice>(
          value: currentChoice,
          items: dropdownItems,
          hint: Text('Select...'),
          onChanged: (value) => bloc.add(
            ChoiceBlocSelectionEvent(selectedItem: value),
          ),
        );
      },
    );
  }
}
