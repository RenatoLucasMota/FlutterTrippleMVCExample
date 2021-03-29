import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:mvc_example/src/controllers/list_pokemon_controller.dart';
import 'package:mvc_example/src/repositories/pokemon_repository.dart';

import 'dio_client.dart';

final locator = GetIt.instance;

class Injection {
  Injection.init() {
    i.registerLazySingleton<Dio>(() => DioClient.init());
    i.registerLazySingleton<IPokemonRepository>(
        () => PokemonRepository(i.get()));
    i.registerLazySingleton<IListPokemonController>(
        () => ListPokemonController(i.get()));
  }

  static GetIt get i => locator;
}
