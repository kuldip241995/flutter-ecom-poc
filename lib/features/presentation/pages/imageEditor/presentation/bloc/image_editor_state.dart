part of 'image_editor_bloc.dart';

sealed class ImageEditorState extends Equatable {
  const ImageEditorState();

  @override
  List<Object> get props => [];
}

final class ImageEditorInitial extends ImageEditorState {}

final class ImageCaptureSuccessState extends ImageEditorState {
  final File file;
  const ImageCaptureSuccessState(this.file);

  @override
  List<Object> get props => [file];
}

final class ImagePickSuccessState extends ImageEditorState {
  final File file;
  const ImagePickSuccessState(this.file);

  @override
  List<Object> get props => [file];
}

final class ImageEditingSuccess extends ImageEditorState {
  final Uint8List imageData;
  const ImageEditingSuccess(this.imageData);

  @override
  List<Object> get props => [imageData];
}
