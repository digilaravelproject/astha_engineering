import 'package:equatable/equatable.dart';
import 'package:astha_engineering/features/admin/checkpoints_master/domain/entities/checkpoint_entity.dart';

abstract class CheckpointListState extends Equatable {
  const CheckpointListState();
  @override List<Object?> get props => [];
}

class CheckpointListInitial extends CheckpointListState {}
class CheckpointListLoading extends CheckpointListState {}

class CheckpointListLoaded extends CheckpointListState {
  final List<CheckpointEntity> checkpoints;
  const CheckpointListLoaded(this.checkpoints);
  @override List<Object?> get props => [checkpoints];
}

class CheckpointListError extends CheckpointListState {
  final String message;
  const CheckpointListError(this.message);
  @override List<Object?> get props => [message];
}
