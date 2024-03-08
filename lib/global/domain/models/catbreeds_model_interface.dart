import 'package:prueba_flutter_pragma/global/data/models/catbreeds_model.dart';

abstract class CatbreedsModelInterface {
    Weight? weight;
    String? id;
    String? name;
    String? cfaUrl;
    String? vetstreetUrl;
    String? vcahospitalsUrl;
    String? temperament;
    String? origin;
    String? countryCodes;
    String? countryCode;
    String? description;
    String? lifeSpan;
    int? indoor;
    int? lap;
    String? altNames;
    int? adaptability;
    int? affectionLevel;
    int? childFriendly;
    int? dogFriendly;
    int? energyLevel;
    int? grooming;
    int? healthIssues;
    int? intelligence;
    int? sheddingLevel;
    int? socialNeeds;
    int? strangerFriendly;
    int? vocalisation;
    int? experimental;
    int? hairless;
    int? natural;
    int? rare;
    int? rex;
    int? suppressedTail;
    int? shortLegs;
    String? wikipediaUrl;
    int? hypoallergenic;
    String? referenceImageId;
    int? catFriendly;
    int? bidability;
    String? urlReferenceImage;

    CatbreedsModelInterface({
        this.weight,
        this.id,
        this.name,
        this.cfaUrl,
        this.vetstreetUrl,
        this.vcahospitalsUrl,
        this.temperament,
        this.origin,
        this.countryCodes,
        this.countryCode,
        this.description,
        this.lifeSpan,
        this.indoor,
        this.lap,
        this.altNames,
        this.adaptability,
        this.affectionLevel,
        this.childFriendly,
        this.dogFriendly,
        this.energyLevel,
        this.grooming,
        this.healthIssues,
        this.intelligence,
        this.sheddingLevel,
        this.socialNeeds,
        this.strangerFriendly,
        this.vocalisation,
        this.experimental,
        this.hairless,
        this.natural,
        this.rare,
        this.rex,
        this.suppressedTail,
        this.shortLegs,
        this.wikipediaUrl,
        this.hypoallergenic,
        this.referenceImageId,
        this.catFriendly,
        this.bidability,
        this.urlReferenceImage
    });

}

abstract class WeightModelInterface {
    String? imperial;
    String? metric;

    WeightModelInterface({
        this.imperial,
        this.metric,
    });
}
