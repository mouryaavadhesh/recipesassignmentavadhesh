import 'package:recipes/data/entities/recipes_model.dart';
import 'package:recipes/data/utils/base/cubit.dart';

class RecipesState extends BlocState {
  List<RecipesModel> recipesList = [];

  RecipesState({required this.recipesList});
}

class InitialState extends RecipesState {

  List<RecipesModel> recipesList;

  InitialState({required this.recipesList})
      : super(
          recipesList: recipesList,
        );
}

class LoadingState extends RecipesState {
  LoadingState({required super.recipesList});
}

class ErrorState extends RecipesState {
  ErrorState({required super.recipesList});
}

class LoadedState extends RecipesState {
  LoadedState({required super.recipesList});

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      super == other &&
          other is LoadedState &&
          runtimeType == other.runtimeType &&
          recipesList == other.recipesList;

  @override
  int get hashCode => super.hashCode ^ recipesList.hashCode;
}
