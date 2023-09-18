import 'package:flutter_test/flutter_test.dart';
import 'package:practice_loading_images/bloc/image_gallery_bloc.dart';

void main() {
  late ImageGalleryBloc imageGalleryBloc;

  setUp(() {
    imageGalleryBloc = ImageGalleryBloc();
  });

  test('init state is correct', () {
    expect(imageGalleryBloc.state, isA<ImageGalleryInitial>());
  });

}
