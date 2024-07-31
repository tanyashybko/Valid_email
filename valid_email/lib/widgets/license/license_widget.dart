import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:valid_email/features/license/license_service.dart';
import 'package:valid_email/l10n/l10n.dart';
import 'package:valid_email/localization/language_switcher.dart';

class LicenseWidget extends StatefulWidget {
  const LicenseWidget({super.key});

  @override
  State<LicenseWidget> createState() => _LicenseWidgetState();
}

class _LicenseWidgetState extends State<LicenseWidget> {
  late Future<List<LicenseEntry>> _licenses;

  @override
  void initState() {
    super.initState();
    _licenses = fetchLicenses();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.licenseTitle),
        actions: const [
          LanguageSwitcher(),
        ],
      ),
      body: FutureBuilder<List<LicenseEntry>>(
        future: _licenses,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('l10n.licenseError: ${snapshot.error}'));
          } else {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                final license = snapshot.data![index];
                return Card(
                  margin: const EdgeInsets.all(10),
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          license.packages.join(', '),
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          license.paragraphs.map((p) => p.text).join('\n'),
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}