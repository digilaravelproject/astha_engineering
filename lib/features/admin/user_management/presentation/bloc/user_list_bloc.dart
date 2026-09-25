import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:safecheck_techno/features/admin/user_management/domain/usecases/get_users.dart';

import 'user_list_event.dart';
import 'user_list_state.dart';

class UserListBloc extends Bloc<UserListEvent, UserListState> {
  final GetUsers getUsers;

  UserListBloc({required this.getUsers}) : super(UserListInitial()) {
    on<LoadUserList>(_onLoadUserList);
  }

  Future<void> _onLoadUserList(LoadUserList event, Emitter<UserListState> emit) async {
    emit(UserListLoading());
    final result = await getUsers();
    result.fold(
      (failure) => emit(UserListError(failure.message)),
      (users) => emit(UserListLoaded(users)),
    );
  }
}
