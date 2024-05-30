import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'feature/rocket/data/repositories/rocket_repository_impl.dart';
import 'feature/rocket/domain/repositories/rocket_repository.dart';
import 'feature/rocket/presentation/pages/bloc/rocket_data_bloc.dart';
import 'feature/rocket/presentation/pages/rocket_data_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return RepositoryProvider<RocketRepository>(
      create: (context) => RocketRepositoryImpl(),
      child: BlocProvider(
        create: (context) => RocketDataBloc(rocketRepository: context.read<RocketRepository>()),
        child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          home: const RocketDataScreen(),
        ),
      ),
    );
  }
}
