import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_news/logic/SearchNewsbloc/search_news_bloc.dart';

import 'package:flutter_news/presentation/widgets/news_error.dart';
import 'package:flutter_news/presentation/widgets/news_loaded.dart';
import 'package:flutter_news/presentation/widgets/news_loading.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController searchController = TextEditingController();

    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Container(
              margin: const EdgeInsets.all(10),
              child: TextField(
                autofocus: true,
                controller: searchController,
                decoration: InputDecoration(
                    suffixIcon: IconButton(
                        onPressed: () async {
                          BlocProvider.of<SearchNewsBloc>(context).add(
                              SearchNewsFetchEvent(
                                  keyword: searchController.text));
                        },
                        icon: const Icon(Icons.search)),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(40)),
                    hintText: 'Search... '),
                textInputAction: TextInputAction.search,
                onEditingComplete: () {
                  BlocProvider.of<SearchNewsBloc>(context).add(
                      SearchNewsFetchEvent(keyword: searchController.text));
                  FocusManager.instance.primaryFocus?.unfocus();
                },
              ),
            ),
            BlocBuilder<SearchNewsBloc, SearchNewsState>(
              builder: (context, state) {
                if (state is SearchNewsLoading) {
                  return const Center(child: LoadingNews());
                }
                if (state is SearchNewsError) {
                  return NewsError(error: state.error);
                }
                if (state is SearchNewsLoaded) {
                  return Expanded(child: NewsLoaded(news: state.news));
                }
                return Container();
              },
            ),
          ],
        ),
      ),
    );
  }
}
