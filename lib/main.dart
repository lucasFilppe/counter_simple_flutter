import 'package:counter_bloc_simple/features/counter/bloc/counter_bloc.dart';
import 'package:counter_bloc_simple/features/counter/pages/counter_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Aprendendo BLoC",
      debugShowCheckedModeBanner: false,
      /*O MultiBlocProvider serve para disponibilizar vários BLoCs para
       os widgets abaixo dele. */
      home: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => CounterBloc(),
          ),
        ],
        child: CounterPage(),
      ),
    );
  }
}
