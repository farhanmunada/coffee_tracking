import 'dart:io';

void main() async {
  final envFile = File('.env');
  if (!envFile.existsSync()) {
    print('File .env tidak ditemukan!');
    exit(1);
  }
  final env = Map.fromEntries(
    envFile.readAsLinesSync().where((l) => l.contains('=')).map((l) {
      final parts = l.split('=');
      return MapEntry(parts[0].trim(), parts[1].trim());
    }),
  );
  final apiKey = env['GOOGLE_MAPS_API_KEY'];
  if (apiKey == null || apiKey.isEmpty) {
    print('GOOGLE_MAPS_API_KEY tidak ditemukan di .env!');
    exit(1);
  }

  final manifestPath = 'android/app/src/main/AndroidManifest.xml';
  final manifestFile = File(manifestPath);
  if (!manifestFile.existsSync()) {
    print('AndroidManifest.xml tidak ditemukan!');
    exit(1);
  }
  var manifest = manifestFile.readAsStringSync();

  // Hapus baris lama jika ada
  manifest = manifest.replaceAll(
    RegExp(
      r'<meta-data\s+android:name="com.google.android.geo.API_KEY"[\s\S]*?/>',
    ),
    '',
  );

  // Sisipkan API key setelah <application ...>
  manifest = manifest.replaceFirstMapped(
    RegExp(r'(<application[\s\S]*?>)'),
    (Match m) =>
        '${m.group(1)}\n        <meta-data android:name="com.google.android.geo.API_KEY" android:value="$apiKey" />',
  );

  manifestFile.writeAsStringSync(manifest);
  print('API Key Google Maps berhasil diinject ke AndroidManifest.xml!');
}
