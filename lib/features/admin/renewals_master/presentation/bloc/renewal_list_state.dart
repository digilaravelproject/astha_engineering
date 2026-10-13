import 'package:equatable/equatable.dart';
import 'package:astha_engineering/features/admin/renewals_master/domain/entities/renewal_entity.dart';

abstract class RenewalListState extends Equatable {
  const RenewalListState();
  @override List<Object?> get props => [];
}

class RenewalListInitial extends RenewalListState {}
class RenewalListLoading extends RenewalListState {}

class RenewalListLoaded extends RenewalListState {
  final List<RenewalEntity> renewals;
  const RenewalListLoaded(this.renewals);
  @override List<Object?> get props => [renewals];
}

class RenewalListError extends RenewalListState {
  final String message;
  const RenewalListError(this.message);
  @override List<Object?> get props => [message];
}
