import 'package:counter_bloc_simple/features/counter/bloc/conter_state.dart';
import 'package:counter_bloc_simple/features/counter/bloc/counter_bloc.dart';
import 'package:counter_bloc_simple/features/counter/bloc/counter_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterPage extends StatelessWidget {
  const CounterPage({super.key});

  @override
  Widget build(BuildContext context) {

    // Obtém a instância do CounterBloc que foi fornecida
    // pelo BlocProvider ou MultiBlocProvider.
    // Usamos read() porque queremos apenas enviar eventos.
    final counterBloc = context.read<CounterBloc>();

    return Scaffold(

      // Barra superior da aplicação
      appBar: AppBar(
        title: const Text("Counter BLoC"),
      ),

      // Corpo da tela
      body: Center(

        // Escuta as mudanças de estado do CounterBloc.
        // Sempre que emit() for chamado no bloc,
        // este builder será executado novamente.
        child: BlocBuilder<CounterBloc, CounterState>(

          // 'state' representa o estado atual do contador.
          builder: (context, state) {

            // Exibe o valor atual do contador.
            return Text(
              "${state.count}",
              style: const TextStyle(fontSize: 50),
            );
          },
        ),
      ),

      // Botões flutuantes
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [

          // Botão de incrementar
          FloatingActionButton(

            onPressed: () {

              // Envia um evento para o CounterBloc.
              // O bloc processará esse evento e emitirá
              // um novo estado com o contador incrementado.
              counterBloc.add(CounterIncrementPressed());

            },

            child: const Icon(Icons.add),
          ),

          const SizedBox(height: 10),

          // Botão de decrementar
          FloatingActionButton(

            onPressed: () {

              // Envia o evento de decremento para o bloc.
              counterBloc.add(CounterDecrementPressed());

            },

            child: const Icon(Icons.remove),
          ),
        ],
      ),
    );
  }
}