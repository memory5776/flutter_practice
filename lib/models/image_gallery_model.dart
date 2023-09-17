import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

import '../hive/boxes.dart';

part 'image_gallery_model.g.dart';

@JsonSerializable()
@HiveType(typeId: 1)
class ImageGalleryModel extends HiveObject {
  @JsonKey(name: 'albumId')
  @HiveField(0)
  final int albumId;
  @JsonKey(name: 'id')
  @HiveField(1)
  final int id;
  @JsonKey(name: 'title')
  @HiveField(2)
  final String title;
  @JsonKey(name: 'url')
  @HiveField(3)
  final String url;
  @JsonKey(name: 'thumbnailUrl')
  @HiveField(4)
  final String thumbnailUrl;

  ImageGalleryModel(this.albumId, this.id, this.title, this.url, this.thumbnailUrl);

  factory ImageGalleryModel.fromJson(Map<String, dynamic> json) => _$ImageGalleryModelFromJson(json);
  Map<String, dynamic> toJson() => _$ImageGalleryModelToJson(this);
}

Future<void> updateImageGalleryToHiveData(List<ImageGalleryModel> models) async {
  var data = { for (var e in models) e.id : e };
  var box = Boxes.getImageGalleryModel();
  box.clear();
  box.putAll(data);
}

Future<Iterable<ImageGalleryModel>?> getImageGalleryFromHiveData() async {
  var box = Boxes.getImageGalleryModel();
  return box.values;
}