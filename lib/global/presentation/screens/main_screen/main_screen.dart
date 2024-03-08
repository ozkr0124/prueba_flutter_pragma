import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:prueba_flutter_pragma/global/presentation/cubits/cubits.dart';
import 'package:prueba_flutter_pragma/global/presentation/delegates/search_cat_delegate.dart';
import 'package:prueba_flutter_pragma/global/widgets/widgets.dart';

class MainScreen extends StatelessWidget {
  
  MainScreen({super.key});

  final CatbreedsCubit _cubit = Modular.get<CatbreedsCubit>();

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
          title: const Text('Catbreeds'),
          actions: [
            IconButton(
              onPressed: () {

                showSearch(
                  context: context, 
                  delegate: SearchCatDelegate()
                ).then((cat) {
                  if (cat == null) return;
                  Modular.to.navigate('/detail', arguments: cat);
                });
                
              },
              icon: const Icon(Icons.search)
            )
          ],
        ),
        body: BlocBuilder<CatbreedsCubit, CatbreedsState>(
          builder: (context, state) {
        
            if (state is CatbreedsLoading || state is CatbreedsInitial) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
        
            if (state is CatbreedsError) {
        
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.error_outline_rounded,
                      color: Colors.red[600],
                      size: mq.height * 0.15,
                    ),
                    CustomText(text: state.message, fontSize: mq.height * 0.03,),
                    ElevatedButton(
                      onPressed: () async {
                        await _cubit.getCatbreeds();
                      },
                      child: const CustomText(text: 'Intentar de nuevo'),
                    )
                  ],
                ),
              );
              
            }
        
            if (state is CatbreedsLoaded) {
              return RefreshIndicator(
                onRefresh: () async {
                  await _cubit.getCatbreeds();
                },
                child: ListView.builder(
                  addAutomaticKeepAlives: true,
                  itemCount: state.data.length,
                  itemBuilder: (BuildContext context, int index) {
                
                    final cat = state.data[index];

                    return Card(
                      surfaceTintColor: Colors.white,
                      elevation: 5,
                      margin: const EdgeInsets.all(10),
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                CustomText(text: cat.name ?? 'Sin nombre', fontSize: mq.height * 0.04,),
                                GestureDetector(
                                  onTap: () {
                                    Modular.to.navigate('/detail', arguments: cat);
                                  },
                                  child: CustomText(text: 'Más...', fontSize: mq.height * 0.03, fontWeight: FontWeight.bold,),
                                ),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.all(10),
                              child: Hero(
                                tag: cat.id!,
                                child: Image.network(
                                  cat.urlReferenceImage!,
                                  fit: BoxFit.contain,
                                  loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
                                    if (loadingProgress == null) {
                                      return child;
                                    }
                                    return Center(
                                      child: CircularProgressIndicator(
                                        value: loadingProgress.expectedTotalBytes != null
                                        ? loadingProgress.cumulativeBytesLoaded / loadingProgress.expectedTotalBytes!
                                        : null,
                                      ),
                                    );
                                  },
                                  errorBuilder: (context, error, stackTrace) {
                                    return Image.asset('assets/no-image.png');
                                  },
                                ),
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                CustomRichText(
                                  title: 'Origen', 
                                  text: cat.origin == null ? 'Sin país' :
                                  ( cat.origin!.length > 13 )
                                  ? '${cat.origin!.substring(0,13)}...'
                                  : cat.origin!,
                                ),
                                CustomRichText(title: 'Inteligencia', text: cat.intelligence.toString())
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              );
            }
        
            return Container();
          },
        ),
      ),
    );
  }
}
