import 'package:flutter_bloc_cascading_select/model/choice.dart';
import 'package:flutter_bloc_cascading_select/model/choice_request.dart';

abstract class ChoiceServiceBase {
  Future<List<Choice>> getChoices(ChoiceRequest request);
}

class MockChoiceService extends ChoiceServiceBase {
  //this only offers a set of choices regardless of the selected one
  static const _choicesMockData = {
    ChoiceType.CATEGORY: [
      const Choice(id: 1, description: "Category 1"),
      const Choice(id: 2, description: "Category 2"),
      const Choice(id: 3, description: "Category 3"),
    ],
    ChoiceType.SUBCATEGORY: [
      const Choice(id: 4, description: "SubCategory 4"),
      const Choice(id: 5, description: "SubCategory 5"),
      const Choice(id: 6, description: "SubCategory 6"),
    ],
    ChoiceType.ITEM: [
      const Choice(id: 7, description: "Item 7"),
      const Choice(id: 8, description: "Item 8"),
      const Choice(id: 9, description: "Item 9"),
    ],
  };
  @override
  Future<List<Choice>> getChoices(ChoiceRequest request) async {
    return _choicesMockData[request.choiceType];
  }
}
