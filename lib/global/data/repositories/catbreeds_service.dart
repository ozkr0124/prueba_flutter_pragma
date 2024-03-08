import 'package:http/http.dart' as http;
import 'package:prueba_flutter_pragma/global/data/models/models.dart';
import 'package:prueba_flutter_pragma/global/domain/repositories/repositories.dart';

class CatbreedsService implements CatbreedsInterface{

  String get apiRequest => const String.fromEnvironment('API_REQUEST');

  @override
  Future<List<CatbreedsModel>> getCatbreeds() async {
    try {
      final url = Uri.https('api.thecatapi.com', 'v1/breeds', {
        "limit": "20"
      });
      final resp = await http.get(
        url,
        headers: {
          "x-api-key": apiRequest,
          "Content-Type": "application/json"
        }
      );
      var data = catbreedsModelFromJson(resp.body);
      return data;
    } catch (e) {
      rethrow; 
    }
  }

  @override
  Future<List<CatbreedsModel>> getCatbreedsImage(List<CatbreedsModel> catbreeds) async {
    try {
      List<CatbreedsModel> catbreedsNew = [];
      for (var cat in catbreeds) {
        String urlImage = "no_image";
        if (cat.referenceImageId != null) {
          final url = Uri.https('api.thecatapi.com', 'v1/images/${cat.referenceImageId}');
          final resp = await http.get(
            url,
            headers: {
              "x-api-key": apiRequest,
              "Content-Type": "application/json"
            }
          );
          final data = catbreedsImageModelFromJson(resp.body);
          urlImage = data.url ?? "no_image";
        }
        cat.urlReferenceImage = urlImage;
        catbreedsNew.add(cat);
      }
      return catbreedsNew;
    } catch (e) {
      rethrow; 
    }
  }
}