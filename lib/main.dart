import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wollk_movie_pedia/features/trending/presentation/cubit/trending_cubit.dart';
import 'package:wollk_movie_pedia/features/trending/presentation/pages/trending_page.dart';
import 'injector.dart' as di;

void main() {
  di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => di.locator<TrendingCubit>()..getTrendingAll(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const TrendingPage(),
      ),
    );
  }
}
