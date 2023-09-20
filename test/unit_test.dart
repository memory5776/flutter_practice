import 'package:mockito/mockito.dart';
import 'package:practice_loading_images/models/image_gallery_model.dart';
import 'package:practice_loading_images/services/api_response.dart';
import 'package:practice_loading_images/services/image_repository.dart';
import 'package:test/test.dart';

class MockImageRepository extends Mock implements ImageRepository {}

Future<void> main() async {
  group('getPhotos', () {
    test('return APIResponse is successful',
            () async {
          var result = await ImageRepository().getPhotos();
          expect(result, isA<APIResponse>());
    });
  });

  group('getPhotosMock', () {
    test('return APIResponse is successful', () async {
      final repository = MockImageRepository();

      when(repository.getPhotos()).thenAnswer((_) async =>
          APIResponse(statusCode: 200, value: [
            ImageGalleryModel(1, 1, 'title', 'url', 'thumbnailUrl').toJson()
          ]));

      expect(await repository.getPhotos(), isA<APIResponse>());

    });

  });
}
