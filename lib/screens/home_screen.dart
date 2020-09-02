import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_cascading_select/bloc/choice_bloc.dart';
import 'package:flutter_bloc_cascading_select/screens/multiselect_screen.dart';
import 'package:flutter_bloc_cascading_select/screens/status_screen.dart';
import 'package:flutter_bloc_cascading_select/screens/step_screen.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Bloc cascading select'),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            RaisedButton(
              child: Text('Multiselect'),
              onPressed: () => Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => MultiselectScreen(),
                ),
              ),
            ),
            RaisedButton(
              child: Text('Step by step'),
              onPressed: () => Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => BlocProvider.value(
                    value: BlocProvider.of<ChoiceBloc>(context),
                    child: StepScreen(),
                  ),
                ),
              ),
            ),
            RaisedButton(
              child: Text('Status'),
              onPressed: () => Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => StatusScreen(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
