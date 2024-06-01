import 'package:counter/bloc/switch/switch_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/switch/switch_bloc.dart';
import '../bloc/switch/switch_state.dart';

class SwitchExampleBloc extends StatefulWidget {
  const SwitchExampleBloc({super.key});

  @override
  State<SwitchExampleBloc> createState() => _SwitchExampleBlocState();
}

class _SwitchExampleBlocState extends State<SwitchExampleBloc> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const Text("Switch"),
              BlocBuilder<SwitchBloc, SwitchState>(
                builder: (context, state) {
                  return Switch(
                      value: state.isSwitch,
                      onChanged: (value) {
                        context.read<SwitchBloc>().add(EnableOrDisableNotification());
                      });
                },
              )
            ],
          )
        ],
      ),
    );
  }
}
