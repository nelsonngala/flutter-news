import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_news/data/model/favorite_news.dart';

import 'package:flutter_news/data/model/news_model.dart';
import 'package:flutter_news/logic/FavouriteNewsbloc/favorite_news_bloc.dart';
import 'package:flutter_news/presentation/screens/article_viewer_screen.dart';
import 'package:google_fonts/google_fonts.dart';

class NewsLoaded extends StatefulWidget {
  final News news;
  const NewsLoaded({
    Key? key,
    required this.news,
  }) : super(key: key);

  @override
  State<NewsLoaded> createState() => _NewsLoadedState();
}

class _NewsLoadedState extends State<NewsLoaded>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      body: ListView.builder(
        itemCount: widget.news.articles.length,
        itemBuilder: (BuildContext context, int index) {
          Article article = widget.news.articles[index];
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
                        margin:
                            const EdgeInsets.only(left: 10, top: 5, right: 10),
                        width: MediaQuery.of(context).size.width,
                        height: 200,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5.0),
                            image: DecorationImage(
                                image: NetworkImage(article.urlToImage ??
                                    'https://media.istockphoto.com/photos/businessman-hand-showing-check-mark-on-city-background-picture-id1332353096?b=1&k=20&m=1332353096&s=170667a&w=0&h=yJTi-JN8fyXKsfoilYvwIAeSuw-s6lCRxHN2iv2Yf0I='),
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
                            article.description ?? 'n/a',
                            style: GoogleFonts.robotoMono(
                                fontWeight: FontWeight.normal),
                          )),
                      Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.grey[200],
                        ),
                        child: IconButton(
                            onPressed: () {
                              FavoriteNews favoriteNews = FavoriteNews(
                                  url: article.url,
                                  urlToImage: article.urlToImage ??
                                      'https://media.istockphoto.com/photos/businessman-hand-showing-check-mark-on-city-background-picture-id1332353096?b=1&k=20&m=1332353096&s=170667a&w=0&h=yJTi-JN8fyXKsfoilYvwIAeSuw-s6lCRxHN2iv2Yf0I=',
                                  title: article.title,
                                  description: article.description ?? 'N/A');
                              BlocProvider.of<FavoriteNewsBloc>(context).add(
                                  FavoriteNewsAddEvent(
                                      favoriteNews: favoriteNews));
                              const snackBar = SnackBar(
                                content: Text('Added to favorites'),
                              );
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(snackBar);
                            },
                            icon: const Icon(
                              Icons.add,
                              size: 20.0,
                              shadows: [Shadow(blurRadius: 5)],
                            )),
                      ),
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
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
