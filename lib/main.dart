import 'package:flutter/material.dart';
import 'package:holy_bible/constants.dart';
import 'package:holy_bible/pages/chapter_page.dart';
import 'package:holy_bible/pages/chapters_page.dart';
import 'package:holy_bible/pages/gospels_page.dart';
import 'package:holy_bible/pages/splash_page.dart';
import 'package:holy_bible/pages/testaments_page.dart';
import 'package:go_router/go_router.dart';

void main() {
  runApp(HolyBible());
}

class HolyBible extends StatelessWidget {
  HolyBible({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: ThemeData(scaffoldBackgroundColor: kBackgroundColor),
      debugShowCheckedModeBanner: false,
      routerConfig: router,
    );
  }

  final router = GoRouter(
    initialLocation: '/',
    routes: [
      GoRoute(
          path: '/',
          builder: (context, state) => const SplashPage(),
          name: 'SplashPage'),
      GoRoute(
        path: '/testaments',
        builder: (context, state) => const TestamentsPage(),
        name: 'TestamentsPage',
      ),
      GoRoute(
        path: '/gospels',
        builder: (context, state) => const GospelsPage(),
        name: 'GospelsPage',
      ),
      GoRoute(
        path: '/chapters',
        builder: (context, state) => const ChaptersPage(),
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
