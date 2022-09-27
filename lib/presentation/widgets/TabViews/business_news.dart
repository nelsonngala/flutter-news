import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_news/logic/BusinessNewsbloc/business_news_bloc.dart';
import 'package:flutter_news/presentation/widgets/news_error.dart';
import 'package:flutter_news/presentation/widgets/news_loading.dart';

import '../news_loaded.dart';

class BusinessNews extends StatelessWidget {
  const BusinessNews({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BusinessNewsBloc, BusinessNewsState>(
        builder: ((context, state) {
      if (state is BusinessNewsLoading) {
        return const LoadingNews();
      }
      if (state is BusinessNewsError) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            NewsError(error: state.error),
            ElevatedButton(
                onPressed: () {
                  BlocProvider.of<BusinessNewsBloc>(context)
                      .add(const BusinessNewsFetchEvent());
                },
                child: Container(
                    color: Colors.blue, child: const Text('Try again')))
          ],
        );
      }
      if (state is BusinessNewsLoaded) {
        return RefreshIndicator(
            onRefresh: () async {
              BlocProvider.of<BusinessNewsBloc>(context)
                  .add(const BusinessNewsRefreshEvent());
            },
            child: NewsLoaded(news: state.news));
      }

      return Container();
    }));
  }
}
