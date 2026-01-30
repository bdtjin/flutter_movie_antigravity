import 'movie_date_dto.dart';
import 'movie_dto.dart';

/// TMDB API의 영화 목록 응답을 처리하는 DTO 클래스입니다.
///
/// [now_playing], [popular], [top_rated], [upcoming] 등 다양한 엔드포인트의 응답을
/// 공통으로 처리할 수 있도록 설계되었습니다.
class MovieResponseDto {
  /// 상영 기간 정보 (optional)
  ///
  /// [now_playing]이나 [upcoming] 응답에만 포함될 수 있으며,
  /// 다른 응답에서는 null일 수 있습니다.
  final DatesDto? dates;

  /// 현재 페이지 번호
  final int page;

  /// 영화 목록 데이터
  final List<MovieDto> results;

  /// 전체 페이지 수
  final int totalPages;

  /// 전체 결과 수
  final int totalResults;

  MovieResponseDto({
    this.dates,
    required this.page,
    required this.results,
    required this.totalPages,
    required this.totalResults,
  });

  /// JSON 맵에서 [MovieResponseDto]를 생성합니다.
  factory MovieResponseDto.fromJson(Map<String, dynamic> json) {
    return MovieResponseDto(
      dates: json['dates'] != null ? DatesDto.fromJson(json['dates']) : null,
      page: json['page'] as int? ?? 0,
      results: (json['results'] as List<dynamic>?)
              ?.map((e) => MovieDto.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      totalPages: json['total_pages'] as int? ?? 0,
      totalResults: json['total_results'] as int? ?? 0,
    );
  }

  /// [MovieResponseDto]를 JSON 맵으로 변환합니다.
  Map<String, dynamic> toJson() {
    return {
      'dates': dates?.toJson(),
      'page': page,
      'results': results.map((e) => e.toJson()).toList(),
      'total_pages': totalPages,
      'total_results': totalResults,
    };
  }
}
