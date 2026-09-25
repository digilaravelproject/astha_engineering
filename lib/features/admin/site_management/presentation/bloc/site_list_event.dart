import 'package:equatable/equatable.dart';

abstract class SiteListEvent extends Equatable {
  const SiteListEvent();

  @override
  List<Object> get props => [];
}

class LoadSiteList extends SiteListEvent {}
