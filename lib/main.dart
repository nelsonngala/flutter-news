import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_news/data/model/favorite_news.dart';
import 'package:flutter_news/data/news%20api/news_api.dart';
import 'package:flutter_news/logic/BusinessNewsbloc/business_news_bloc.dart';
import 'package:flutter_news/logic/EntertainmentNewsbloc/entartainment_news_bloc.dart';
import 'package:flutter_news/logic/FavouriteNewsbloc/favorite_news_bloc.dart';
import 'package:flutter_news/logic/GeneralNewsbloc/general_news_bloc.dart';
import 'package:flutter_news/logic/HealthNewsbloc/health_news_bloc.dart';
import 'package:flutter_news/logic/SearchNewsbloc/search_news_bloc.dart';
import 'package:flutter_news/logic/SportsNewsbloc/sports_news_bloc.dart';
import 'package:flutter_news/logic/Themebloc/theme_bloc.dart';
import 'package:flutter_news/presentation/screens/home_screen.dart';
import 'package:flutter_news/presentation/widgets/theme/theme.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';

import 'data/local storage/hive_storage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(FaveNewsAdapter());

  final storage = await HydratedStorage.build(
    storageDirectory: await getTemporaryDirectory(),
  );
  HydratedBlocOverrides.runZoned(() => runApp(const MyApp()), storage: storage);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => GeneralNewsBloc(GeneralNewsData())
            ..add(const GeneralFetchEvent()),
        ),
        BlocProvider(
          create: (context) => EntartainmentNewsBloc(EntertainmentNewsData())
            ..add(const EntartainmentNewsFetchEvent()),
        ),
        BlocProvider(
            create: ((context) => SportsNewsBloc(SportsNewsData())
              ..add(const SportsNewsFetchEvent()))),
        BlocProvider(
            create: ((context) => HealthNewsBloc(HealthNewsData())
              ..add(const HealthNewsFetchEvent()))),
        BlocProvider(
            create: ((context) => BusinessNewsBloc(BusinessNewsData())
              ..add(const BusinessNewsFetchEvent()))),
        BlocProvider(create: ((context) => SearchNewsBloc(SearchNewsData()))),
        BlocProvider(
            create: ((context) =>
                FavoriteNewsBloc(HiveSorage())..add(FavouriteNewsGetEvent()))),
        BlocProvider(create: ((context) => ThemeBloc()))
      ],
      child: BlocBuilder<ThemeBloc, ThemeState>(
        builder: (context, state) {
          return MaterialApp(
            title: 'Flutter News',
            debugShowCheckedModeBanner: false,
            theme: appThemeData[state.theme],
            home: const HomeScreen(),
          );
        },
      ),
    );
  }
}
