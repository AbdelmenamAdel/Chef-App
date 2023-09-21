import 'package:chef/core/database/cache/cache_helper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../services/service_locator.dart';
import 'global_state.dart';

class GlobalCubit extends Cubit<GlobalState> {
  GlobalCubit() : super(GlobalInitial());
  String langCode = 'en';

  //! get lang and set it in sharedPrefrances
  void getLang(String code) {
    emit(ChangeLangLoading());
    langCode = code;
    sl<CacheHelper>().changLanguage(code);
    emit(ChangeLangSuccess());
  }

  //! update langauge and use it while starting app
  void updateLangage() {
    emit(ChangeLangLoading());
    final cachedLang = sl<CacheHelper>().getCachedLanguage();
    langCode = cachedLang;
    emit(ChangeLangSuccess());
  }
}
