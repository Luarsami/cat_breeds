import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/breed_model.dart';

class BreedRemoteDataSource {
  final String apiKey =
      'live_99Qe4Ppj34NdplyLW67xCV7Ds0oSLKGgcWWYnSzMJY9C0QOu0HUR4azYxWkyW2nr';

  Future<List<BreedModel>> getBreeds() async {
    final response = await http.get(
      Uri.parse('https://api.thecatapi.com/v1/breeds'),
      headers: {'x-api-key': apiKey},
    );

    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      return data.map((json) => BreedModel.fromJson(json)).toList();
    } else {
      throw Exception('Error al cargar las razas');
    }
  }
}
