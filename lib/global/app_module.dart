import 'package:flutter_modular/flutter_modular.dart';
import 'package:prueba_flutter_pragma/global/presentation/cubits/cubits.dart';
import 'package:prueba_flutter_pragma/global/presentation/screens/screens.dart';

class AppModule extends Module {

  @override
  void binds(i) {
    i.addSingleton<CatbreedsCubit>(CatbreedsCubit.new);
  }

  @override
  void routes(r) {
    r.child(
      '/', 
      child: (context) => MainScreen(),
    );
    r.child(
      '/detail', 
      child: (context) => DetailScreen(cat: r.args.data),
    );
  }
}