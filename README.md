# SIG Pemetaan Pedagang Kopi Temanggung

Aplikasi Flutter Sistem Informasi Geografis (SIG) untuk pemetaan pedagang kopi di wilayah Temanggung.

## Fitur Utama

- Peta utama dengan Google Maps & marker toko kopi (data dummy)
- Detail toko (nama, alamat, foto, jam buka, kontak, rating, komentar)
- Tracing rute tercepat (Google Directions API)
- Rating & komentar pengguna (mock backend)
- UI clean & modern (putih, biru, abu-abu, font Inter/Roboto)
- Navigasi dengan go_router
- State management dengan provider

## Struktur Folder

- `models/` — Model data
- `screens/` — Tampilan utama & detail
- `services/` — Data & API
- `widgets/` — Komponen UI
- `providers/` — State management

## Dummy Data

Lihat `lib/services/dummy_coffee_shops.json`

## Fonts

Sudah tersedia font Inter & Roboto di `assets/fonts/`.

## Dependensi Utama

- google_maps_flutter
- go_router
- provider
- flutter_rating_bar
- http

## Cara Menjalankan

1. Pastikan Flutter SDK terinstal
2. Jalankan `flutter pub get`
3. Jalankan aplikasi: `flutter run`

---

> Ganti API key Google Maps & Directions pada file konfigurasi sebelum produksi.
