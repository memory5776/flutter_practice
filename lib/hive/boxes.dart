import 'package:hive_flutter/hive_flutter.dart';

import '../models/image_gallery_model.dart';

class Boxes {
  static Box<ImageGalleryModel> getImageGalleryModel() =>
      Hive.box<ImageGalleryModel>('ImageGalleryModel');
}