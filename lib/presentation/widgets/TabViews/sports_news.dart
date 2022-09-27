import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_news/logic/SportsNewsbloc/sports_news_bloc.dart';
import 'package:flutter_news/presentation/widgets/news_error.dart';
import 'package:flutter_news/presentation/widgets/news_loaded.dart';
import 'package:flutter_news/presentation/widgets/news_loading.dart';

class SportsNews extends StatelessWidget {
  const SportsNews({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SportsNewsBloc, SportsNewsState>(
        builder: ((context, state) {
      if (state is SportsNewsLoading) {
        return const LoadingNews();
      }
      if (state is SportsNewsError) {
        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              NewsError(error: state.error),
              ElevatedButton(
                  onPressed: () async {
                    BlocProvider.of<SportsNewsBloc>(context)
                        .add(const SportsNewsFetchEvent());
                  },
                  child: Container(
                      color: Colors.blue,
                      child: const Text(
                        'Try Again.',
                        style: TextStyle(fontSize: 20),
                      )))
            ],
          ),
        );
      }
      if (state is SportsNewsLoaded) {
        return RefreshIndicator(
            onRefresh: () async {
              BlocProvider.of<SportsNewsBloc>(context)
                  .add(const SportsNewsRefreshEvent());
            },
            child: NewsLoaded(news: state.news));
      }

      return Container();
    }));
  }
}
