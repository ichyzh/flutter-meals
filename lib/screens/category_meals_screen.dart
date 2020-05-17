import 'package:flutter/material.dart';
import 'package:meals/models/meal.dart';
import 'package:meals/widgets/meal_item.dart';

class CategoryMealsScreen extends StatefulWidget {
  static const String route = '/category-meals';

  final List<Meal> avaliableMeals;

  CategoryMealsScreen(this.avaliableMeals);

  @override
  _CategoryMealsScreenState createState() => _CategoryMealsScreenState();
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {
  String title;
  List<Meal> categoryMeals;
  bool _loadedInitData = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (!_loadedInitData) {
      final routeArgs =
          ModalRoute.of(context).settings.arguments as Map<String, String>;
      title = routeArgs['title'];
      final id = routeArgs['id'];
      categoryMeals = widget.avaliableMeals.where((meal) {
        return meal.categories.contains(id);
      }).toList();
      _loadedInitData = true;
    } 
  }

  void _deleteMeal(String id) {
    categoryMeals.removeWhere((meal) => meal.id == id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: ListView.builder(
        itemBuilder: (ctx, i) {
          return MealItem(
            title: categoryMeals[i].title,
            id: categoryMeals[i].id,
            affordability: categoryMeals[i].affordability,
            complexity: categoryMeals[i].complexity,
            duration: categoryMeals[i].duration,
            imgUrl: categoryMeals[i].imageUrl,
          );
        },
        itemCount: categoryMeals.length,
      ),
    );
  }
}
