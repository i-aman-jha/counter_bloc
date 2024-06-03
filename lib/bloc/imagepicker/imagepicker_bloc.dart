import 'package:bloc/bloc.dart';
import 'package:counter/bloc/imagepicker/imagepicker_event.dart';
import 'package:counter/bloc/imagepicker/imagepicker_state.dart';
import 'package:counter/utils/imagepicker_utils.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerBloc extends Bloc<ImagePickerEvent,ImagePickerStates>{
  final ImagePickerUtils imagePickerUtils;

  ImagePickerBloc(this.imagePickerUtils):super(const ImagePickerStates()){
    on<CameraCapture>(_cameraCapture);
    on<GalleryPicker>(_galleryCapture);
  }

  Future<void> _cameraCapture(ImagePickerEvent events,Emitter<ImagePickerStates> emit) async {
    XFile? file=await imagePickerUtils.cameraCapture();
    emit(state.copyWith(file:file));
  }

  Future<void> _galleryCapture(ImagePickerEvent events,Emitter<ImagePickerStates> emit) async {
    XFile? file=await imagePickerUtils.galleryCapture();
    emit(state.copyWith(file:file));
  }
}