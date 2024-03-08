part of 'catbreeds_cubit.dart';

@immutable
abstract class CatbreedsState {}

class CatbreedsInitial extends CatbreedsState {}
class CatbreedsLoading extends CatbreedsState {}

class CatbreedsLoaded extends CatbreedsState {
  
  final List<CatbreedsModel> data;

  CatbreedsLoaded({
    required this.data
  });
}

class CatbreedsError extends CatbreedsState {
  final String message;

  CatbreedsError({
    required this.message
  });
}
