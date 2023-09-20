import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:practice_loading_images/models/image_gallery_model.dart';
import 'package:practice_loading_images/services/image_repository.dart';

part 'image_gallery_event.dart';
part 'image_gallery_state.dart';

class ImageGalleryBloc extends Bloc<ImageGalleryEvent, ImageGalleryState> {
  ImageGalleryBloc() : super(ImageGalleryInitial()) {

    on<LoadingEvent>((event, emit) async {
      emit(LoadingState());

      // Check local data.
      var localData = await getImageGalleryFromHiveData();
      if (localData != null) {
        emit(DataFromLocalState(model: localData.toList()));
      }

      // Get service data.
      var serviceData = await ImageRepository().getPhotos();
      if (serviceData?.value != null) {
        emit(DataFromServiceState(model: serviceData?.value));
        updateImageGalleryToHiveData(serviceData?.value);
      }
    });

  }
}
