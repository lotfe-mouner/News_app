import 'package:app/network/cache_helper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'app_states.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(Initial());

  static AppCubit get(context) => BlocProvider.of(context);

  bool isDark = false;

  void changeThemeMode({bool? isShared}) {
    if(isShared != null){
      isDark = isShared;
      emit(AppChangeThemeMode());
    }else{
      isDark = !isDark;
      CacheHelper.putBoolean(key: 'isDark', value: isDark);
      emit(AppChangeThemeMode());
    }

  }
}
