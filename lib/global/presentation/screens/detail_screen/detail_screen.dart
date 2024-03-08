import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:prueba_flutter_pragma/global/data/models/models.dart';
import 'package:prueba_flutter_pragma/global/widgets/widgets.dart';

class DetailScreen extends StatelessWidget {

  final CatbreedsModel cat;
  
  const DetailScreen({
    required this.cat,
    super.key
  });

  @override
  Widget build(BuildContext context) {

    Size mq = MediaQuery.of(context).size;

    return SafeArea(
      bottom: false,
      top: false,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text(cat.name ?? 'Sin nombre'),
          leading: IconButton(
            onPressed: () {
              Modular.to.navigate('/');
            },
            icon: const Icon(Icons.arrow_back)
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              Hero(
                tag: cat.id!,
                child: Image.network(
                  cat.urlReferenceImage!,
                  errorBuilder: (context, error, stackTrace) {
                    return Image.asset('assets/no-image.png');
                  },
                ),
              ),
              SizedBox(height: mq.height * 0.02,),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomText(text: cat.description ?? 'Sin descripción', fontSize: mq.height * 0.03,),
                      SizedBox(height: mq.height * 0.02,),
                      CustomText(text: 'País de origen', fontSize: mq.height * 0.03, fontWeight: FontWeight.w600),
                      CustomText(text: cat.origin!, fontSize: mq.height * 0.03,),
                      SizedBox(height: mq.height * 0.02,),
                      CustomText(text: 'Inteligencia', fontSize: mq.height * 0.03, fontWeight: FontWeight.w600),
                      CustomText(text: cat.intelligence.toString(), fontSize: mq.height * 0.03,),
                      SizedBox(height: mq.height * 0.02,),
                      CustomText(text: 'Adaptabilidad', fontSize: mq.height * 0.03, fontWeight: FontWeight.w600),
                      CustomText(text: cat.adaptability.toString(), fontSize: mq.height * 0.03,),
                      SizedBox(height: mq.height * 0.02,),
                      CustomText(text: 'Tiempo de vida', fontSize: mq.height * 0.03, fontWeight: FontWeight.w600),
                      CustomText(text: cat.lifeSpan!, fontSize: mq.height * 0.03,),
                    ],
                  ),
                ),
              ),
            ],
          ),
        )
      )
    );
  }
}