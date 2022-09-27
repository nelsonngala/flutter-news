import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_news/logic/EntertainmentNewsbloc/entartainment_news_bloc.dart';
import 'package:flutter_news/presentation/widgets/news_error.dart';
import 'package:flutter_news/presentation/widgets/news_loaded.dart';
import 'package:flutter_news/presentation/widgets/news_loading.dart';

class EntertainmentNews extends StatelessWidget {
  const EntertainmentNews({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EntartainmentNewsBloc, EntartainmentNewsState>(
        builder: ((context, state) {
      if (state is EntartainmentNewsLoading) {
        return const LoadingNews();
      }
      if (state is EntartainmentNewsError) {
        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              NewsError(error: state.error),
              ElevatedButton(
                  onPressed: () async {
                    BlocProvider.of<EntartainmentNewsBloc>(context)
                        .add(const EntartainmentNewsFetchEvent());
                  },
                  child: Container(
                      color: Colors.blue,
                      child: const Text(
                        'Try again',
                        style: TextStyle(fontSize: 20),
                      )))
            ],
          ),
        );
      }
      if (state is EntartainmentNewsLoaded) {
        return RefreshIndicator(
            onRefresh: () async {
              BlocProvider.of<EntartainmentNewsBloc>(context)
                  .add(const EntartainmentNewsRefreshEvent());
            },
            child: NewsLoaded(news: state.news));
      }

      return Container();
    }));
  }
}
