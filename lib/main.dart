import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'blocs/breed_bloc.dart';
import 'data/repositories/breed_repository_impl.dart';
import 'domain/usecases/get_breeds.dart';
import 'ui/screens/landing_view.dart';
import 'ui/screens/detail_view.dart';
import 'ui/screens/splash_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Inicializar el repositorio y el caso de uso
    final breedRepository = BreedRepositoryImpl();
    final getBreedsUseCase = GetBreeds(breedRepository);

    return MaterialApp(
      title: 'Cat Breeds',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => SplashScreen(),
        '/landing': (context) => BlocProvider(
              create: (_) => BreedBloc(getBreeds: getBreedsUseCase)
                ..add(LoadBreedsEvent()),
              child: LandingView(),
            ),
        '/detail': (context) => DetailView(),
      },
    );
  }
}
