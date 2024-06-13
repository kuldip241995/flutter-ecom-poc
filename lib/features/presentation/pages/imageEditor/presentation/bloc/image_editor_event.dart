part of 'image_editor_bloc.dart';

sealed class ImageEditorEvent extends Equatable {
  const ImageEditorEvent();

  @override
  List<Object> get props => [];
}

class ImagePickEvent extends ImageEditorEvent {
  const ImagePickEvent();

  @override
  List<Object> get props => [];
}

class ImageCaptureEvent extends ImageEditorEvent {
  const ImageCaptureEvent();

  @override
  List<Object> get props => [];
}

class ImageEditingEvent extends ImageEditorEvent {
  final Uint8List imageData;

  const ImageEditingEvent(this.imageData);

  @override
  List<Object> get props => [imageData];
}
