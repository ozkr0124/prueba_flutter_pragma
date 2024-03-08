import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:prueba_flutter_pragma/global/data/models/models.dart';
import 'package:prueba_flutter_pragma/global/data/repositories/repositories.dart';

part 'catbreeds_state.dart';

class CatbreedsCubit extends Cubit<CatbreedsState> {

  late List<CatbreedsModel> _catbreedsGlobal;

  CatbreedsCubit() : super(CatbreedsInitial()) {
    getCatbreeds();
  }

  List<CatbreedsModel> get catbreedsGlobal => _catbreedsGlobal;
  set catbreedsGlobal(List<CatbreedsModel> data) {
    _catbreedsGlobal = data;
  }

  Future<void> getCatbreeds() async {
    try {

      emit(CatbreedsLoading());

      CatbreedsService services = CatbreedsService();

      List<CatbreedsModel> catbreeds = await services.getCatbreeds();

      final result = await services.getCatbreedsImage(catbreeds);

      catbreedsGlobal = result;

      emit(CatbreedsLoaded(data: result));

    } catch (e) {
      log(e.toString());
      emit(CatbreedsError(message: "Error load data"));
    }
  }

  Future<List<CatbreedsModel>> getSearchCat({String query = ''}) async {
    try {
      List<CatbreedsModel> filterCat = [];
      filterCat = catbreedsGlobal.where((element) {
        return element.name!.toLowerCase().contains(query.toLowerCase());
      }).toList();
      return filterCat;
    } catch (e) {
      return [];
    }
  }
}
