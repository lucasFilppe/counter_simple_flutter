import 'package:counter_bloc_simple/features/counter/bloc/conter_state.dart';
import 'package:counter_bloc_simple/features/counter/bloc/counter_bloc.dart';
import 'package:counter_bloc_simple/features/counter/bloc/counter_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

class CounterPage extends StatelessWidget {
  const CounterPage({super.key});

  @override
  Widget build(BuildContext context) {

    // 1. Obtém a instância do CounterBloc através do Modular
    // Usamos Modular.get() que é a forma mais explícita e segura no v7+
    final counterBloc = Modular.get<CounterBloc>();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Counter BLoC"),
      ),
      body: Center(
        child: BlocBuilder<CounterBloc, CounterState>(
          // 2. A MÁGICA ACONTECE AQUI: 
          // Passamos a instância diretamente para o builder.
          // Isso impede que ele procure na árvore de widgets.
          bloc: counterBloc, 
          
          builder: (context, state) {
            return Text(
              "${state.count}",
              style: const TextStyle(fontSize: 50),
            );
          },
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () {
              // Envia o evento diretamente para a instância do Modular
              counterBloc.add(CounterIncrementPressed());
            },
            child: const Icon(Icons.add),
          ),
          const SizedBox(height: 10),
          FloatingActionButton(
            onPressed: () {
              // Envia o evento diretamente para a instância do Modular
              counterBloc.add(CounterDecrementPressed());
            },
            child: const Icon(Icons.remove),
          ),
        ],
      ),
    );
  }
}