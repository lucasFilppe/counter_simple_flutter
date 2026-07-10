import 'package:counter_bloc_simple/features/counter/bloc/counter_bloc.dart';
import 'package:counter_bloc_simple/features/counter/pages/counter_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppModule extends Module {

  @override
  void binds(Injector i) {

    // Registrando o CounterBloc no container de injeção.
    // O Modular saberá criar essa classe quando ela for solicitada.
    i.addLazySingleton(CounterBloc.new);
  }

  @override
  void routes(RouteManager r) {

    // Aqui serão registradas as rotas da aplicação.
      r.child(
      '/',
      child: (context) => const CounterPage(),
    );

  }
}