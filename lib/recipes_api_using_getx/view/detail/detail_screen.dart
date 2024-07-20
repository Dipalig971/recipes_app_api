import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:product_api/recipes_api_using_getx/modal/recipes_modal.dart';

class DetailScreen extends StatelessWidget {
  final Recipes recipes;
  const DetailScreen({super.key, required this.recipes});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FadeIn(
              duration: Duration(seconds: 5),
              child: Image.network(
                recipes.image,
                fit: BoxFit.cover,
                width: double.infinity,
                height: 350,  // Adjust the height as needed
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 60),
                    child: BounceInLeft(
                      duration: Duration(seconds: 5),
                      child: Text(
                        recipes.name,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 25,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  FadeInUp(
                    duration: Duration(seconds: 5),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Preparation Time: ${recipes.prepTimeMinutes} minutes',
                          style: const TextStyle(fontSize: 18),
                        ),
                        Text(
                          'Cook Time: ${recipes.cookTimeMinutes} minutes',
                          style: const TextStyle(fontSize: 18),
                        ),
                        Text(
                          'Servings: ${recipes.servings}',
                          style: const TextStyle(fontSize: 18),
                        ),
                        Text(
                          'Difficulty: ${recipes.difficulty}',
                          style: const TextStyle(fontSize: 18),
                        ),
                        Text(
                          'Cuisine: ${recipes.cuisine}',
                          style: const TextStyle(fontSize: 18),
                        ),
                        Text(
                          'Calories per Serving: ${recipes.caloriesPerServing}',
                          style: const TextStyle(fontSize: 18),
                        ),
                        const SizedBox(height: 20),
                        const Text(
                          'Ingredients:',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                        ListView.builder(
                          shrinkWrap: true,
                          itemCount: recipes.ingredients.length,
                          itemBuilder: (context, index) {
                            return FadeInLeft(
                              duration: Duration(seconds: 2),
                              child: Text(
                                '- ${recipes.ingredients[index]}',
                                style: const TextStyle(
                                  fontSize: 18,
                                ),
                              ),
                            );
                          },
                        ),
                        const SizedBox(height: 20),
                        const Text(
                          'Instructions:',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                        ListView.builder(
                          shrinkWrap: true,
                          itemCount: recipes.instructions.length,
                          itemBuilder: (context, index) {
                            return FadeInRight(
                              duration: Duration(seconds: 2),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(vertical: 8.0),
                                child: Text(
                                  '${index + 1}. ${recipes.instructions[index]}',
                                  style: const TextStyle(
                                    fontSize: 18,
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                        const SizedBox(height: 20),
                        FadeInUp(
                          duration: Duration(seconds: 5),
                          child: Text(
                            'Tags: ${recipes.tags.join(', ')}',
                            style: const TextStyle(fontSize: 18),
                          ),
                        ),
                        FadeInUp(
                          duration: Duration(seconds: 5),
                          child: Text(
                            'User ID: ${recipes.userId}',
                            style: const TextStyle(fontSize: 18),
                          ),
                        ),
                        FadeInUp(
                          duration: Duration(seconds: 2),
                          child: Text(
                            'Rating: ${recipes.rating.toStringAsFixed(1)}',
                            style: const TextStyle(fontSize: 18),
                          ),
                        ),
                        FadeInUp(
                          duration: Duration(seconds: 2),
                          child: Text(
                            'Review Count: ${recipes.reviewCount}',
                            style: const TextStyle(fontSize: 18),
                          ),
                        ),
                        FadeInUp(
                          duration: Duration(seconds: 2),
                          child: Text(
                            'Meal Type: ${recipes.mealType.join(', ')}',
                            style: const TextStyle(fontSize: 18),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
