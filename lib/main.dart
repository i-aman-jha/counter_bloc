import 'package:counter/bloc/counter/counter_bloc.dart';
import 'package:counter/bloc/imagepicker/imagepicker_bloc.dart';
import 'package:counter/ui/counter.dart';
import 'package:counter/ui/image_picker.dart';
import 'package:counter/ui/switchexample.dart';
import 'package:counter/utils/imagepicker_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/switch/switch_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => CounterBloc(),
        ),
        BlocProvider(
          create: (context) => SwitchBloc(),
        ),
        BlocProvider(
          create: (context) => ImagePickerBloc(ImagePickerUtils()),
        ),
      ],
      child: MaterialApp(
        title: 'Bloc Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        // home: const counter(),
        // home: const SwitchExampleBloc(),
        home: const ImagePicker(),
      ),
    );
  }
}
