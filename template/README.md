# Template & Panduan Laporan KP (Referensi)

Folder ini berisi **salinan tidak diubah** dari initial commit repositori:

- **Commit:** `975a3d1` — *First version*
- **Sumber:** template resmi Laporan KP Program Studi STI ITB (KP.cls, berkas `.tex`, contoh isi, dan PDF hasil render)

## Tujuan

Gunakan folder ini sebagai **referensi tetap** saat menulis atau menyunting laporan di root proyek (`../`):

1. Baca **panduan/teks placeholder** di setiap berkas `.tex` sebelum mengisi section baru.
2. Bandingkan struktur, gaya penulisan, dan format dengan versi template.
3. Lihat **`Laporan_KP.pdf`** atau **`Pedoman Visual Studio Code.pdf`** untuk contoh tampilan akhir.

## Aturan

- **Jangan mengedit** berkas di folder `template/` — ini arsip referensi.
- Semua pekerjaan laporan dilakukan pada berkas `.tex` di **root** proyek (sejajar dengan folder ini).
- Jika template resmi diperbarui, salin ulang dari commit awal atau commit template terbaru ke folder ini.

## Daftar berkas penting

| Berkas | Isi panduan |
|--------|-------------|
| `Bab I - Pendahuluan.tex` | Latar belakang, tempat/waktu, ruang lingkup, sistematika |
| `Bab II - Organisasi dan Lingkungan.tex` | Profil, struktur organisasi, unit kerja, lingkungan kerja |
| `Bab III - Pekerjaan.tex` | Deskripsi pekerjaan, contoh referensi/gambar/tabel/kode |
| `Bab IV - Penutup.tex` | Ringkasan, pengalaman, saran |
| `04 Abstrak.tex` | Format extended abstrak (satu paragraf, kata kunci) |
| `Laporan_KP.tex` | Urutan kompilasi (XeLaTeX + Biber) |

## Kompilasi (hanya jika perlu render ulang referensi)

```powershell
cd template
xelatex -interaction=nonstopmode Laporan_KP.tex
biber Laporan_KP
xelatex -interaction=nonstopmode Laporan_KP.tex
xelatex -interaction=nonstopmode Laporan_KP.tex
```
