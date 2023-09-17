

import 'package:dio/dio.dart';
import 'package:practice_loading_images/services/APIResponse.dart';

import '../models/image_gallery_model.dart';

class ImageRepository {
  static Future<APIResponse> getPhotos() async {

    var response = await Dio().get(
        "https://jsonplaceholder.typicode.com/photo",
        options: Options(
          responseType: ResponseType.json,
          validateStatus: (_) => true
        )
    );

    var value = response.statusCode == 200
        ? (response.data as List<dynamic>).map((e) =>
        ImageGalleryModel.fromJson(e)).toList()
        : null;

    return APIResponse(statusCode: response.statusCode, value: value);
  }
}