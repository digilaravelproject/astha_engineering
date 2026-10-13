import 'package:equatable/equatable.dart';
import 'package:astha_engineering/features/admin/site_management/domain/entities/site_entity.dart';

abstract class SiteFormEvent extends Equatable {
  const SiteFormEvent();
  @override
  List<Object?> get props => [];
}

class LoadSiteForEdit extends SiteFormEvent {
  final SiteEntity site;
  const LoadSiteForEdit(this.site);
  @override
  List<Object?> get props => [site];
}

class SaveSite extends SiteFormEvent {
  final SiteEntity site;
  const SaveSite(this.site);
  @override
  List<Object?> get props => [site];
}
