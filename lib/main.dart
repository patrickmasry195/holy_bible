import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:holy_bible/constants.dart';
import 'package:holy_bible/cubits/chapters_cubit/chapters_cubit.dart';
import 'package:holy_bible/cubits/gospels_cubit/gospels_cubit.dart';
import 'package:holy_bible/models/chapters_model.dart';
import 'package:holy_bible/models/gospels_model.dart';
import 'package:holy_bible/pages/chapter_page.dart';
import 'package:holy_bible/pages/chapters_page.dart';
import 'package:holy_bible/pages/gospels_page.dart';
import 'package:holy_bible/pages/testaments_page.dart';
import 'package:go_router/go_router.dart';
import 'package:holy_bible/services/get_chapters.dart';
import 'package:holy_bible/services/get_gospels.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(GospelsModelAdapter());
  Hive.registerAdapter(ChaptersModelAdapter());

  runApp(HolyBible());
}

class HolyBible extends StatelessWidget {
  HolyBible({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<GospelsCubit>(
            create: (context) => GospelsCubit(GetGospels())),
        BlocProvider<ChaptersCubit>(
            create: (context) => ChaptersCubit(GetChapters())),
      ],
      child: MaterialApp.router(
        theme: ThemeData(
          textTheme: TextTheme(
            bodyMedium: GoogleFonts.balooBhaijaan2(
              fontSize: 20,
            ),
            headlineMedium: GoogleFonts.balooBhaijaan2(
              fontSize: 24,
            ),
          ),
          scaffoldBackgroundColor: kBackgroundColor,
        ),
        debugShowCheckedModeBanner: false,
        routerConfig: router,
      ),
    );
  }

  final router = GoRouter(
    initialLocation: '/',
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const TestamentsPage(),
        name: 'TestamentsPage',
      ),
      GoRoute(
        path: '/gospels',
        builder: (context, state) {
          final testamentType = state.uri.queryParameters['testament'];
          return GospelsPage(
            testamentType: testamentType,
          );
        },
        name: 'GospelsPage',
      ),
      GoRoute(
        path: '/chapters',
        builder: (context, state) {
          final bookId = state.uri.queryParameters['bookId'];
          return ChaptersPage(
            bookId: bookId,
          );
        },
        name: 'ChaptersPage',
      ),
      GoRoute(
        path: '/chapter',
        builder: (context, state) => const ChapterPage(),
        name: 'ChapterPage',
      ),
    ],
  );
}
