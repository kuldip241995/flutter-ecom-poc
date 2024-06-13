import 'dart:io';
import 'dart:typed_data';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:image_picker/image_picker.dart';

part 'image_editor_event.dart';
part 'image_editor_state.dart';

class ImageEditorBloc extends Bloc<ImageEditorEvent, ImageEditorState> {
  final picker = ImagePicker();

  ImageEditorBloc() : super(ImageEditorInitial()) {
    on<ImageCaptureEvent>((event, emit) async {
      final pickedFile = await picker.pickImage(source: ImageSource.camera);
      if (pickedFile != null) {
        emit(ImageCaptureSuccessState(File(pickedFile.path)));
      }
    });
    on<ImagePickEvent>((event, emit) async {
      final pickedFile = await picker.pickImage(source: ImageSource.gallery);
      if (pickedFile != null) {
        emit(ImagePickSuccessState(File(pickedFile.path)));
      }
    });
    on<ImageEditingEvent>((event, emit) {
      emit(ImageEditingSuccess(event.imageData));
    });
  }
}
