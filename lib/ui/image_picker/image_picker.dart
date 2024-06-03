import 'dart:io';

import 'package:counter/bloc/imagepicker/imagepicker_bloc.dart';
import 'package:counter/bloc/imagepicker/imagepicker_event.dart';
import 'package:counter/bloc/imagepicker/imagepicker_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ImagePicker extends StatefulWidget {
  const ImagePicker({super.key});

  @override
  State<ImagePicker> createState() => _ImagePickerState();
}

class _ImagePickerState extends State<ImagePicker> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Image Picker"),
      ),
      body: BlocBuilder<ImagePickerBloc, ImagePickerStates>(
          builder: (context, state) {
        if (state.file == null) {
          return Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InkWell(
                  onTap: () {
                    context.read<ImagePickerBloc>().add(CameraCapture());
                  },
                  child: const CircleAvatar(
                    child: Icon(Icons.camera),
                  ),
                ),
                InkWell(
                  onTap: () {
                    context.read<ImagePickerBloc>().add(GalleryPicker());
                  },
                  child: const CircleAvatar(
                    child: Icon(Icons.upload),
                  ),
                ),
              ],
            ),
          );
        } else {
          return Image.file(File(state.file!.path.toString()));
        }
      }),
    );
  }
}
