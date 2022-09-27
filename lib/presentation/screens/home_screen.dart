import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_news/presentation/screens/favorite_screen.dart';

import 'package:flutter_news/presentation/widgets/TabViews/business_news.dart';
import 'package:flutter_news/presentation/widgets/TabViews/entertainment_news.dart';
import 'package:flutter_news/presentation/widgets/TabViews/general_news.dart';
import 'package:flutter_news/presentation/widgets/TabViews/health_news.dart';
import 'package:flutter_news/presentation/widgets/TabViews/sports_news.dart';
import 'package:flutter_news/presentation/screens/search_screen.dart';
import 'package:flutter_news/presentation/widgets/theme/theme.dart';

import 'package:google_fonts/google_fonts.dart';

import '../../logic/Themebloc/theme_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with AutomaticKeepAliveClientMixin {
  TextEditingController searchController = TextEditingController();

  String get getKeyword => searchController.text;
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return WillPopScope(
      onWillPop: () async {
        final shouldPop = await showDialog<bool>(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: const Text('Are you sure you want to exit the app?'),
              actionsAlignment: MainAxisAlignment.spaceBetween,
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context, true);
                  },
                  child: const Text('Yes'),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pop(context, false);
                  },
                  child: const Text('No'),
                ),
              ],
            );
          },
        );
        return shouldPop!;
      },
      child: BlocBuilder<ThemeBloc, ThemeState>(
        builder: (context, state) {
          // state.theme = AppTheme.lightTheme;
          return Scaffold(
            appBar: AppBar(
              leading: IconButton(
                  icon: Icon(state.theme == AppTheme.darkTheme
                      ? Icons.dark_mode
                      : Icons.light_mode),
                  onPressed: () {
                    BlocProvider.of<ThemeBloc>(context)
                        .add(ThemeToggledEvent());
                  }),
              title: Text(
                'Flutter News',
                style: GoogleFonts.lobsterTwo(fontSize: 25.0),
              ),
              centerTitle: true,
              elevation: 0.0,
              backgroundColor: Theme.of(context).backgroundColor,
              foregroundColor: Theme.of(context).primaryColor,
              actions: [
                IconButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: ((context) => const SearchScreen())));
                    },
                    icon: const Icon(Icons.search)),
                IconButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: ((context) => const FavoriteScreen())));
                    },
                    icon: const Icon(Icons.favorite))
              ],
            ),
            body: DefaultTabController(
              length: 5,
              child: Column(
                children: [
                  SizedBox(
                    height: 50,
                    width: double.infinity,
                    child: TabBar(
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        indicatorPadding:
                            const EdgeInsets.only(left: 15, right: 15),
                        isScrollable: true,
                        labelColor: const Color(0xff1d6983),
                        unselectedLabelColor: Colors.grey,
                        indicatorColor: const Color.fromARGB(255, 17, 15, 13),
                        indicatorWeight: 3,
                        labelStyle: GoogleFonts.lato(
                            fontSize: 18,
                            color: const Color(0xff0d1b21),
                            fontWeight: FontWeight.bold),
                        tabs: const [
                          Tab(
                            text: 'General',
                          ),
                          Tab(
                            text: 'Entertainment',
                          ),
                          Tab(
                            text: 'Sports',
                          ),
                          Tab(
                            text: 'Health',
                          ),
                          Tab(
                            text: 'Business',
                          ),
                        ]),
                  ),
                  const Expanded(
                    child: TabBarView(
                      children: [
                        GeneralNews(),
                        EntertainmentNews(),
                        SportsNews(),
                        HealthNews(),
                        BusinessNews(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
