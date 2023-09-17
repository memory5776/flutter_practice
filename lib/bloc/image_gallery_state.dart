part of 'image_gallery_bloc.dart';

@immutable
abstract class ImageGalleryState {}

class ImageGalleryInitial extends ImageGalleryState {}

class LoadingState extends ImageGalleryState {}

class DataFromServiceState extends ImageGalleryState {
  final List<ImageGalleryModel> model;

  DataFromServiceState({required this.model});
}

class DataFromLocalState extends ImageGalleryState {
  final List<ImageGalleryModel> model;

  DataFromLocalState({required this.model});
}

class LoadedFailed extends ImageGalleryState {}