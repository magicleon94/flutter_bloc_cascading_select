# flutter_bloc_cascading_select

A toy project to see how BLoC can be used to manage a cascading select input flow.

Data is mocked and does not really take in account the id of the selected choice, but it doesn't matter much.

The idea is to have a sequence of chained `ChoiceBloc`, each one with a specific `ChoiceType`.

Selecting a choice will reset all the subsequent choices in a cascade fashion.

The chain can be edited by changing the `kChoicesSequence` array content in `app.dart`.

![Example](https://github.com/magicleon94/flutter_bloc_cascading_select/blob/master/example_gif.gif?raw=true)