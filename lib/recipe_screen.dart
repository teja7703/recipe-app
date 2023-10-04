import 'package:flutter/material.dart';

class RecipeDetailScreen extends StatelessWidget {
  final Map<String, dynamic> recipe;

  const RecipeDetailScreen({Key? key, required this.recipe}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          recipe['label'],
          style: TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.green,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(recipe['image']),
            const SizedBox(height: 16.0),
            Text(
              'Source: ${recipe['source']}',
              style: TextStyle(
                fontSize: 18.0,
                color: Colors.blue,
              ),
            ),
            Text(
              'Yield: ${recipe['yield']} servings',
              style: TextStyle(
                fontSize: 18.0,
              ),
            ),
            Text(
              'Calories: ${recipe['calories']} kcal',
              style: TextStyle(
                fontSize: 18.0,
              ),
            ),
            Text(
              'Total Weight: ${recipe['totalWeight']} g',
              style: TextStyle(
                fontSize: 18.0,
              ),
            ),
            const SizedBox(height: 16.0),
            Text(
              'Ingredients:',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                for (var i = 0; i < (recipe['ingredients'] as List).length; i++)
                  _buildIngredientCard(i + 1, recipe['ingredients'][i]),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildIngredientCard(int index, Map<String, dynamic> ingredient) {
    final text = ingredient['text'];
    final quantity = ingredient['quantity'];
    final measure = ingredient['measure'];
    final food = ingredient['food'];
    final weight = ingredient['weight'];
    final foodCategory = ingredient['foodCategory'];
    final image = ingredient['image'];

    return Card(
      margin: const EdgeInsets.only(bottom: 16.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Ingredient $index:',
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'Text: $text',
              style: TextStyle(
                fontSize: 16.0,
              ),
            ),
            const SizedBox(height: 8.0),
            Text(
              'Quantity: $quantity $measure',
              style: TextStyle(
                fontSize: 16.0,
              ),
            ),
            Text(
              'Food: $food',
              style: TextStyle(
                fontSize: 16.0,
              ),
            ),
            Text(
              'Weight: $weight g',
              style: TextStyle(
                fontSize: 16.0,
              ),
            ),
            Text(
              'Food Category: $foodCategory',
              style: TextStyle(
                fontSize: 16.0,
              ),
            ),
            const SizedBox(height: 8.0),
            Image.network(image),
          ],
        ),
      ),
    );
  }
}
