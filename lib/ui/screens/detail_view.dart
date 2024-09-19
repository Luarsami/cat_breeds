import 'package:flutter/material.dart';
import '../../domain/entities/breed.dart'; // Asegúrate de importar Breed

class DetailView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Obtener el objeto `Breed` pasado como argumento
    final Breed breed = ModalRoute.of(context)!.settings.arguments as Breed;

    return Scaffold(
      appBar: AppBar(
        title: Text(breed.name),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Imagen del gato
          breed.imageUrl.isNotEmpty
              ? Image.network(
                  breed.imageUrl,
                  height: 300,
                  width: double.infinity,
                  fit: BoxFit.cover,
                )
              : Container(
                  height: 300,
                  width: double.infinity,
                  color: Colors.grey[300],
                  child: Icon(Icons.pets, size: 100, color: Colors.grey[700]),
                ),
          // Información scrolleable debajo de la imagen
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.all(15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Descripción',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  Text(breed.description),
                  SizedBox(height: 20),
                  Text('Origen: ${breed.origin}'),
                  SizedBox(height: 10),
                  Text('Inteligencia: ${breed.intelligence}'),
                  SizedBox(height: 10),
                  Text('Temperamento: ${breed.temperament}'),
                  SizedBox(height: 10),
                  Text('Códigos de país: ${breed.countryCodes}'),
                  SizedBox(height: 10),
                  Text('Código de país: ${breed.countryCode}'),
                  SizedBox(height: 10),
                  Text('Esperanza de vida: ${breed.lifeSpan}'),
                  SizedBox(height: 10),
                  Text('Wikipedia: ${breed.wikipediaUrl}'),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
