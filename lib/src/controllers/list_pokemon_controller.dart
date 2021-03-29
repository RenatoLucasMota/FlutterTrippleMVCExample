import 'package:flutter_triple/flutter_triple.dart';
import 'package:mvc_example/src/models/pokemon.dart';
import 'package:mvc_example/src/repositories/pokemon_repository.dart';

abstract class IListPokemonController
    implements NotifierStore<Exception, List<Pokemon>> {
  Future<void> fetchPokemons();
}

class ListPokemonController extends NotifierStore<Exception, List<Pokemon>>
    implements IListPokemonController {
  final IPokemonRepository repository;

  ListPokemonController(this.repository) : super(<Pokemon>[]);

  @override
  Future<void> fetchPokemons() async {
    await execute(() async {
      var pokemons = await repository.getAllPokemons();
      return pokemons.results;
    });
  }

  
}
