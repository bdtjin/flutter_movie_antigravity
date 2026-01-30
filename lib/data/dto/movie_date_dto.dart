/// 상영 기간 정보를 담는 DTO 클래스입니다.
class DatesDto {
  /// 상영 끝 날짜 (YYYY-MM-DD 형식)
  final String maximum;

  /// 상영 시작 날짜 (YYYY-MM-DD 형식)
  final String minimum;

  DatesDto({
    required this.maximum,
    required this.minimum,
  });

  /// JSON 맵에서 [DatesDto]를 생성합니다.
  factory DatesDto.fromJson(Map<String, dynamic> json) {
    return DatesDto(
      maximum: json['maximum'] as String? ?? '',
      minimum: json['minimum'] as String? ?? '',
    );
  }

  /// [DatesDto]를 JSON 맵으로 변환합니다.
  Map<String, dynamic> toJson() {
    return {
      'maximum': maximum,
      'minimum': minimum,
    };
  }
}
