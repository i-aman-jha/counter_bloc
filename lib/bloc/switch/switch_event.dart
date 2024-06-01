import 'package:equatable/equatable.dart';

abstract class SwitchEvents {
  SwitchEvents();
  @override
  List<Object> get Props => [];
}
class EnableOrDisableNotification extends SwitchEvents{}
