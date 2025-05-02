part of 'home_bloc.dart';

abstract class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

class HomeLoading extends HomeState {}

class HomeError extends HomeState {
  final AppExecption execption;
  const HomeError({required this.execption});

  @override
  List<Object> get props => [execption];
}

class HomeSuccess extends HomeState {
  final List<BannerEntity> banners;
  final List<ProductEntity> latestProducts;
  final List<ProductEntity> popularProducts;
  const HomeSuccess({
    required this.banners,
    required this.latestProducts,
    required this.popularProducts,
  });
}
