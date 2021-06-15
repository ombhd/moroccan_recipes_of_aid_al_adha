class Recipe {
  final String? imageAsset;
  final String? title;
  final List<String?> ingredients;
  final List<String?> cookGuides;
  final int cookingDuration;
  int? rating;

  Recipe({
    required this.imageAsset,
    required this.title,
    required this.ingredients,
    required this.cookGuides,
    required this.cookingDuration,
    this.rating = 0,
  });
}
