import 'package:flutter/material.dart';
import 'package:flutter_bloc_practice_new/feature/home/ui/home.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'feature/home/bloc/home_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return

      BlocProvider(
      create: (context) => HomeBloc(),
      child:

      MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Bloc',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const Home(),
      ),
    );
  }
}

