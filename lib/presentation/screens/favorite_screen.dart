import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_news/logic/FavouriteNewsbloc/favorite_news_bloc.dart';
import 'package:flutter_news/presentation/widgets/favorite_news_loade.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<FavoriteNewsBloc, FavoriteNewsState>(
          builder: ((context, state) {
        if (state is FavoriteNewsInitial) {
          return const Center(
            child: Text('No favorite news added yet.'),
          );
        }
        if (state is FavoriteNewsAvailable) {
          return FaveNewsLoaded(favoriteNews: state.favouriteNews);
        }
        return Container();
      })),
    );
  }
}
