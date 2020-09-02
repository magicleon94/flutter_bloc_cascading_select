import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_cascading_select/bloc/choice_bloc.dart';
import 'package:flutter_bloc_cascading_select/model/choice.dart';
import 'package:flutter_bloc_cascading_select/widgets/select_box.dart';

class StepScreen extends StatefulWidget {
  @override
  _StepScreenState createState() => _StepScreenState();
}

class _StepScreenState extends State<StepScreen> {
  @override
  Widget build(BuildContext context) {
    // ignore: close_sinks
    final nextBloc = BlocProvider.of<ChoiceBloc>(context).subBloc;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          '${BlocProvider.of<ChoiceBloc>(context).choiceType.asString()} step',
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: Center(
              child: SelectBox(),
            ),
          ),
          if (nextBloc != null)
            RaisedButton(
              child: Text('Next'),
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => BlocProvider.value(
                      value: nextBloc,
                      child: StepScreen(),
                    ),
                  ),
                );
              },
            ),
        ],
      ),
    );
  }
}
