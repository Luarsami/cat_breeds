import '../../domain/entities/breed.dart';
import '../../domain/repositories/breed_repository.dart';
import '../datasources/breed_remote_datasource.dart';
import '../models/breed_model.dart';

class BreedRepositoryImpl implements BreedRepository {
  final BreedRemoteDataSource remoteDataSource = BreedRemoteDataSource();

  @override
  Future<List<Breed>> getBreeds() async {
    final List<BreedModel> breedModels = await remoteDataSource.getBreeds();
    // Convertir BreedModel a Breed (entidad de dominio)
    return breedModels
        .map((breedModel) => Breed(
              id: breedModel.id,
              name: breedModel.name,
              description: breedModel.description,
              origin: breedModel.origin,
              intelligence: breedModel.intelligence,
              imageUrl: breedModel.imageUrl,
              wikipediaUrl: breedModel.wikipediaUrl,
              lifeSpan: breedModel.lifeSpan,
              countryCodes: breedModel.countryCodes,
              countryCode: breedModel.countryCode,
              temperament: breedModel.temperament,
            ))
        .toList();
  }
}
