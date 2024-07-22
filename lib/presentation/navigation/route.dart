import 'package:flutter/material.dart';
import 'package:recipes/presentation/screen/recipes.dart';


class Routes {
  static const String recipes = '/recipes';

  static Map<String, WidgetBuilder> getRoute() {
    return <String, WidgetBuilder>{
      recipes: (_) => const Recipes(),

    };
  }
}
