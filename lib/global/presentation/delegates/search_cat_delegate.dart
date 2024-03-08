import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:prueba_flutter_pragma/global/data/models/models.dart';
import 'package:prueba_flutter_pragma/global/presentation/cubits/cubits.dart';

class SearchCatDelegate extends SearchDelegate<CatbreedsModel?>{

  final CatbreedsCubit _cubit = Modular.get<CatbreedsCubit>();

  @override
  String get searchFieldLabel => "Buscar";

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      if ( query.isNotEmpty )
        IconButton(
          onPressed: () => query = '',
          icon: const Icon(Icons.clear)
        )
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        close(context, null);
      }, 
      icon: const Icon(Icons.arrow_back)
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return FutureBuilder(
      future: _cubit.getSearchCat(query: query),
      initialData: _cubit.catbreedsGlobal,
      builder: (BuildContext context, AsyncSnapshot snapshot) {

        if (!snapshot.hasData) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        List<CatbreedsModel> cats = snapshot.data;

        if (cats.isNotEmpty) {
          return ListView.builder(
            itemCount: cats.length,
            itemBuilder: (BuildContext context, int index) {
              return _CatItem(
                cat: cats[index], 
                onCatSelected: (context, cat) {
                  close(context, cat);
                },
              );
            },
          );
        }

        return Container();

      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {

    return FutureBuilder(
      future: _cubit.getSearchCat(query: query),
      initialData: _cubit.catbreedsGlobal,
      builder: (BuildContext context, AsyncSnapshot snapshot) {

        if (!snapshot.hasData) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        List<CatbreedsModel> cats = snapshot.data;

        if (cats.isNotEmpty) {
          return ListView.builder(
            itemCount: cats.length,
            itemBuilder: (BuildContext context, int index) {
              return _CatItem(
                cat: cats[index], 
                onCatSelected: (context, cat) {
                  close(context, cat);
                },
              );
            },
          );
        }

        return Container();

      },
    );

  }

}


class _CatItem extends StatelessWidget {

  final CatbreedsModel cat;
  final Function onCatSelected;

  const _CatItem({
    required this.cat,
    required this.onCatSelected
  });

  @override
  Widget build(BuildContext context) {

    final textStyles = Theme.of(context).textTheme;
    final size = MediaQuery.of(context).size;

    return GestureDetector(
      onTap: () {
        onCatSelected(context, cat);
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        child: Row(
          children: [
    
            // Image
            SizedBox(
              width: size.width * 0.2,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network( 
                  cat.urlReferenceImage!,
                  errorBuilder: (context, error, stackTrace) {
                    return Image.asset('assets/no-image.png');
                  },
                ),
              ),
            ),
    
            const SizedBox(width: 10),
            
            // Description
            SizedBox(
              width: size.width * 0.7,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text( cat.name ?? 'Sin Nombre', style: textStyles.titleMedium ),
    
                  ( cat.description!.length > 100 )
                    ? Text( '${cat.description!.substring(0,100)}...' )
                    : Text( cat.description! ),
                ],
              ),
            ),
    
          ],
        ),
      ),
    );
  }
}