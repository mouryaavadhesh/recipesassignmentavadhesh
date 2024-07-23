import 'package:flutter/widgets.dart';
import 'package:recipes/data/entities/recipes_model.dart';
import 'package:recipes/data/utils/base/cubit.dart';
import 'package:recipes/presentation/screen/recipes_state.dart';
import 'package:rxdart/rxdart.dart';

class RecipesCubit extends AppBloc<RecipesState> {
  final List<RecipesModel> recipes = [];
  final nameController = TextEditingController();
  final categoryController = TextEditingController();
  final descriptionController = TextEditingController();
  final _nameController = BehaviorSubject<String>();
  final _categoryController = BehaviorSubject<String>();
  final _descriptionController = BehaviorSubject<String>();

  Stream<String> get nameStream => _nameController.stream;

  Stream<String> get categoryStream => _categoryController.stream;

  Stream<String> get descriptionStream => _descriptionController.stream;

  int index=0;
  RecipesCubit(InitialState initialState) : super(initialState) {
    init();
  }

  @override
  void init() {
    getRecipes();
  }

  Stream<bool> get isAddEnabled =>
      Rx.combineLatest3(nameStream, categoryStream, descriptionStream, (
        String name,
        String category,
        String description,
      ) {
        return true;
      });

  void updateName(String value) {
    if (value.isEmpty) {
      _nameController.sink.addError("");
    } else {
      _nameController.sink.add(value);
    }
  }

  void updateCategory(String value) {
    if (value.isEmpty) {
      _categoryController.sink.addError("");
    } else {
      _categoryController.sink.add(value);
    }
  }

  void updateDescription(String value) {
    if (value.isEmpty) {
      _descriptionController.sink.addError("");
    } else {
      _descriptionController.sink.add(value);
    }
  }

  Future<void> addRecipes() async {
    emit(LoadingState(recipesList: const []));
    recipes.add(RecipesModel(
        title: nameController.text,
        category: categoryController.text,
        description: descriptionController.text));
    nameController.text="";
    categoryController.text="";
    descriptionController.text="";
    _categoryController.sink.addError("");
    emit(LoadedState(recipesList: recipes));
  }

  Future<void> editRecipes(RecipesModel recipesModel) async {
    emit(LoadingState(recipesList: const []));
    recipes.remove(recipesModel);
    nameController.text=recipesModel.title;
    categoryController.text=recipesModel.category;
    descriptionController.text=recipesModel.description;
    _nameController.sink.add(recipesModel.title);
    _categoryController.sink.add(recipesModel.category);
    _descriptionController.sink.add(recipesModel.description);
    emit(LoadedState(recipesList: recipes));
  }

  Future<void> deleteRecipes(RecipesModel recipesModel) async {
    emit(LoadingState(recipesList: const []));
    recipes.remove(recipesModel);
    emit(LoadedState(recipesList: recipes));
  }

  Future<void> deleteAllRecipes() async {
    emit(LoadingState(recipesList: const []));
    recipes.clear();
    nameController.text="";
    categoryController.text="";
    descriptionController.text="";
    _categoryController.sink.addError("");
    emit(LoadedState(recipesList: recipes));
  }

  Future<void> searchRecipes(String searchText) async {
    var result = _getFilteredRecipes(searchText);
    if (searchText.isEmpty) {
      emit(LoadedState(recipesList: recipes));
    } else {
      emit(LoadedState(recipesList: result));
    }
  }

  List<RecipesModel> _getFilteredRecipes(String searchText) {
    List<RecipesModel> filteredRecipes = recipes.where((recipe) =>
    recipe.category.toLowerCase().contains(searchText.toLowerCase()) ||
        recipe.title.toLowerCase().contains(searchText.toLowerCase())
    ).toList();
    return filteredRecipes;
  }

  void getRecipes() {
    emit(LoadingState(recipesList: const []));
    recipes.add(RecipesModel(
        title: "Super Easy Stir-Fried Cabbage",
        category: "Side Dish",
        description:
            "A cabbage stir-fry recipe that's very simple to make. Using only soy sauce in this recipe brings out the natural sweetness in the cabbage."));
    recipes.add(RecipesModel(
        title: "Golden Butter Rice",
        category: "Indian",
        description:
            "This golden butter rice, flavored with ginger and turmeric, is a forgotten way of cooking butter rice. It isn't cooked rice with butter stirred in, it really is rice cooked in butter. This is my favorite version, with seasonings inspired by a classic Indian drink called golden milk."));
    emit(LoadedState(recipesList: recipes));
  }
}
