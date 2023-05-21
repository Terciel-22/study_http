import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:study_http/screens/post/index.screen.dart';
import 'package:study_http/services/post.service.dart';

GoRouter _router = GoRouter(
  routes: [
    GoRoute(
        path: '/',
        name: 'posts',
        builder: ((context, state) => const PostScreen())),
  ],
);
void main() {
  runApp(
    MultiProvider(
      providers: [ChangeNotifierProvider(create: (context) => PostService())],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: _router,
    );
  }
}
