import '../../domain/repositories/rocket_repository.dart';
import '../data_sources/rocket_remote_datasource.dart';
import '../models/rocket_model.dart';

class RocketRepositoryImpl implements RocketRepository {
  RocketRepositoryImpl();

  @override
  Future<List<RocketModel>> getRockets() async {
    try {
      return await RocketRemoteDataSource().getRockets();
    } catch (e) {
      rethrow;
    }
  }
}
