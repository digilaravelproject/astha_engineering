import 'package:equatable/equatable.dart';


abstract class SiteListState extends Equatable {
  const SiteListState();
  @override
  List<Object> get props => [];
}

class SiteListInitial extends SiteListState {}
class SiteListLoading extends SiteListState {}
class SiteListLoaded extends SiteListState {
  final List<dynamic> sites; // Replace with SiteEntity later
  const SiteListLoaded(this.sites);
  @override
  List<Object> get props => [sites];
}
class SiteListError extends SiteListState {
  final String message;
  const SiteListError(this.message);
  @override
  List<Object> get props => [message];
}
