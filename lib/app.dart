import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_cascading_select/bloc/choice_bloc.dart';
import 'package:flutter_bloc_cascading_select/bloc/choice_bloc_event.dart';
import 'package:flutter_bloc_cascading_select/model/choice.dart';
import 'package:flutter_bloc_cascading_select/screens/home_screen.dart';
import 'package:flutter_bloc_cascading_select/service/choice_service.dart';

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  static const kChoicesSequence = [
    ChoiceType.CATEGORY,
    ChoiceType.SUBCATEGORY,
    ChoiceType.ITEM,
  ];
  ChoiceBloc choiceBloc;

  @override
  void initState() {
    super.initState();
    final service = MockChoiceService();
    choiceBloc = ChoiceBloc(
      service: service,
      choiceType: kChoicesSequence.first,
    );
    var currentBloc = choiceBloc;
    for (final type in kChoicesSequence.skip(1)) {
      currentBloc.subBloc = ChoiceBloc(service: service, choiceType: type);
      currentBloc = currentBloc.subBloc;
    }
    choiceBloc.add(ChoiceBlocFetchChoicesEvent());
  }

  @override
  void dispose() {
    choiceBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: choiceBloc,
      child: MaterialApp(
        title: 'Flutter Bloc cascading select',
        home: HomeScreen(),
      ),
    );
  }
}
