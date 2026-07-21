# Mythopedia — Flutter APK

## Build & Install (WAJIB setelah edit code)

Setelah mengedit apapun, SELALU build + install langsung:

```
cd D:/mythopedia
_JAVA_OPTIONS="-Djava.io.tmpdir=C:\Users\KEVIN\AppData\Local\Temp" flutter build apk --debug
```

Install ke HP (pastikan HP terhubung via USB):

```
C:\Users\KEVIN\AppData\Local\Android\sdk\platform-tools\adb.exe install -r D:\mythopedia\build\app\outputs\flutter-apk\app-debug.apk
```

Force stop sebelum install kalau app crash:

```
C:\Users\KEVIN\AppData\Local\Android\sdk\platform-tools\adb.exe shell am force-stop com.example.mythopedia
```

## Workflow

1. Edit file Dart di `D:\mythopedia\lib\`
2. Build APK debug
3. Install ke HP via ADB
4. Kabari hasilnya

JANGAN hanya edit tanpa build+install. User maunya langsung jalan di HP.

## Project Info

- Flutter project, package: `com.example.mythopedia`
- JDK: `D:\develop-flutter\android studio\jbr`
- ADB: `C:\Users\KEVIN\AppData\Local\Android\sdk\platform-tools\adb.exe`
- 6 mitologi, 327 gods, 58 stories, 49 pop culture
- Auth: Firebase (Google Sign-In)
- Bahasa: ID, EN, ZH, JA
- Top padding konsisten: 18px semua screen
