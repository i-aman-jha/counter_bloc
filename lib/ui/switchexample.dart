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
                buildWhen: (previous, current) =>
                    previous.isSwitch != current.isSwitch,
                builder: (context, state) {
                  return Switch(
                      value: state.isSwitch,
                      onChanged: (value) {
                        context
                            .read<SwitchBloc>()
                            .add(EnableOrDisableNotification());
                      });
                },
              )
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          BlocBuilder<SwitchBloc, SwitchState>(
            builder: (context, state) {
              return Container(
                height: 200,
                color: Colors.red.withOpacity(state.slider),
              );
            },
          ),
          const SizedBox(
            height: 15,
          ),
          BlocBuilder<SwitchBloc, SwitchState>(
            buildWhen: (previous, current) => previous.slider != current.slider,
            builder: (context, state) {
              return Slider(
                  value: state.slider,
                  onChanged: (value) {
                    print(value);
                    context.read<SwitchBloc>().add(SliderEvent(slider: value));
                  });
            },
          )
        ],
      ),
    );
  }
}
