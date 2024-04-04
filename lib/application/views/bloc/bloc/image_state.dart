part of 'image_bloc.dart';

@immutable
class ImageState {
  final List<XFile>? images;
  ImageState({this.images});
  ImageState copywith({List<XFile>? images}) =>
      ImageState(images: images ?? this.images);
}
