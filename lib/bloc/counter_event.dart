//define uma classe abstrata, ou seja, uma classe que 
//não pode ser instanciada diretamente. Ela serve como uma classe base para todos os eventos do seu BLoC
abstract class CounterEvent {}

class CounterIncrementPressed extends CounterEvent{}
class CounterDecrementPressed extends CounterEvent{}