# 💬 Tanya Gilang Aja | UTS Pemrograman Mobile 2

**Oleh:** Gilangp2005 
**Mata Kuliah:** Pemrograman Mobile 2
**Dosen:** Andri Nugraha Ramdhon S.Kom., M.Kom.
**Institusi:** Universitas Teknologi Bandung (UTB)

---

## 🎯 Tujuan Proyek

Proyek ini dibuat untuk memenuhi Ujian Tengah Semester (UTS) mata kuliah Pemrograman Mobile 2. Fokus utama dari penilaian proyek ini adalah pada **Layouting Aplikasi (Widget)** dan implementasi **State Management Sederhana**.

## 🛠️ Fitur Teknis Utama

Aplikasi ini adalah simulator antarmuka Asisten Chat (Chat UI) yang dibangun menggunakan **Framework Flutter** dan bahasa **Dart**.

* **Fokus Layouting (Bobot Nilai Tertinggi):**
    * Penggunaan `Column` dan `Expanded` untuk struktur vertikal utama.
    * Penggunaan `ListView.builder` dengan properti `reverse: true` untuk menampilkan daftar pesan yang dapat digulir.
    * Desain *Message Bubble* yang dinamis (posisi kanan untuk pengguna dan kiri untuk asisten) menggunakan `Row`, `Align`, dan `BorderRadius` asimetris.
    * Penerapan *styling* minimalis (skema warna lembut dan `AppBar` yang bersih).

* **Penerapan State Management (Penyempurna Nilai):**
    * Menggunakan **Provider** (`ChangeNotifierProvider`) untuk mengelola *state* aplikasi (`List<Message>`).
    * Perubahan *state* terjadi ketika pesan baru dikirim dan ketika respons simulasi (menggunakan `Future.delayed`) ditambahkan ke dalam daftar.

* **Fitur Kompleks:** Fitur integrasi data eksternal (API) dan *logic* kompleks **diabaikan** sesuai instruksi soal UTS.

---

## ⬇️ Tautan Pengumpulan

Berikut adalah tautan untuk melihat hasil *running* aplikasi:



*(Kode sumber aplikasi yang Anda lihat ini adalah Link Source Code-nya)*
