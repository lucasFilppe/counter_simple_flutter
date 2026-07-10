import 'package:counter_bloc_simple/features/counter/bloc/counter_bloc.dart';
import 'package:counter_bloc_simple/features/counter/pages/counter_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

class CounterModule extends Module {

  @override
  void binds(Injector i) {

    // Registra o CounterBloc no container do Modular.
    // Será criado somente quando alguém solicitar.
    i.addLazySingleton(CounterBloc.new);

  }

  @override
  void routes(RouteManager r) {

    // Página inicial da feature Counter
    r.child(
      '/',
      child: (_) => const CounterPage(),
    );

  }
}