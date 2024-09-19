import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../blocs/breed_bloc.dart';
import '../widgets/breed_card.dart';

class LandingView extends StatefulWidget {
  @override
  _LandingViewState createState() => _LandingViewState();
}

class _LandingViewState extends State<LandingView> {
  String _searchQuery = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cat Breeds'),
      ),
      body: Column(
        children: [
          // Campo de búsqueda
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                labelText: 'Buscar raza de gato...',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.search),
              ),
              onChanged: (value) {
                setState(() {
                  _searchQuery = value.toLowerCase();
                });
              },
            ),
          ),
          // Lista de razas filtradas
          Expanded(
            child: BlocBuilder<BreedBloc, BreedState>(
              builder: (context, state) {
                if (state is BreedsLoadingState) {
                  return Center(child: CircularProgressIndicator());
                } else if (state is BreedsLoadedState) {
                  // Si no hay razas cargadas, muestra un mensaje adecuado
                  if (state.breeds.isEmpty) {
                    return Center(child: Text('No se encontraron razas.'));
                  }

                  // Filtra las razas según el valor de búsqueda
                  final filteredBreeds = state.breeds
                      .where((breed) =>
                          breed.name.toLowerCase().contains(_searchQuery))
                      .toList();

                  // Si no hay resultados después del filtro, muestra un mensaje
                  if (filteredBreeds.isEmpty) {
                    return Center(
                        child: Text('No se encontraron razas con ese nombre.'));
                  }

                  return ListView.builder(
                    itemCount: filteredBreeds.length,
                    itemBuilder: (context, index) {
                      return BreedCard(
                          breed: filteredBreeds[
                              index]); // Aquí estamos pasando la entidad Breed
                    },
                  );
                } else if (state is BreedsErrorState) {
                  return Center(child: Text('Error: ${state.error}'));
                } else {
                  return Container(); // Estado por defecto si no hay nada
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
