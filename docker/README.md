Modul 300 - Docker DE
=============================

Definition Docker
------------------
Docker ist eine Virtualiserung ohne Virtualisierung. Docker ist eine Container Technologie. Ein Container fasst eine einzelne Anwendung mitsamt aller Abhängigkeiten wie Bibliotheken, Hilfsprogrammen und statischer Daten in einer Image-Datei zusammen, ohne aber ein komplettes Betriebssystem zu beinhalten. Daher lassen sich Container mit einer leichtgewichtigen Virtualisierung vergleichen.

### Installation Docker
#### Aufsetzen repository
Führe die folgende Schritte aus, um Docker zu installieren:
1. Apt Package Index updaten:
```sh
sudo apt-get update
```
2. Installiere die Pakete, welche erlauben Repositorys über HTTPS zu verwenden:
```sh
sudo apt-get install \
    apt-transport-https \
    ca-certificates \
    curl \
    software-properties-common
```
3. Füge Docker's offizieller GPG Key hinzu:
```sh
$ curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
```
Überprüfe, ob du den Key  mit dem Fingerprint 9DC8 5822 9FC7 DD38 854A E2D8 8D81 803C 0EBF CD88 hast
```sh
sudo apt-key fingerprint 0EBFCD88

pub   4096R/0EBFCD88 2017-02-22
      Key fingerprint = 9DC8 5822 9FC7 DD38 854A  E2D8 8D81 803C 0EBF CD88
uid                  Docker Release (CE deb) <docker@docker.com>
sub   4096R/F273FCD8 2017-02-22
```
4. Erstelle ein Repository mit:
```sh
sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"
```
#### Installation Docker
1. Installiere Docker wie folgt:
```sh
sudo apt-get update
sudo apt-get install docker-ce
```
2. Überprüfe die Docker Installation mit:
```sh
sudo docker run hello-world
```

### Dockerfile und Start Container
1. Erstelle das Dockerfile im Verzeichnis
2. Erstelle ein Image mit dem Dockerfile, starte und überprüfe es
```sh
docker build -t apache2

docker run --rm -d --name apache2 apache2

docker exec -t mysql bash
```
3. Zeige den aktiven Container an
```sh
docker ps
```
## Webserver Testen
Um sicher zu sein dass der Apache Server aktiv ist, habe ich folgendes gemacht:
1. Browser öffnen
2. IP eingeben ( 172.17.0.2)
Ausgabe: Default Apache2 Seite 

## Firewall Regeln nachschauen
```sh
docker-machine ip default

curl http://172.17.0.2:8080
```
## Monitoring
Über CMD:
```sh
docker stats
```
Mit Cadvisor:
Starte Cadvisor mit:
```sh
sudo docker run \
  --volume=/:/rootfs:ro \
  --volume=/var/run:/var/run:rw \
  --volume=/sys:/sys:ro \
  --volume=/var/lib/docker/:/var/lib/docker:ro \
  --volume=/dev/disk/:/dev/disk:ro \
  --publish=8080:8080 \
  --detach=true \
  --name=cadvisor \
  google/cadvisor:latest
```
Im Browser: localhost:8080/containers/

## RAM Begrenzung
Die maximale RAM kann man mit folgendem Befehl festgelegt werden:
```sh
docker run -m 2096m --memory-swap 2096m
```

### Docker User erstellen
Erstelle ein User mit dem folgendem Befehl:
```sh
RUN groupadd -r User_Group && useradd -r -g User_group athikatesting
```
Mit diesem Befehl loggt man sich ein:
```sh
docker run -ti name:Version /bin/bash
su athikatesting
```
# Eigener Container erstellen
1. Vagrant File zu Dockerfile umwandeln
2. Im verzeichnis gehen, wo das Dockerfile ist
3. Dockerfile builden: 
```sh
docker build -t athika .
```
4. Dockerfile starten mit:
```sh
docker run --rm -d --name athika athika
```
5. Funktionsfähigkeit überprüfen:
```sh
docker exec -it athika bash
```
und im Container
```sh
ps -ef
netstat -tulpen
```

