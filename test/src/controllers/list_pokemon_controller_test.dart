import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:mvc_example/src/controllers/list_pokemon_controller.dart';
import 'package:mvc_example/src/models/pokemon.dart';
import 'package:mvc_example/src/repositories/pokemon_repository.dart';

class PokemonRepositorymMock extends Mock implements PokemonRepository {}

void main() {
  IListPokemonController controller;
  PokemonRepositorymMock pokemonRepositorymMock;

  setUp(() async {
    pokemonRepositorymMock = PokemonRepositorymMock();
    controller = ListPokemonController(pokemonRepositorymMock);
  });

  test(
    'Should test fetchPokemonsMethod succes',
    () async {
      when(pokemonRepositorymMock.getAllPokemons())
          .thenAnswer((realInvocation) => Future.value(pokemons));

      await controller.fetchPokemons();

      expect(controller.state.length, 3);
    },
  );

  test(
    'Should test fetchPokemonsMethod inLoading',
    () async {
      when(pokemonRepositorymMock.getAllPokemons()).thenAnswer(
          (realInvocation) =>
              Future.delayed(Duration(seconds: 3), () => pokemons));

      controller.fetchPokemons();

      await Future.delayed(Duration(seconds: 3));

      expect(controller.selectLoading.value, true);
    },
  );

  test(
    'Should test fetchPokemonsMethod on Error',
    () async {
      when(pokemonRepositorymMock.getAllPokemons())
          .thenThrow(Exception('Erro'));

      await controller.fetchPokemons();

      expect(controller.selectError.value, isA<Exception>());
    },
  );
}

var pokemons = Pokemons(
  count: 3,
  next: '',
  previous: '',
  results: [
    Pokemon(
      name: 'Bulbassaur',
      url: '',
    ),
    Pokemon(
      name: 'Charmander',
      url: '',
    ),
    Pokemon(
      name: 'Pikachu',
      url: '',
    ),
  ],
);
