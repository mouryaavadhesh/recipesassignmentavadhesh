import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipes/data/entities/recipes_model.dart';
import 'package:recipes/data/utils/constant/constants.dart';
import 'package:recipes/presentation/screen/recipes_cubit.dart';
import 'package:recipes/presentation/screen/recipes_state.dart';
import 'package:recipes/presentation/styles/text_styling.dart';
import 'package:recipes/presentation/template/text.dart';
import 'package:recipes/presentation/widgets/reusable_widget.dart';

class Recipes extends StatefulWidget {
  const Recipes({super.key});

  @override
  _RecipesState createState() => _RecipesState();
}

class _RecipesState extends State<Recipes> with TickerProviderStateMixin {
  late Animation animation;
  late AnimationController animationController;
  final TextEditingController categoryController = TextEditingController();

  @override
  void initState() {
    super.initState();

    animationController = AnimationController(
        duration: const Duration(milliseconds: 1500), vsync: this);
    animation = Tween<double>(
      begin: -3,
      end: 10,
    ).animate(
      CurvedAnimation(parent: animationController, curve: Curves.linear),
    )..addListener(() {});
    animationController.repeat();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        centerTitle: true,
        title: MyText.textBold(text: "Recipes", fontSize: 14),
      ),
      body: BlocProvider(
        create: (BuildContext context) =>
            RecipesCubit(InitialState(recipesList: const [])),
        child: BlocBuilder<RecipesCubit, RecipesState>(
          builder: (context, state) {
            return CustomScrollView(
              slivers: <Widget>[
                SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (BuildContext context, int index) => Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          StreamBuilder<String>(
                              stream: context.read<RecipesCubit>().nameStream,
                              builder: (context, snapshot) {
                                return TextField(
                                  maxLength: 100,
                                  style: TextStyling.textMedium14(),
                                  controller: context
                                      .read<RecipesCubit>()
                                      .nameController,
                                  onChanged: (text) => {
                                    context
                                        .read<RecipesCubit>()
                                        .updateName(text)
                                  },
                                  textCapitalization: TextCapitalization.words,
                                  keyboardType: TextInputType.text,
                                  decoration: const InputDecoration(
                                      counterText: "",
                                      fillColor: Colors.white,
                                      filled: true,
                                      isDense: true,
                                      hintText: "Title"),
                                );
                              }),
                          StreamBuilder<String>(
                              stream:
                                  context.read<RecipesCubit>().categoryStream,
                              builder: (context, snapshot) {
                                return TextField(
                                  maxLength: 100,
                                  style: TextStyling.textMedium14(),
                                  controller: context
                                      .read<RecipesCubit>()
                                      .categoryController,
                                  onChanged: (text) => {
                                    context
                                        .read<RecipesCubit>()
                                        .updateCategory(text)
                                  },
                                  textCapitalization: TextCapitalization.words,
                                  keyboardType: TextInputType.text,
                                  decoration: const InputDecoration(
                                      counterText: "",
                                      fillColor: Colors.white,
                                      filled: true,
                                      isDense: true,
                                      hintText: "Category"),
                                );
                              }),
                          StreamBuilder<String>(
                              stream: context
                                  .read<RecipesCubit>()
                                  .descriptionStream,
                              builder: (context, snapshot) {
                                return TextField(
                                  maxLength: 100,
                                  style: TextStyling.textMedium14(),
                                  controller: context
                                      .read<RecipesCubit>()
                                      .descriptionController,
                                  onChanged: (text) => {
                                    context
                                        .read<RecipesCubit>()
                                        .updateDescription(text)
                                  },
                                  textCapitalization: TextCapitalization.words,
                                  keyboardType: TextInputType.text,
                                  decoration: const InputDecoration(
                                      counterText: "",
                                      fillColor: Colors.white,
                                      filled: true,
                                      isDense: true,
                                      hintText: "Description"),
                                );
                              }),
                        ],
                      ),
                    ),
                    childCount: 1,
                  ),
                ),
                SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (BuildContext context, int index) => Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          StreamBuilder<bool>(
                              stream: context.read<RecipesCubit>().isAddEnabled,
                              builder: (context, snapshot) {
                                return ElevatedButton(
                                  onPressed: snapshot.hasData
                                      ? () {
                                          context
                                              .read<RecipesCubit>()
                                              .addRecipes();
                                        }
                                      : null,
                                  // Disable button if not enabled
                                  style: ElevatedButton.styleFrom(
                                    foregroundColor: snapshot.hasData
                                        ? Colors.white
                                        : Colors.grey,
                                    // Adjust color based on enabled state
                                    backgroundColor: Colors
                                        .red, // Adjust background color as needed
                                  ),
                                  child: const Text('Add'),
                                );
                              }),
                          ElevatedButton(
                            onPressed: state.recipesList.isNotEmpty
                                ? () {
                                    context
                                        .read<RecipesCubit>()
                                        .deleteAllRecipes();
                                  }
                                : null,
                            style: ElevatedButton.styleFrom(
                              foregroundColor: state.recipesList.isNotEmpty
                                  ? Colors.white
                                  : Colors.grey,
                              // Adjust color based on enabled state
                              backgroundColor: Colors
                                  .red, // Adjust background color as needed
                            ),
                            child: const Text('Delete All'),
                          ),
                        ],
                      ),
                    ),
                    childCount: 1,
                  ),
                ),
                SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (BuildContext context, int index) => Card(
                      margin: const EdgeInsets.only(
                          top: 20, left: 10, right: 10, bottom: 10),
                      child: SizedBox(
                        height: 60,
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: Dimension.leftMarginScreen,
                              top: 5,
                              right: Dimension.leftMarginScreen,
                              bottom: 5),
                          child: TextField(
                            maxLines: 1,
                            onChanged: (value) {
                              context.read<RecipesCubit>().searchRecipes(value);
                            },
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5.0)),
                                borderSide: BorderSide(
                                  width: 0,
                                  style: BorderStyle.none,
                                ),
                              ),
                              filled: false,
                              suffixIcon: Icon(
                                Icons.search,
                              ),
                              fillColor: Color(0xFFFAFAFA),
                              hintStyle: TextStyle(
                                  color: Color(0xFFd0cece), fontSize: 14),
                              hintText: "Search Recipes by title or category",
                            ),
                          ),
                        ),
                      ),
                    ),
                    childCount: 1,
                  ),
                ),
                if (state.recipesList.isEmpty) ...[
                  SliverList(
                    delegate: SliverChildBuilderDelegate(
                      (BuildContext context, int index) => Container(
                        height: 500,
                        margin: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 16),
                        padding: const EdgeInsets.only(
                            left: 20, right: 20, top: 20, bottom: 20),
                        child: MyText.textBold(
                            text: "No Recipes Found ", fontSize: 14),
                      ),
                      childCount: 1,
                    ),
                  )
                ],
                if (state.recipesList.isNotEmpty) ...[
                  SliverList(
                    delegate: SliverChildBuilderDelegate(
                      (BuildContext context, int index) =>
                          _buildMovieList(state.recipesList[index], context),
                      childCount: state.recipesList.length,
                    ),
                  ),
                ],
                if (state is LoadingState) ...[
                  SliverList(
                    delegate: SliverChildBuilderDelegate(
                      (BuildContext context, int index) =>
                          ReusableWidget.animationLayout(
                              animation, MediaQuery.of(context).size.width),
                      childCount: 1,
                    ),
                  )
                ]
              ],
            );
          },
        ),
      ),
    );
  }

  Widget _buildMovieList(RecipesModel recipes, BuildContext context) => Card(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
        elevation: 4.0,
        margin: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
        child: Container(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    MyText.textRegular(
                        text: recipes.title, fontSize: 14, maxLines: 2),
                    MyText.textRegular(
                        text: recipes.category, fontSize: 14, maxLines: 2),
                    MyText.textRegular(
                        text: recipes.description, fontSize: 14, maxLines: 2),
                  ],
                ),
              ),
              IconButton(
                icon: const Icon(Icons.edit),
                onPressed: () =>
                    context.read<RecipesCubit>().editRecipes(recipes),
              ),
              IconButton(
                icon: const Icon(Icons.delete),
                onPressed: () =>
                    context.read<RecipesCubit>().deleteRecipes(recipes),
              ),
            ],
          ),
        ),
      );

  @override
  void dispose() {
    animation.removeListener(() {});
    animationController.dispose();
    super.dispose();
  }
}
