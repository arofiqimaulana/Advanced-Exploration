
# MongoDB - Panduan Umum

## Pendahuluan
MongoDB adalah database NoSQL yang berorientasi pada dokumen, dirancang untuk skalabilitas, fleksibilitas, dan ketersediaan tinggi. Alih-alih menggunakan tabel dan baris seperti di database relasional, MongoDB menyimpan data dalam bentuk dokumen yang mirip JSON, sehingga lebih mudah untuk menyimpan dan mengelola data yang tidak terstruktur.

## Daftar Isi
- [Fitur Utama](#fitur-utama)
- [Konsep Dasar](#konsep-dasar)
- [Instalasi](#instalasi)
- [Perintah Dasar](#perintah-dasar)
- [Operasi CRUD](#operasi-crud)
  - [Membuat Data](#membuat-data)
  - [Membaca Data](#membaca-data)
  - [Memperbarui Data](#memperbarui-data)
  - [Menghapus Data](#menghapus-data)
- [Indexing](#indexing)
- [Replikasi](#replikasi)
- [Sharding](#sharding)
- [Aggregation Framework](#aggregation-framework)
- [Kasus Penggunaan](#kasus-penggunaan)
- [Sumber Daya](#sumber-daya)

---

## Fitur Utama

- **NoSQL**: MongoDB adalah database non-relasional yang menyimpan data dalam dokumen fleksibel berbasis JSON.
- **Tanpa Skema**: Mendukung desain skema dinamis, sehingga kolom (field) bisa berbeda antar dokumen.
- **Skalabilitas**: Mendukung scaling horizontal melalui **sharding**.
- **Ketersediaan Tinggi**: Replikasi bawaan untuk failover otomatis dan redundansi data.
- **Bahasa Query yang Kaya**: Mendukung query yang kompleks dan indexing.

---

## Konsep Dasar

### 1. **Dokumen**:
   Dokumen adalah unit dasar data di MongoDB, mirip dengan baris dalam database relasional. Dokumen disimpan dalam format BSON (Binary JSON) dan dapat berisi pasangan key-value, array, dan dokumen bersarang.

   Contoh dokumen:
   ```json
   {
     "_id": 1,
     "nama": "Alice",
     "usia": 29,
     "alamat": { "kota": "Jakarta", "kode_pos": "12345" }
   }
   ```

### 2. **Koleksi**:
   Koleksi adalah kumpulan dokumen, mirip dengan tabel dalam database relasional. Koleksi di MongoDB tidak memiliki skema, artinya dokumen dalam satu koleksi bisa memiliki struktur yang berbeda.

### 3. **Database**:
   Database di MongoDB adalah kumpulan koleksi. Setiap database menyimpan koleksinya secara independen.

### 4. **_id**:
   Setiap dokumen memiliki field `_id` yang unik, berfungsi sebagai primary key. MongoDB akan secara otomatis menghasilkan **ObjectId** jika `_id` tidak disediakan.

---

## Instalasi

MongoDB dapat diinstal secara lokal atau digunakan sebagai layanan berbasis cloud melalui **MongoDB Atlas**.

### Instalasi Lokal
Untuk menginstal MongoDB di komputer Anda:

1. **Linux / macOS**:
   Ikuti panduan instalasi resmi [di sini](https://docs.mongodb.com/manual/administration/install-on-linux/).

2. **Windows**:
   Unduh MongoDB untuk Windows [di sini](https://docs.mongodb.com/manual/tutorial/install-mongodb-on-windows/).

3. **Docker**:
   Jalankan MongoDB sebagai container Docker:

   ```bash
   docker run --name mongodb -d -p 27017:27017 mongo
   ```

### MongoDB Atlas (Cloud)
MongoDB Atlas adalah layanan cloud dari MongoDB yang memungkinkan Anda membuat, mengelola, dan menggunakan MongoDB dalam infrastruktur cloud. Daftar di [MongoDB Atlas](https://www.mongodb.com/cloud/atlas).

---

## Perintah Dasar

Setelah MongoDB diinstal dan berjalan, Anda bisa berinteraksi dengan MongoDB menggunakan Mongo shell (`mongosh`):

- **Memulai Mongo Shell**:
  ```bash
  mongosh
  ```

- **Menampilkan Database**:
  ```bash
  show dbs
  ```

- **Membuat/Menggunakan Database**:
  ```bash
  use myDatabase
  ```

- **Menampilkan Koleksi**:
  ```bash
  show collections
  ```

- **Menyisipkan Dokumen**:
  ```bash
  db.myCollection.insertOne({ name: "John", age: 30 })
  ```

- **Membaca Dokumen**:
  ```bash
  db.myCollection.find({ age: { $gt: 25 } })
  ```

---

## Operasi CRUD

### Membuat Data
Menyisipkan dokumen baru ke dalam koleksi menggunakan `insertOne()` untuk satu dokumen atau `insertMany()` untuk banyak dokumen.

```js
db.users.insertOne({ name: "Alice", age: 30, city: "Jakarta" });
db.users.insertMany([{ name: "Bob" }, { name: "Charlie", age: 25 }]);
```

### Membaca Data
Query dokumen menggunakan `find()` atau `findOne()`.

```js
db.users.find({ age: { $gt: 25 } });
db.users.findOne({ name: "Alice" });
```

### Memperbarui Data
Memperbarui dokumen menggunakan `updateOne()`, `updateMany()`, atau `replaceOne()`.

```js
db.users.updateOne({ name: "Alice" }, { $set: { city: "Bandung" } });
```

### Menghapus Data
Menghapus dokumen menggunakan `deleteOne()` atau `deleteMany()`.

```js
db.users.deleteOne({ name: "Charlie" });
```

---

## Indexing

Index sangat penting untuk mengoptimalkan performa query. MongoDB memungkinkan Anda membuat index di field yang sering digunakan dalam query.

- **Membuat Index**:
  ```js
  db.users.createIndex({ age: 1 });
  ```

- **Melihat Index**:
  ```js
  db.users.getIndexes();
  ```

---

## Replikasi

Replikasi memastikan redundansi data dan ketersediaan tinggi. MongoDB menggunakan **Replica Set** untuk mereplikasi data di beberapa server, menyediakan failover otomatis jika server utama gagal.

- **Replica Set** terdiri dari:
  - **Primary**: Menangani semua operasi penulisan.
  - **Secondaries**: Menduplikasi data dari primary dan bisa dipromosikan menjadi primary saat terjadi failover.

---

## Sharding

Sharding adalah metode scaling horizontal di MongoDB. Sharding membagi dataset besar ke beberapa mesin, memastikan database bisa bertumbuh seiring aplikasi Anda.

Sharding melibatkan:
- **Shards**: Menyimpan bagian data.
- **Config Servers**: Menyimpan metadata.
- **Mongos Router**: Mendistribusikan query ke shard yang sesuai.

---

## Aggregation Framework

Aggregation Framework di MongoDB memungkinkan Anda memproses data dan melakukan transformasi dan perhitungan kompleks, mirip dengan operasi `GROUP BY` di SQL.

- **Contoh Aggregation**:
  ```js
  db.sales.aggregate([
    { $match: { status: "A" } },
    { $group: { _id: "$item", total: { $sum: "$amount" } } }
  ]);
  ```

---

## Kasus Penggunaan

MongoDB digunakan dalam berbagai aplikasi di dunia nyata, seperti:
- **Content Management Systems (CMS)**: Untuk menyimpan data dinamis dan fleksibel.
- **Internet of Things (IoT)**: Mengelola data dari banyak perangkat.
- **E-commerce**: Menangani katalog produk, keranjang belanja, dan profil pengguna.
- **Aplikasi Big Data**: Skalabilitas MongoDB membuatnya cocok untuk dataset besar.

---

## Sumber Daya

- [Dokumentasi Resmi MongoDB](https://docs.mongodb.com/)
- [MongoDB University](https://university.mongodb.com/)
- [MongoDB Atlas](https://www.mongodb.com/cloud/atlas)

MongoDB adalah database yang fleksibel dan skalabel, cocok untuk berbagai kebutuhan penyimpanan data, mulai dari aplikasi kecil hingga sistem terdistribusi berskala besar.
