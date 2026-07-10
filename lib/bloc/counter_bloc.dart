import 'package:counter_bloc_simple/bloc/conter_state.dart';
import 'package:counter_bloc_simple/bloc/counter_event.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/*O trabalho do BLoC é muito simples: ele recebe Eventos, processa esses 
 * eventos (faz cálculos, acessa o banco de dados, chama uma API na internet) e,
 *  como resultado, emite Estados. */
class CounterBloc extends Bloc<CounterEvent, CounterState> {
  // Constrói a classe Bloc com o estado inicial CounterState(0)
  CounterBloc() : super(CounterState(0)) {
     //escuta esse tipo de evento.
    on<CounterIncrementPressed>((event, emit) {
      emit(CounterState(state.count + 1));
      //cria e publica um novo estado com o valor atualizado.

    });
    on<CounterDecrementPressed>((event, emit) {
      emit(CounterState(state.count - 1));
    });
  }
}