import '../../domain/entity/movie_entity.dart';
import '../source/tmdb_data_source.dart';

class MovieRepository {
  final TmdbDataSource _tmdbDataSource = TmdbDataSource();

  Future<List<MovieEntity>> getNowPlaying() async {
    final response = await _tmdbDataSource.getNowPlaying();
    return response.results
        .map((e) => MovieEntity(
              id: e.id,
              posterPath: e.posterPath ?? '',
            ))
        .toList();
  }

  Future<List<MovieEntity>> getPopular() async {
    final response = await _tmdbDataSource.getPopular();
    return response.results
        .map((e) => MovieEntity(
              id: e.id,
              posterPath: e.posterPath ?? '',
            ))
        .toList();
  }

  Future<List<MovieEntity>> getTopRated() async {
    final response = await _tmdbDataSource.getTopRated();
    return response.results
        .map((e) => MovieEntity(
              id: e.id,
              posterPath: e.posterPath ?? '',
            ))
        .toList();
  }

  Future<List<MovieEntity>> getUpcoming() async {
    final response = await _tmdbDataSource.getUpcoming();
    return response.results
        .map((e) => MovieEntity(
              id: e.id,
              posterPath: e.posterPath ?? '',
            ))
        .toList();
  }

  Future<MovieEntity> getMovieDetail(int movieId) async {
    final response = await _tmdbDataSource.getMovieDetail(movieId);
    return MovieEntity(
      id: response.id,
      posterPath: response.posterPath ?? '',
    );
  }
}
