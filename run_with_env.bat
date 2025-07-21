@echo off
REM Script build Flutter + inject .env ke AndroidManifest.xml

dart tools\inject_gmaps_key.dart
if %errorlevel% neq 0 exit /b %errorlevel%
flutter run %*
