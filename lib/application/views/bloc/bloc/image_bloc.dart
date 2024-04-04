import 'package:bloc/bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meta/meta.dart';

part 'image_event.dart';
part 'image_state.dart';

class ImageBloc extends Bloc<ImageEvent, ImageState> {
  ImageBloc() : super(ImageState()) {
    on<OnSelectedImageEvent>((_onselectImages));
    on<OnUnselectImageEvent>((_onUnselectedImages));
  }
  Future<void> _onselectImages(
      OnSelectedImageEvent event, Emitter<ImageState> emit) async {
    emit(state.copywith(images: event.images));
  }

  Future<void> _onUnselectedImages(
      OnUnselectImageEvent event, Emitter<ImageState> emit) async {
    emit(state.copywith(images: []));
  }
}
