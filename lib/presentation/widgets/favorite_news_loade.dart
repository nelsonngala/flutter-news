import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_news/data/model/favorite_news.dart';
import 'package:flutter_news/logic/FavouriteNewsbloc/favorite_news_bloc.dart';
import 'package:flutter_news/presentation/screens/article_viewer_screen.dart';
import 'package:google_fonts/google_fonts.dart';

class FaveNewsLoaded extends StatelessWidget {
  final List<FavoriteNews> favoriteNews;
  const FaveNewsLoaded({
    Key? key,
    required this.favoriteNews,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavoriteNewsBloc, FavoriteNewsState>(
      builder: (context, state) {
        return ListView.builder(
          itemCount: favoriteNews.length,
          itemBuilder: (BuildContext context, int index) {
            var article = favoriteNews[index];
            return Column(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: ((context) => ArticleViewerScreen(
                              title: article.title,
                              webUrl: article.url,
                            ))));
                  },
                  child: Card(
                    elevation: 10,
                    margin: const EdgeInsets.only(
                        left: 5, top: 10, right: 10, bottom: 5),
                    child: Column(
                      children: [
                        Container(
                          margin: const EdgeInsets.only(
                              left: 10, top: 5, right: 10),
                          width: MediaQuery.of(context).size.width,
                          height: 200,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5.0),
                              image: DecorationImage(
                                  image: NetworkImage(article.urlToImage),
                                  fit: BoxFit.cover)),
                        ),
                        Container(
                            margin: const EdgeInsets.only(left: 15, right: 15),
                            child: Text(
                              article.title,
                              style: GoogleFonts.robotoMono(
                                  fontWeight: FontWeight.bold, fontSize: 16.0),
                            )),
                        Container(
                            margin: const EdgeInsets.only(left: 15, right: 15),
                            child: Text(
                              article.description,
                              style: GoogleFonts.robotoMono(
                                  fontWeight: FontWeight.normal),
                            )),
                        IconButton(
                            onPressed: () {
                              BlocProvider.of<FavoriteNewsBloc>(context)
                                  .add(FavoriteNewsRemoveEvent(id: index));
                            },
                            icon: const Icon(
                              Icons.delete,
                            )),
                        const SizedBox(
                          height: 15,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            );
          },
        );
      },
    );
  }
}
