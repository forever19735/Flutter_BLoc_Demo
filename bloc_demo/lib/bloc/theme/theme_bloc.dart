import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc_demo/settings/app_themes.dart';
import 'theme_event.dart';
import 'theme_state.dart';


// class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
//   ThemeBloc(ThemeState initialState) : super(initialState);
//
//   @override
//   Stream<ThemeState> mapEventToState(ThemeEvent event) async* {
//     if (event is ThemeEvent) {
//       yield ThemeState(
//         themeData: AppThemes.appThemeData![event.appTheme],
//       );
//     }
//   }
// }
