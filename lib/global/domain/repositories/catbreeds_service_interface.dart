
import 'package:prueba_flutter_pragma/global/data/models/models.dart';

abstract class CatbreedsInterface {

  Future<List<CatbreedsModel>> getCatbreeds();
  Future<List<CatbreedsModel>> getCatbreedsImage(List<CatbreedsModel> catbreeds);
  
}