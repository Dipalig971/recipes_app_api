class RecipesModal {
  late List<Recipes> recipes;
  late int total, skip, limit;

  RecipesModal({
    required this.total,
    required this.skip,
    required this.limit,
    required this.recipes,
  });

  factory RecipesModal.fromJson(Map<String, dynamic> json) {
    return RecipesModal(
      total: json['total'],
      skip: json['skip'],
      limit: json['limit'],
      recipes: (json['recipes'] as List<dynamic>? ?? [])
          .map((e) => Recipes.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }
}
class Recipes {
  final int id;
  final String name;
  final List<String> ingredients;
  final List<String> instructions;
  final int prepTimeMinutes;
  final int cookTimeMinutes;
  final int servings;
  final String difficulty;
  final String cuisine;
  final int caloriesPerServing;
  final List<String> tags;
  final int userId;
  final String image;
  final double rating;
  final int reviewCount;
  final List<String> mealType;
  final String hero;

  Recipes({
    required this.id,
    required this.name,
    required this.ingredients,
    required this.instructions,
    required this.prepTimeMinutes,
    required this.cookTimeMinutes,
    required this.servings,
    required this.difficulty,
    required this.cuisine,
    required this.caloriesPerServing,
    required this.tags,
    required this.userId,
    required this.image,
    required this.rating,
    required this.reviewCount,
    required this.mealType,
    required this.hero
  });

  factory Recipes.fromJson(Map<String, dynamic> json) {
    return Recipes(
      id: json['id'],
      name: json['name'],
      ingredients: List<String>.from(json['ingredients']),
      instructions: List<String>.from(json['instructions']),
      prepTimeMinutes: json['prepTimeMinutes'],
      cookTimeMinutes: json['cookTimeMinutes'],
      servings: json['servings'],
      difficulty: json['difficulty'],
      cuisine: json['cuisine'],
      caloriesPerServing: json['caloriesPerServing'],
      tags: List<String>.from(json['tags']),
      userId: json['userId'],
      image: json['image'],
      rating: json['rating'].toDouble(),
      reviewCount: json['reviewCount'],
      mealType: List<String>.from(json['mealType']),
      hero: json['hero'] ?? '',
    );
  }

}

