import 'package:bloc/bloc.dart';
import 'package:counter/bloc/switch/switch_event.dart';
import 'package:counter/bloc/switch/switch_state.dart';

class SwitchBloc extends Bloc<SwitchEvents,SwitchState>{
  SwitchBloc():super(SwitchState()){
    on<EnableOrDisableNotification>(_enableOrDisableNotification);
  }

  void _enableOrDisableNotification(SwitchEvents events,Emitter<SwitchState> emit){
    emit(state.copyWith(isSwitch: !state.isSwitch));
  }
}