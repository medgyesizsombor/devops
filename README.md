# Devops projekt

## Eszközök
A kiválaszott 6 eszköz:
- Jenkins: CI,
- pm2: deploy
- Nginx: saját domain használata (itt a "sudo nano /etc/hosts" kóddal kell megadni a hostok közé, hogy "172.60.0.30     prime-number.test",
- Terraform: Futtatás,
- Prometheus: Monitorozás (Nem mentette el magát, a terraform destroy után, így ez csak megjelenik, de teljesen üres),
- Grafan: Monitorozás (Nem mentette el magát, a terraform destroy után, így ez csak megjelenik, de teljesen üres a dashboard)

## Futtatás
A kód kipróbálásához a run.sh nevű fájlt kell futtatni.
> ./run.sh
A háttérben futtatja a 8080 porton a Jenkins, ahol a CI pipeline megtalálható.
Terraformmal indítja a deployt, és a monitorozásokat. 

## Alap program, amihez elkészült ez a projekt
Az [alap program](https://github.com/medgyesizsombor/nodejs-for-devops), amit a projekthez csináltam, az annyit csinál, hogy megnézi, hogy az urlben kapott szám prím szám-e, vagy se.

Az alap programot a http://localhost:3000/isPrimeNumber?number=3.14 url-lel lehet próbálni. A számot át lehet írni bármire, le van kezelve.

## Felhasználónév és Jelszó
|Eszköz|Felhasználónév|Jelszó|
|----------------|-------------------------------|-----------------------------|
|Grafan|admin|admin|
|Jenkins|zsombi|zsombi|

## Elérési pontok
|Eszköz|Url|Mi található itt|
|-|-|-|
|Grafan|localhost:4000|Kirajzolt monitorozások (nem található meg az elmentett dashboard)|
|Prometheus|localhost:9090|Kirajzolt monitorozások (nem található meg az elmentett dashboard)|
|Jenkins|localhost:8080|CI pipeline|
|A NodeJS projekt|localhost:3000, isPrimeNumber|A program|

## Hibák
Ahogy írtam coospacen is, a Grafana nem menti el a felhasználót, ha használom a destroyt a terraformnál, így hiába írtam át a jelszót, csináltam meg a grafikonokat, mentettem el 3 dashboardot, nem látszódik semmi, ahogyan a prometheusnál sem.
Így a toolokból csak 4 van használva jól, az nginx, a Jenkins, a pm2, és a terraform.

## Author
[Medgyesi Zsombor](https://github.com/medgyesizsombor)
