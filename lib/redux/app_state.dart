import 'package:meta/meta.dart';

class AppState {
  final Map details;

  AppState({@required this.details});

  factory AppState.initialState() {
    return AppState(details: {});
  }

  AppState copyWith({Map details}) {
    return AppState(details: details ?? this.details);
  }
}
