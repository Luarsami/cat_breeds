import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import '../domain/entities/breed.dart';
import '../domain/usecases/get_breeds.dart';

abstract class BreedEvent extends Equatable {
  const BreedEvent();
}

class LoadBreedsEvent extends BreedEvent {
  @override
  List<Object> get props => [];
}

abstract class BreedState extends Equatable {
  const BreedState();
}

class BreedsLoadingState extends BreedState {
  @override
  List<Object> get props => [];
}

class BreedsLoadedState extends BreedState {
  final List<Breed> breeds; // Asegúrate de que sea de tipo Breed

  BreedsLoadedState(this.breeds);

  @override
  List<Object> get props => [breeds];
}

class BreedsErrorState extends BreedState {
  final String error;

  BreedsErrorState(this.error);

  @override
  List<Object> get props => [error];
}

class BreedBloc extends Bloc<BreedEvent, BreedState> {
  final GetBreeds getBreeds;

  // Constructor recibe el caso de uso GetBreeds
  BreedBloc({required this.getBreeds}) : super(BreedsLoadingState()) {
    on<LoadBreedsEvent>((event, emit) async {
      emit(BreedsLoadingState());

      try {
        // Ejecuta el caso de uso para obtener las razas
        final List<Breed> breeds =
            await getBreeds(); // Trabajar con entidad Breed
        emit(BreedsLoadedState(breeds));
      } catch (e) {
        emit(BreedsErrorState(e.toString()));
      }
    });
  }
}
