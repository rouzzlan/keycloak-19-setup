```text
db-url-host=jdbc:mysql://192.168.2.21:3306/keycloak_dev_db_1
db-username=keycloak_dev_db_1
db-password=change_me
hostname=keycloak-dev-1.localdomain
```

```shell
bin/kc.sh start --auto-build --db mysql --db-url jdbc:mysql://192.168.2.21:3306/keycloak_dev_db_1 --db-username test_user --db-password 'rte.uY694a8bNrW-MQ_mBz' --hostname keycloak-dev-1
```
install openjdk
```shell
sudo dnf install java-11-openjdk -y
```
firewall
```shell
sudo firewall-cmd --zone=public --permanent --add-port 8080/tcp
sudo firewall-cmd --zone=public --permanent --add-port 8443/tcp
sudo firewall-cmd --reload
```

`/etc/hosts` configuration
```text
192.168.110.138	keycloak-dev-1.localdomain
```
start in dev mode
```shell
sh kc.sh start-dev
```
url
```text
http://keycloak-dev-1.localdomain:8080/
```

TLS SSL
```shell
openssl req -x509 -newkey rsa:4096 -days 10000 -keyout ca-key.pem -out ca-cert.pem -nodes
```
Sample input
```text
[rouslan@keycloak-1 certs]$ openssl req -x509 -newkey rsa:4096 -days 10000 -keyout ca-key.pem -out ca-cert.pem -nodes
Generating a RSA private key
...........................................++++
........................................................................................................................++++
writing new private key to 'ca-key.pem'
-----
You are about to be asked to enter information that will be incorporated
into your certificate request.
What you are about to enter is what is called a Distinguished Name or a DN.
There are quite a few fields but you can leave some blank
For some fields there will be a default value,
If you enter '.', the field will be left blank.
-----
Country Name (2 letter code) [XX]:BE
State or Province Name (full name) []:Antwerp
Locality Name (eg, city) [Default City]:Emblem
Organization Name (eg, company) [Default Company Ltd]:Test
Organizational Unit Name (eg, section) []:
Common Name (eg, your name or your server's hostname) []:keycloak-dev-1.localdomain
Email Address []:rouslan_kh@hotmail.com
```

with key files
```shell
sh kc.sh start --auto-build --db mysql --db-url jdbc:mysql://192.168.2.21:3306/keycloak_dev_db_1 --db-username test_user --db-password 'rte.uY694a8bNrW-MQ_mBz' --hostname keycloak-dev-1 --https-certificate-file /home/rouslan/keycloak-18.0.2/bin/certs/ca-cert.pem --https-certificate-key-file /home/rouslan/keycloak-18.0.2/bin/certs/ca-key.pem

```

## setup with 

```shell
sh bin/kc.sh build --db=mysql
```

## Create service
```sh
sudo vim /etc/systemd/system/keycloak.service
```
add content
```shell
[Unit]
Description=Keycloak Service
After=syslog.target network.target mysql.service
StartLimitIntervalSec=5

[Service]
User=root
ExecStart=/opt/keycloak/launch-keycloak.sh

[Install]
WantedBy=multi-user.target
```

## Website
[https://192.168.110.138:8443/](https://192.168.110.138:8443/)