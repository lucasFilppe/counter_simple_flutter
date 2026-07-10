import 'package:counter_bloc_simple/features/counter/module/counter_module.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppModule extends Module {

  @override
  void routes(RouteManager r) {

    // Toda a navegação "/" será delegada ao CounterModule
    r.module(
      '/',
      module: CounterModule(),
    );

  }
}