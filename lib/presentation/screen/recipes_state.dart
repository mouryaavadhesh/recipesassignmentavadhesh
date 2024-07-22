import 'package:flutter/cupertino.dart';
import 'package:recipes/data/entities/item_model.dart';
import 'package:recipes/data/utils/base/cubit.dart';


class RecipesState extends BlocState {}

class MenuInitialState extends RecipesState {

  MenuInitialState();
}

class LoadingState extends RecipesState {}

class ErrorState extends RecipesState {}

class LoadedState extends RecipesState {
  final List<MovieResponse> movieData;

  LoadedState({required this.movieData});

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      super == other &&
          other is LoadedState &&
          runtimeType == other.runtimeType &&
          movieData == other.movieData;

  @override
  int get hashCode => super.hashCode ^ movieData.hashCode;
}
