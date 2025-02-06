import 'package:freezed_annotation/freezed_annotation.dart';

part 'news.freezed.dart';
part 'news.g.dart';

@freezed
class NewsModel with _$NewsModel {
  const factory NewsModel({
    required final String author,
    required final String title,
    required final String date,
    required final String description,
    required final String image,
    required final String imageOther,
    required final String dayAgo,
  }) = _NewsModel;

  factory NewsModel.fromJson(Map<String, dynamic> json) =>
      _$NewsModelFromJson(json);
}
