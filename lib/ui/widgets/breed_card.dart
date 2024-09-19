import 'package:flutter/material.dart';
import '../../domain/entities/breed.dart';

class BreedCard extends StatelessWidget {
  final Breed breed; // Asegurarse de que sea la entidad Breed

  const BreedCard({required this.breed});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          breed.imageUrl.isNotEmpty
              ? ClipRRect(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
                  child: Image.network(
                    breed.imageUrl,
                    height: 200,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                )
              : Container(
                  height: 200,
                  width: double.infinity,
                  color: Colors.grey[300],
                  child: Icon(Icons.pets, size: 100, color: Colors.grey[700]),
                ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      breed.name,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pushNamed(
                          '/detail',
                          arguments:
                              breed, // Pasar el objeto de la raza seleccionada
                        );
                      },
                      child: Text('Más...'),
                    ),
                  ],
                ),
                SizedBox(height: 5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('País: ${breed.origin}'),
                    Text('Inteligencia: ${breed.intelligence}'),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
