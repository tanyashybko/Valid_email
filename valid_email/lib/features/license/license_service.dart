import 'package:flutter/foundation.dart';

Future<List<LicenseEntry>> fetchLicenses() async {
  final List<LicenseEntry> licenses = [];
  await for (final LicenseEntry license in LicenseRegistry.licenses) {
    licenses.add(license);
  }
  return licenses;
}
