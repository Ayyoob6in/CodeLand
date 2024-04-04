part of 'image_bloc.dart';

@immutable
sealed class ImageEvent {}

class OnSelectedImageEvent extends ImageEvent {
  final List<XFile> images;

  OnSelectedImageEvent(this.images);
}

class OnUnselectImageEvent extends ImageEvent {}
