class GetLevelsResponse {
  bool isSuccess;
  int status;
  List<Level> levels;

  GetLevelsResponse({
    required this.isSuccess,
    required this.status,
    required this.levels,
  });

  factory GetLevelsResponse.fromJson(Map<String, dynamic> json) {
    return GetLevelsResponse(
      isSuccess: json['IsSuccess'],
      status: json['Status'],
      levels: (json['levels'] as List)
          .map((level) => Level.fromJson(level))
          .toList(),
    );
  }
}

class Level {
  String id;
  String levelName;

  Level({
    required this.id,
    required this.levelName,
  });

  factory Level.fromJson(Map<String, dynamic> json) {
    return Level(
      id: json['id'],
      levelName: json['level_name'],
    );
  }
}
