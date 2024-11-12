// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../../data/repository_imp/loginandregister_repo_imple.dart' as _i625;
import '../../presentation/provider/loginregisterprovider/loginandregisterprovider.dart'
    as _i945;
import '../repositories/loginand_register_repo.dart' as _i982;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.lazySingleton<_i982.LoginandRegisterRepo>(
        () => _i625.LoginandregisterRepoImple());
    gh.factory<_i945.Loginandregisterprovider>(() =>
        _i945.Loginandregisterprovider(
            loginandRegisterRepo: gh<_i982.LoginandRegisterRepo>()));
    return this;
  }
}
