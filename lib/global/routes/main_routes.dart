/* 
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prueba_flutter_pragma/global/presentation/cubits/cubits.dart';
import 'package:prueba_flutter_pragma/global/presentation/screens/screens.dart';

final GoRouter routes = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      name: 'Main',
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return MultiBlocProvider(
          providers: [
            BlocProvider<CatbreedsCubit>.value(
              value: CatbreedsCubit(),
            ),
          ],
          child: MainScreen()
        );
        
        
      },
    ),

    GoRoute(
      name: 'Detail',
      path: '/detail',
      builder: (BuildContext context, GoRouterState state) {
        return const DetailScreen();
      },
    ),
  ],
); */