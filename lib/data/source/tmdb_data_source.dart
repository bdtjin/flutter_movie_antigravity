import 'dart:convert';
import 'package:http/http.dart' as http;
import '../dto/movie_response_dto.dart';
import '../dto/movie_dto.dart';

class TmdbDataSource {
  final String _baseUrl = 'https://api.themoviedb.org/3';
  final String _tmdbKey =
      'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIwYmNiNzJjNzQ4N2U1N2QxNDdiNDk3Mjg3MTlmZDE5ZiIsIm5iZiI6MTczMzM5MTMxNy45NzUwMDAxLCJzdWIiOiI2NzUxNzNkNThhZjZkM2ZlYjNhZmU0NDUiLCJzY29wZXMiOlsiYXBpX3JlYWQiXSwidmVyc2lvbiI6MX0.xwBAH8_W-yBA3RoH9JscnBQe_1McKgodxi1JO-kcJn8';

  Future<MovieResponseDto> getNowPlaying() async {
    final response = await http.get(
      Uri.parse('$_baseUrl/movie/now_playing?language=ko-KR&page=1'),
      headers: {
        'Authorization': _tmdbKey,
        'accept': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      return MovieResponseDto.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load now playing movies');
    }
  }

  Future<MovieResponseDto> getPopular() async {
    final response = await http.get(
      Uri.parse('$_baseUrl/movie/popular?language=ko-KR&page=1'),
      headers: {
        'Authorization': _tmdbKey,
        'accept': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      return MovieResponseDto.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load popular movies');
    }
  }

  Future<MovieResponseDto> getTopRated() async {
    final response = await http.get(
      Uri.parse('$_baseUrl/movie/top_rated?language=ko-KR&page=1'),
      headers: {
        'Authorization': _tmdbKey,
        'accept': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      return MovieResponseDto.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load top rated movies');
    }
  }

  Future<MovieResponseDto> getUpcoming() async {
    final response = await http.get(
      Uri.parse('$_baseUrl/movie/upcoming?language=ko-KR&page=1'),
      headers: {
        'Authorization': _tmdbKey,
        'accept': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      return MovieResponseDto.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load upcoming movies');
    }
  }

  Future<MovieDto> getMovieDetail(int movieId) async {
    final response = await http.get(
      Uri.parse('$_baseUrl/movie/$movieId?language=ko-KR'),
      headers: {
        'Authorization': _tmdbKey,
        'accept': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      return MovieDto.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load movie detail');
    }
  }
}
