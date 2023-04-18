import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'blocs_event.dart';
part 'blocs_state.dart';

class BlocsBloc extends Bloc<BlocsEvent, BlocsState> {
  BlocsBloc() : super(BlocsInitial()) {
    on<BlocsEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
