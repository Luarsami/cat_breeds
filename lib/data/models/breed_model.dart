class BreedModel {
  final String id;
  final String name;
  final String description;
  final String imageUrl;
  final String origin;
  final int intelligence;
  final String temperament;
  final String countryCodes;
  final String countryCode;
  final String lifeSpan;
  final String wikipediaUrl;

  BreedModel(
      {required this.id,
      required this.name,
      required this.description,
      required this.imageUrl,
      required this.origin,
      required this.intelligence,
      required this.wikipediaUrl,
      required this.lifeSpan,
      required this.countryCodes,
      required this.countryCode,
      required this.temperament});

  factory BreedModel.fromJson(Map<String, dynamic> json) {
    return BreedModel(
        id: json['id'],
        name: json['name'],
        description: json['description'],
        imageUrl: json['image'] != null ? json['image']['url'] : '',
        origin: json['origin'] ?? 'Desconocido',
        intelligence: json['intelligence'] ?? 0,
        wikipediaUrl: json['wikipedia_url'] ?? 'Desconocido',
        lifeSpan: json['life_span'] ?? 'Desconocido',
        countryCode: json['country_code'] ?? 'Desconocido',
        countryCodes: json['country_codes'] ?? 'Desconocido',
        temperament: json['temperament'] ?? 'Desconocido');
  }
}
