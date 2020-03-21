import 'package:redux/redux.dart';
import 'package:uni_x/redux/app_reducer.dart';
import 'package:uni_x/redux/app_state.dart';

Store<AppState> appStore =
    Store<AppState>(appReducer, initialState: AppState.initialState());
