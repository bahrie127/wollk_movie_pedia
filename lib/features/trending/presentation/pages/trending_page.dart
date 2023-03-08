import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wollk_movie_pedia/features/trending/presentation/cubit/trending_cubit.dart';
import 'package:wollk_movie_pedia/features/trending/presentation/widgets/trending_item_widget.dart';

class TrendingPage extends StatefulWidget {
  const TrendingPage({super.key});

  @override
  State<TrendingPage> createState() => _TrendingPageState();
}

class _TrendingPageState extends State<TrendingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Trending Today')),
      body: BlocBuilder<TrendingCubit, TrendingState>(
        builder: (context, state) {
          if (state is TrendingLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is TrendingLoaded) {
            return GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.75,
              ),
              itemBuilder: (context, index) {
                return TrendingItemWidget(item: state.trendings[index]);
              },
              itemCount: state.trendings.length,
            );
          }
          if (state is TrendingFailed) {
            return Center(
              child: Text(state.message),
            );
          }

          return const Center(
            child: Text('not found'),
          );
        },
      ),
    );
  }
}
