import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:novus_logic/feature/rocket/presentation/widgets/get_multiple_imags.dart';

import 'bloc/rocket_data_bloc.dart';

class RocketDataScreen extends StatefulWidget {
  const RocketDataScreen({super.key});

  @override
  State<RocketDataScreen> createState() => _RocketDataScreenState();
}

class _RocketDataScreenState extends State<RocketDataScreen> {
  @override
  void initState() {
    // TODO: implement initState
    context.read<RocketDataBloc>().add(const GetRockets());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Rocket Data'),
      ),
      body: BlocConsumer<RocketDataBloc, RocketDataState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          if (state is RocketDataLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is RocketDataError) {
            return Scaffold(
              body: Center(
                child: Text(state.message),
              ),
            );
          }
          if (state is RocketDataLoaded) {
            return ListView.builder(
              itemCount: state.rockets.length,
              itemBuilder: (context, index) {
                final rocket = state.rockets[index];
                return Card(
                  elevation: 5,
                  margin: const EdgeInsets.all(10),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        if (rocket.flickrImages.isNotEmpty)
                          GetMultipleImages(imageFilesUrl: rocket.flickrImages),
                        ListTile(
                          title: Text(rocket.name),
                          subtitle: Text(rocket.country),
                          trailing: Text(
                            rocket.engineCount,
                            style: const TextStyle(fontSize: 30),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          }
          return const Center(
            child: Text('Rocket Data Screen'),
          );
        },
      ),
    );
  }
}
