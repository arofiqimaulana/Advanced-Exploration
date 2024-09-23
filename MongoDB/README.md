# MongoDB

## Pendahuluan
MongoDB adalah database NoSQL yang berorientasi pada dokumen, dirancang untuk skalabilitas, fleksibilitas, dan ketersediaan tinggi. Alih-alih menggunakan tabel dan baris seperti di database relasional, MongoDB menyimpan data dalam bentuk dokumen yang mirip JSON, sehingga lebih mudah untuk menyimpan dan mengelola data yang tidak terstruktur.

## Daftar Isi
- [Fitur Utama](#fitur-utama)
- [Konsep Dasar](#konsep-dasar)
---

## Fitur Utama

- **NoSQL**: MongoDB adalah database non-relasional yang menyimpan data dalam dokumen fleksibel berbasis JSON.
- **Tanpa Skema**: Mendukung desain skema dinamis, sehingga kolom (field) bisa berbeda antar dokumen.
- **Skalabilitas**: Mendukung scaling horizontal melalui **sharding**.
- **Ketersediaan Tinggi**: Replikasi bawaan untuk failover otomatis dan redundansi data.
- **Bahasa Query yang Kaya**: Mendukung query yang kompleks dan indexing.

---

## Konsep Dasar

   Dokumen adalah unit dasar data di MongoDB, mirip dengan baris dalam database relasional. Dokumen disimpan dalam format BSON (Binary JSON) dan dapat berisi pasangan key-value, array, dan dokumen bersarang.

   Contoh dokumen:
   ```json
   {
     "_id": 1,
     "nama": "Alice",
     "usia": 29,
     "alamat": { "kota": "Jakarta", "kode_pos": "12345" }
   }

2. Koleksi:
Koleksi adalah kumpulan dokumen, mirip dengan tabel dalam database relasional. Koleksi di MongoDB tidak memiliki skema, artinya dokumen dalam satu koleksi bisa memiliki struktur yang berbeda.

3. Database:
Database di MongoDB adalah kumpulan koleksi. Setiap database menyimpan koleksinya secara independen.

4. _id:
Setiap dokumen memiliki field _id yang unik, berfungsi sebagai primary key. MongoDB akan secara otomatis menghasilkan ObjectId jika _id tidak disediakan.

