class Choice {
  final int id;
  final String description;
  const Choice({
    this.id,
    this.description,
  });
}

enum ChoiceType {
  CATEGORY,
  SUBCATEGORY,
  ITEM,
}

extension ChoiceTypeExtension on ChoiceType {
  String asString() {
    switch (this) {
      case ChoiceType.CATEGORY:
        return 'Category';
      case ChoiceType.SUBCATEGORY:
        return 'Subcategory';
      case ChoiceType.ITEM:
        return 'Item';
      default:
        return null;
    }
  }
}
