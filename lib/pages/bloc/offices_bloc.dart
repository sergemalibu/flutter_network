import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_network/models/user.dart';
import 'package:flutter_network/repositories/abstract_offices_repository.dart';
import 'package:get_it/get_it.dart';

part 'offices_event.dart';
part 'offices_state.dart';

class OfficesBloc extends Bloc<OfficesEvent, OfficesState> {
  OfficesBloc() : super(InitialState()) {
    on<FetchOfficesEvent>(_onFetch);
  }

  final _officesRepository =
      GetIt.I<AbstractOfficesRepository>().fetchOfficesList();

  _onFetch(FetchOfficesEvent event, Emitter<OfficesState> emit) async {
    try {
      emit(LoadingState());
      final officesList = await _officesRepository;
      emit(LoadedState(officesList: officesList));
    } catch (e) {
      emit(FailureState(exception: e));
    }
  }
}
