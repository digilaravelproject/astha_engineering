enum UserRole {
  admin,
  inspectionEngineer,
  customer,
}

extension UserRoleExtension on UserRole {
  String get displayName {
    switch (this) {
      case UserRole.admin:
        return 'Admin';
      case UserRole.inspectionEngineer:
        return 'Inspection Engineer';
      case UserRole.customer:
        return 'Customer';
    }
  }

  String get shortName {
    switch (this) {
      case UserRole.inspectionEngineer:
        return 'Inspector';
      default:
        return displayName;
    }
  }
}
