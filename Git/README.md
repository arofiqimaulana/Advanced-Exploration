# GIT

## Source Control
terdapat dua options
1. Centralized (need internet connection)
2. Decentralized/Distributed (doesnt need internet connection)

## Terminology
1. Repository (contains files,history,config managed by Git)
2. Working Directory 
3. Staging Area (ruang tunggu ketika akan membuat perubahan)
4. fork digunakan untuk melakukan duplicate repository ke akun lain
5. .gitignore adalah fasilitas dari git yang memungkinkan mengabaikan file yang tidak kita inginkan untuk di tambahkan ke repository

## Perintah Basic
1. git add . #menambahkan semua file
2. git add file1.csv #menambahkan file tertentu yaitu file1.csv
3. git commit -m "add file csv" #memberi catatan perubahan
4. git push origin #update perubahan yang terjadi di local ke repository
5. git pull origin master #update perubahan file yang terjadi di repositry ke local

## Perintah Advanced
1. git rm file1.csv #menghapus file.csv
2. git add -u #menghapus beberapa file secara sekaligus
3. git clone http://www.something #clone repository ke local computer
4. git reset HEAD file1.csv #membatalkan perubahan sebelumnya
5. git checkout -- file1.csv #discard changes
6. git mv file1.csv file.csv #mengubah nama file
7. git add -A #Melakukan penambahan file baru sekaligus semua perubahan karena rename,move,delete
8. git mv file.csv NewFolder #Memindahkan file.csv ke Folder NewFolder
9. git help log #Commit History
10. git config --global alias.hist "log --all --graph --decorate --oneline" #git alias, editing ada di file .gitconfig






