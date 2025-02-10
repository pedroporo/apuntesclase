---
dg-publish: true
---

[Pagina de github de los apuntes](https://github.com/cipfpbatoi/dwes2324)

```
php artisan route:list
```
```
php artisan make:resource JugadoraResource
php artisan make:component Pacient
php artisan make:model Pacient
php artisan make:seeder ZoneSeeder

php artisan make:factory ZoneFactory -m Zone

php artisan make:migration add_role_to_users_table --table=users
php artisan make:middleware RoleMiddleware
php artisan make:policy PatientPolicy --model=Patient
php artisan make:request PatientRequest
php artisan make:resource PatientResource


php artisan make:controller Api/JugadoraController --api --model=Jugadora

```
Ejecutar los comandos de db `php artisan migrate:fresh --seed`


