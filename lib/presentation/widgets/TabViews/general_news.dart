import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_news/logic/GeneralNewsbloc/general_news_bloc.dart';
import 'package:flutter_news/presentation/widgets/news_error.dart';
import 'package:flutter_news/presentation/widgets/news_loaded.dart';
import 'package:flutter_news/presentation/widgets/news_loading.dart';

class GeneralNews extends StatelessWidget {
  const GeneralNews({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GeneralNewsBloc, GeneralNewsState>(
        builder: ((context, state) {
      if (state is GeneralNewsLoading) {
        return const LoadingNews();
      }
      if (state is GeneralNewsError) {
        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              NewsError(error: state.error),
              ElevatedButton(
                  onPressed: () async {
                    BlocProvider.of<GeneralNewsBloc>(context)
                        .add(const GeneralFetchEvent());
                  },
                  child: Container(
                    color: Colors.blue,
                    child: const Text(
                      'Try again.',
                      style: TextStyle(fontSize: 20),
                    ),
                  ))
            ],
          ),
        );
      }
      if (state is GeneralNewsLoaded) {
        return RefreshIndicator(
            onRefresh: () async {
              BlocProvider.of<GeneralNewsBloc>(context)
                  .add(const GeneralNewsRefreshEvent());
            },
            child: NewsLoaded(news: state.news));
      }

      return Container();
    }));
  }
}
