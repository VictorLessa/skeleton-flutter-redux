import 'package:uni_x/redux/app_state.dart';
import 'package:uni_x/redux/app_actions.dart';

AppState appReducer(AppState state, dynamic action) {
  if (action['type'] is SaveUser) {
    return state.copyWith(details: action['data']);
  }
  return state;
}
