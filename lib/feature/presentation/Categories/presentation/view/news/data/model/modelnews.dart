class NewsModel {
  bool? isSuccess;
  int? status;
  List<Categories>? categories;

  NewsModel({this.isSuccess, this.status, this.categories});

  NewsModel.fromJson(Map<String, dynamic> json) {
    isSuccess = json["IsSuccess"] ?? false;
    status = json["Status"] ?? 0;
    categories = json["categories"] == null
        ? null
        : (json["categories"] as List).map((e) => Categories.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["IsSuccess"] = isSuccess??"";
    _data["Status"] = status??"";
    if (categories != null) {
      _data["categories"] = categories?.map((e) => e.toJson()).toList();
    }
    return _data;
  }
}

class Categories {
  int? categoryId;
  String? name;
  String? photo;
  String? createdAt;
  String? updatedAt;
  List<News1>? news;

  Categories({this.categoryId, this.name, this.photo, this.createdAt, this.updatedAt, this.news});

  Categories.fromJson(Map<String, dynamic> json) {
    categoryId ??= 0;
    name ??= "";
    photo ??= "";
    createdAt ??= "";
    updatedAt ??= "";
    news = json["news"] == null ? null : (json["news"] as List).map((e) => News1.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["category_id"] = categoryId??0;
    _data["name"] = name??"";
    _data["photo"] = photo??"";
    _data["created_at"] = createdAt??"";
    _data["updated_at"] = updatedAt??"";
    if (news != null) {
      _data["news"] = news?.map((e) => e.toJson()).toList();
    }
    return _data;
  }
}

class News1 {
  String? title;
  String? content;
  List<Photos>? photos;
  String? createdAt;
  String? updatedAt;

  News1({this.title, this.content, this.photos, this.createdAt, this.updatedAt});

  News1.fromJson(Map<String, dynamic> json) {
    title ??= "";
    content ??= "";
    photos = json["photos"] == null ? null : (json["photos"] as List).map((e) => Photos.fromJson(e)).toList();
    createdAt ??= "";
    updatedAt ??= "";
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["title"] = title;
    _data["content"] = content;
    if (photos != null) {
      _data["photos"] = photos?.map((e) => e.toJson()).toList();
    }
    _data["created_at"] = createdAt;
    _data["updated_at"] = updatedAt;
    return _data;
  }
}

class Photos {
  String? name;

  Photos({this.name});

  Photos.fromJson(Map<String, dynamic> json) {
    name ??= "";
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["name"] = name;
    return _data;
  }
}