# Panduan Menggunakan Environment Khusus di Jupyter Notebook (MacOS)

## 1. Persyaratan
Pastikan sudah terinstall:
- Python 3.x
- pip
- Jupyter Notebook atau JupyterLab

Cek versi Python:
```bash
python3 --version
```

---

## 2. Membuat Virtual Environment
Buka **Terminal** dan pindah ke folder project:
```bash
cd /path/ke/folder/project
```

Buat environment bernama `myenv`:
```bash
python3 -m venv myenv
```
📌 **`python3 -m venv`** → perintah static  
📌 **`myenv`** → nama environment (bisa diganti)

---

## 3. Mengaktifkan Environment
Aktifkan environment:
```bash
source myenv/bin/activate
```
Jika berhasil, prompt terminal akan berubah menjadi:
```
(myenv) user@MacBook project-folder %
```

---

## 4. Instalasi Jupyter di Environment
Setelah environment aktif, install:
```bash
pip install jupyter ipykernel
```

---

## 5. Mendaftarkan Environment ke Jupyter
Jalankan:
```bash
python -m ipykernel install --user --name=myenv --display-name "Python (myenv)"
```
**Keterangan**:
| Bagian                    | Status     | Penjelasan |
|---------------------------|------------|------------|
| `python -m ipykernel install` | Static     | Perintah mendaftarkan kernel ke Jupyter |
| `--user`                  | Static     | Instalasi hanya untuk user saat ini |
| `--name=myenv`            | Parameter  | Nama internal kernel (bebas ganti, tanpa spasi) |
| `"Python (myenv)"`        | Parameter  | Nama kernel yang tampil di menu Jupyter |

Contoh custom:
```bash
python -m ipykernel install --user --name=bert-classifier --display-name "Python (BERT Classifier)"
```

---

## 6. Menjalankan Jupyter Notebook
Jalankan:
```bash
jupyter notebook
```
Lalu pada menu **Kernel** → **Change Kernel**, pilih:
```
Python (myenv)
```

---

## 7. Menonaktifkan Environment
Untuk keluar dari environment:
```bash
deactivate
```

---

## 8. Mengecek Python yang Digunakan
Di dalam notebook, jalankan:
```python
!which python
```
Hasilnya harus mengarah ke:
```
/path/ke/folder/project/myenv/bin/python
```
