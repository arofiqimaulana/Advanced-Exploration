# Docker
Docker adalah sebuah project open source yang ditujukan untuk developer atau sysadmin untuk membangun, mengemas dan menjalankan aplikasi dimana pun di dalam sebuah container.

Melalui docker, diharapkan developer dapat mengembangkan aplikasi sesuai dengan spesifikasi server atau dengan kata lain, jika kita mengembangkan sebuah aplikasi lalu kita jalankan pada komputer kita sendiri maka secara otomatis aplikasi akan berjalan dengan baik, nah bagaimana jika server yang akan menjalankan aplikasi kita memiliki banyak perbedaan dengan komputer kita seperti perbedaan sistem operasi, arsitektur processor dan sebagainya. Dengan menggunakan virtualisasi ini maka para developer lebih mudah untuk mengatur mengenai deployment atau menjalankan aplikasi di server production.

## Term
1. Docker daemon <br>
berfungsi untuk membangun, mendistribusikan dan menjalankan container docker (via CLI).

2. Docker Images <br>
adalah sebuah template yang bersifat read only. Template ini sebenarnya adalah sebuah OS atau OS yang telah diinstall berbagai aplikasi. Docker images berfungsi untuk membuat docker container, dengan hanya 1 docker images kita dapat membuat banyak docker container.

3. Docker Container <br>
Docker container bisa dikatakan sebagai sebuah folder, dimana docker container ini dibuat dengan menggunakan docker daemon. Setiap docker container disimpan maka akan terbentuk layer baru tepat diatas docker images atau base image diatasnya. 

Kita dapat membuat banyak docker container dari 1 docker images. Docker container ini nantinya dapat dibuild sehingga akan menghasilkan sebuah docker images, dan docker images yang dihasilkan dari docker container ini dapat kita gunakan kembali untuk membuat docker container yang baru.

4. Docker Compose <br>
Docker-compose adalah sebuah alat dari docker yang digunakan untuk mendefinisikan dan menjalankan aplikasi multi kontainer. Dengan docker-compose kita bisa menjalankan kontainer 1 dengan yang lainya dengan 1 perintah . Docker-compose juga menggunakan yaml file untuk menyimpan konfigurasi dari service yang dibuat.

## Basic Command
* ```docker ps``` # melihat container yang lagi berjalan
* ```docker ps -a``` # melihat semua list container yang dimiliki
* ```docker image ls``` # melihat list image 
* ```docker container ls``` # melihat list container 

## Refference
1. https://rizkimufrizal.github.io/belajar-docker/
2. https://iqbalsyamilayas.medium.com/docker-compose-untuk-mempercepat-pengembangan-aplikasi-kontainer-ed8cf8f16bab#:~:text=Apa%20itu%20docker%2Dcompose,dan%20menjalankan%20aplikasi%20multi%20kontainer.&text=Docker%2Dcompose%20juga%20menggunakan%20yaml,konfigurasi%20dari%20service%20yang%20dibuat.