import 'package:flutter/widgets.dart';
import 'package:recipes/data/entities/item_model.dart';
import 'package:recipes/data/utils/base/cubit.dart';
import 'package:recipes/presentation/screen/recipes_state.dart';

class RecipesCubit extends AppBloc<RecipesState> {
  final List<MovieResponse> movieData = [];

  RecipesCubit(MenuInitialState initialState) : super(initialState) {
    init();
  }

  @override
  void init() {
    _getMovie();
  }

  Future<void> searchMovie(String searchText) async {
    emit(LoadingState());
    final filteredMovies = getFilteredMoviesByLocation(searchText);
    emit(LoadedState(movieData: filteredMovies));
  }

  Future<void> _getMovie() async {
    emit(LoadingState());
    // _repo.getMovieData().thenListenData(onSuccess: (response) async {
    //   movieData.clear();
    //   movieData.addAll(response);
    //   emit(LoadedState(movieData: response));
    // }, onFailed: (data) {
    //   emit(LoadedState(movieData: const []));
    //   Navigator.of(_context).pop();
    // });
  }
  List<MovieResponse> getFilteredMoviesByLocation(String searchText) {
    var result = movieData; // You might not needthis line if movieData is accessible directly
    return result.where((movie) =>
        movie.locations.toLowerCase().contains(searchText.toLowerCase())
    ).toList();
  }
}
