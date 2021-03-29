import 'package:flutter/material.dart';
import 'package:flutter_triple/flutter_triple.dart';
import 'package:mvc_example/src/controllers/list_pokemon_controller.dart';
import 'package:mvc_example/src/models/pokemon.dart';

class HomePage extends StatefulWidget {
  final IListPokemonController controller;

  const HomePage(this.controller, {Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Disposer disposer;
  @override
  void initState() {
    widget.controller.fetchPokemons();
    disposer = widget.controller.observer(
      onError: (error) => _showSnack(error.toString()),
      onLoading: (loading) => print(loading? 'Carregando' : 'Carregamento finalizado'),
      onState: (state) => print(state.isEmpty ? 'Lista vazia' : 'Lista carregada'),
    );
    super.initState();
  }

  _showSnack(String text) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(text),
    ));
  }

  @override
  void dispose() {
    disposer();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pokedex - MVC Example'),
      ),
      body: ScopedBuilder<IListPokemonController, Exception, List<Pokemon>>(
        store: widget.controller,
        onLoading: (context) => Center(
          child: CircularProgressIndicator(),
        ),
        onState: (context, state) => ListView.builder(
            itemCount: state.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(state[index].name),
              );
            }),
        onError: (context, error) {
          return Center(
            child: Text(error.toString()),
          );
        },
      ),
    );
  }
}
