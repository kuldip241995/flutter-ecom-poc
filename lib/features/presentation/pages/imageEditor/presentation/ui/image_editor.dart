import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_poc/core/constants/constants.dart';
import 'package:flutter_poc/core/constants/images.dart';
import 'package:flutter_poc/core/constants/paddingConstant.dart';
import 'package:flutter_poc/core/constants/string.dart';
import 'package:flutter_poc/features/presentation/pages/imageEditor/presentation/bloc/image_editor_bloc.dart';
import 'package:flutter_poc/features/presentation/widgets/custom_app_bar.dart';
import 'package:image_editor_plus/image_editor_plus.dart';

class ImageEditorScreen extends StatelessWidget {
  const ImageEditorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(headerTitle: Strings.imageEditorTitle),
      body: ListView(
        children: [
          Container(
              height: HeightConstants.IMAGE_EDITOR_CONTAINER_HEIGHT,
              margin: const EdgeInsets.all(PaddingConstants.MEDIUM_PADDING),
              padding: const EdgeInsets.all(PaddingConstants.MEDIUM_PADDING),
              decoration: kImageEditorContainerBoxDecoration,
              child: BlocBuilder<ImageEditorBloc, ImageEditorState>(
                builder: (context, state) {
                  if (state is ImagePickSuccessState) {
                    return Image.file(state.file);
                  } else if (state is ImageCaptureSuccessState) {
                    return Image.file(state.file);
                  } else if (state is ImageEditingSuccess) {
                    return Image.memory(state.imageData);
                  } else {
                    return Image.asset(Images.noImageSelected,
                        fit: BoxFit.contain);
                  }
                },
              )),
          const SizedBox(height: PaddingConstants.MEDIUM_PADDING),
          SizedBox(
            width: MediaQuery.of(context).size.width / 2,
            child: Column(children: [
              BlocBuilder<ImageEditorBloc, ImageEditorState>(
                builder: (context, state) {
                  return ElevatedButton(
                    child: const Text(Strings.imageEditorTitle),
                    onPressed: () async {
                      if (state is ImagePickSuccessState) {
                        var editedImage = await Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ImageEditor(
                              image: state.file,
                            ),
                          ),
                        );

                        BlocProvider.of<ImageEditorBloc>(context)
                            .add(ImageEditingEvent(editedImage));
                      }
                    },
                  );
                },
              ),
              ElevatedButton(
                child: const Text(Strings.galleryText),
                onPressed: () {
                  BlocProvider.of<ImageEditorBloc>(context)
                      .add(const ImagePickEvent());
                },
              ),
              ElevatedButton(
                child: const Text(Strings.cameraText),
                onPressed: () {
                  BlocProvider.of<ImageEditorBloc>(context)
                      .add(const ImageCaptureEvent());
                },
              ),
            ]),
          )
        ],
      ),
    );
  }
}
