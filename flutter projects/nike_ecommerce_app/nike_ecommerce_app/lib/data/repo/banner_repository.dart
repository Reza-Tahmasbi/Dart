import 'package:nike_ecommerce_app/common/http_client.dart';
import 'package:nike_ecommerce_app/data/banner.dart';
import 'package:nike_ecommerce_app/data/source/banner_data_source.dart';

final bannerRepository = BannerRepository(BannerRemoteDataSource(httpClient));

abstract class IBannerRepository{
  Future<List<BannerEntity>> getAll();
}

class BannerRepository implements IBannerRepository {
  final IBannerDataSource dataSource;

  BannerRepository(this.dataSource);
  
  @override
  Future<List<BannerEntity>> getAll() => dataSource.getAll();
}