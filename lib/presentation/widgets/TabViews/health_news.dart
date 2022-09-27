import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_news/logic/HealthNewsbloc/health_news_bloc.dart';
import 'package:flutter_news/presentation/widgets/news_error.dart';
import 'package:flutter_news/presentation/widgets/news_loaded.dart';
import 'package:flutter_news/presentation/widgets/news_loading.dart';

class HealthNews extends StatelessWidget {
  const HealthNews({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HealthNewsBloc, HealthNewsState>(
        builder: ((context, state) {
      if (state is HealthNewsLoading) {
        return const LoadingNews();
      }
      if (state is HealthNewsError) {
        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              NewsError(error: state.error),
              ElevatedButton(
                  onPressed: () async {
                    BlocProvider.of<HealthNewsBloc>(context)
                        .add(const HealthNewsFetchEvent());
                  },
                  child: Container(
                    color: Colors.blue,
                    child: const Text(
                      'Try Again',
                      style: TextStyle(fontSize: 20),
                    ),
                  ))
            ],
          ),
        );
      }
      if (state is HealthNewsLoaded) {
        return RefreshIndicator(
            onRefresh: () async {
              BlocProvider.of<HealthNewsBloc>(context)
                  .add(const HealthNewsRefreshEvent());
            },
            child: NewsLoaded(news: state.news));
      }

      return Container();
    }));
  }
}
