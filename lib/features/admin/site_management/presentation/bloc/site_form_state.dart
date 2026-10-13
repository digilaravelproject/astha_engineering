import 'package:equatable/equatable.dart';
import 'package:astha_engineering/features/admin/site_management/domain/entities/site_entity.dart';

abstract class SiteFormState extends Equatable {
  const SiteFormState();
  @override
  List<Object?> get props => [];
}

class SiteFormInitial extends SiteFormState {}

class SiteFormPrefilled extends SiteFormState {
  final SiteEntity site;
  const SiteFormPrefilled(this.site);
  @override
  List<Object?> get props => [site];
}

class SiteFormLoading extends SiteFormState {}

class SiteFormSuccess extends SiteFormState {
  final String message;
  const SiteFormSuccess(this.message);
  @override
  List<Object?> get props => [message];
}

class SiteFormError extends SiteFormState {
  final String message;
  const SiteFormError(this.message);
  @override
  List<Object?> get props => [message];
}
