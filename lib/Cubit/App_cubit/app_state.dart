abstract class AppState {}

class IntialAppState extends AppState {}
class WebViewLoadingAppState extends AppState {}
class WebViewLoadedAppState extends AppState {}
class WebViewErrorAppState extends AppState {
  final String errMessage;

  WebViewErrorAppState(this.errMessage);
}
class ChangeBottomNavAppState extends AppState {}
class ChangePageViewAppState extends AppState {}
class AppChangeModeStates extends AppState {}
