# Devops projekt

## Eszközök
A kiválaszott 5 eszköz:
- Jenkins: CI,
- pm2: deploy
- Nginx: saját domain használata (itt a "sudo nano /etc/hosts" kóddal kell megadni a hostok közé, hogy "172.60.0.30     prime-number.test",
- Terraform: Futtatás,
- Prometheus: Monitorozás,
- Grafan: Monitorozás

## Futtatás
A kód kipróbálásához a run.sh nevű fájlt kell futtatni.
> ./run.sh
A háttérben fut a 8080 porton a JKenkins, ahol a CI pipeline megtalálható.

## Alap program, amihez elkészült ez a projekt
Az [alap program](https://github.com/medgyesizsombor/nodejs-for-devops), amit a projekthez csináltam, az annyit csinál, hogy megnézi, hogy az urlben kapott szám prím szám-e, vagy se.

Az alap programot a http://localhost:3000/isPrimeNumber?number=3.14 url-lel lehet próbálni. A számot át lehet írni bármire, le van kezelve.

## Felhasználónév és Jelszó
|Eszköz|Felhasználónév|Jelszó|
|----------------|-------------------------------|-----------------------------|
|Grafan|admin|zsombi|
|Jenkins|zsombi|zsombi|

## Elérési pontok
|Eszköz|Url|Mi található itt|
|-|-|-|
|Grafan|localhost:4000|Kirajzolt monitorozások|
|Prometheus|localhost:9090|Kirajzolt monitorozások|
|Jenkins|localhost:8080|CI pipeline|
|A NodeJS projekt|localhost:3000, isPrimeNumber|A program|

## Author
[Medgyesi Zsombor](https://github.com/medgyesizsombor)
