import 'package:dio/dio.dart';
import 'package:mvc_example/src/models/pokemon.dart';

abstract class IPokemonRepository {
  Future<Pokemons> getAllPokemons();
}

class PokemonRepository implements IPokemonRepository {
  final Dio dio;

  PokemonRepository(this.dio);

  Future<Pokemons> getAllPokemons() async {
    /*throw Exception('Simulação de erro');*/
    var response = await dio.get('pokemon/?offset=0&limit=150');
    return Pokemons.fromJson(response.data);
  }
}
