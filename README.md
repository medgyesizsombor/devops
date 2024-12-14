# Devops projekt

## Eszközök
A kiválaszott 5 eszköz:
- Jenkins: CI,
- pm2: deploy
- Nginx: saját domain használata,
- Terraform: Futtatás,
- Prometheus: Monitorozás,
- Grafan: Monitorozás

## Futtatás
A kód kipróbálásához a run.sh nevű fájlt kell futtatni.
> ./run.sh

## Alap program, amihez elkészült ez a projekt
Az [alap program](https://github.com/medgyesizsombor/nodejs-for-devops), amit a projekthez csináltam, az annyit csinál, hogy megnézi, hogy az urlben kapott szám prím szám-e, vagy se.

> localhost:3000/isPrimeNumber?number=3


## Felhasználónév és Jelszó
|Eszköz|Felhasználónév|Jelszó|
|----------------|-------------------------------|-----------------------------|
|Grafan|admin|admin|
|Jenkins|zsombi|zsombi|

## Elérési pontok
|Eszköz|Url|
|----------------|-------------------------------|
|Grafan|localhost:4000|
|Prometheus|localhost:9090|
|Jenkins|localhost:8080|
|A NodeJS projekt|localhost:3000, isPrimeNumber|

## Author
[Medgyesi Zsombor](https://github.com/medgyesizsombor)
