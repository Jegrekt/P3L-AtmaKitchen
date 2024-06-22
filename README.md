# ! INSTALASI !

## General
1. Buat Database Baru terlebih dahulu pada PhpMyAdmin.
2. Import database "p3l-atmakitchenupdate.sql" ke dalam Database yang telah dibuat.

## Atma_Kitchen_FrontEnd
1. npm install
2. npm run dev

## Atma_Kitchen_BackEnd
1. composer install
2. php artisan storage:link

## Atma_Kitchen_App (Mobile)
**Install Flutter terlebih dahulu apabila belum melakukan instalasi**
1. flutter pub get

### Tambahan
Dikarenakan program di-run dari local, maka kita perlu mengkonfigurasi IP yang berbeda apabila berpindah tempat. Untuk menjalankan program, modifikasi code pada bagian:

_**Atma_Kitchen_FrontEnd**_
- src/api/index.jsx
- src/api/utils/Constants.js

_**Atma_Kitchen_App**_
- lib/variables.dart

Menjadi IPv4 Address yang dimiliki device.

_**Dan untuk menjalankan BackEnd, maka menggunakan:**_
- php artisan serve --host ...(IPv4 Address)

### List Akun yang dapat digunakan:
- Admin

Email: tono.anto@gmail.com

Password: supersecretpassword

- MO

Email: elicooper@gmail.com

Password: supersecretpassword1

- Owner

Email: miniTrans@gmail.com

Password: supersecretpassword

- Salah Satu Akun Customer:

Email: ivy@gmail.com

Password: ivy123
