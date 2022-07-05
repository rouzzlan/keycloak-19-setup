#!/bin/bash

export KEYCLOAK_ADMIN=rouslan
export KEYCLOAK_ADMIN_PASSWORD='50m9FiD3'
export KC_HOSTNAME='keycloak-dev-1.localdomain'
export KC_HTTPS_CERTIFICATE_KEY_FILE=/home/rouslan/keycloak-18.0.2/bin/certs/ca-key.pem
export KC_HTTPS_CERTIFICATE_FILE=/home/rouslan/keycloak-18.0.2/bin/certs/ca-cert.pem
export KC_DB_PASSWORD='rte.uY694a8bNrW-MQ_mBz'
export KC_DB_URL='jdbc:mysql://192.168.2.21:3306/keycloak_dev_db_1'
export KC_DB_USERNAME=test_user
export KC_DB=mysql

sh kc.sh start