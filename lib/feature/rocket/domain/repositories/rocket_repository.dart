import '../../data/models/rocket_model.dart';

abstract interface class RocketRepository {
  Future<List<RocketModel>> getRockets();
}
