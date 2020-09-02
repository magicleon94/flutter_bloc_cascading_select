import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_cascading_select/bloc/choice_bloc.dart';
import 'package:flutter_bloc_cascading_select/widgets/select_box.dart';

class MultiselectScreen extends StatefulWidget {
  @override
  _MultiselectScreenState createState() => _MultiselectScreenState();
}

class _MultiselectScreenState extends State<MultiselectScreen> {
  List<ChoiceBloc> blocs = [];

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (blocs.isEmpty) {
      var currentBloc = BlocProvider.of<ChoiceBloc>(context);
      while (currentBloc != null) {
        blocs.add(currentBloc);
        currentBloc = currentBloc.subBloc;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Multiselect screen'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            for (final bloc in blocs) SelectBox(bloc: bloc),
          ],
        ),
      ),
    );
  }
}
