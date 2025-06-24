#!/bin/bash

# Создание сертификатов для пользователей
echo "Создание пользователей и их сертификатов..."

# Пользователь 1: admin-user
openssl genrsa -out admin-user.key 2048
openssl req -new -key admin-user.key -out admin-user.csr -subj "/CN=admin-user/O=admin-group"
openssl x509 -req -in admin-user.csr -CA ~/.minikube/ca.crt -CAkey ~/.minikube/ca.key -CAcreateserial -out admin-user.crt -days 365

# Пользователь 2: viewer-user
openssl genrsa -out viewer-user.key 2048
openssl req -new -key viewer-user.key -out viewer-user.csr -subj "/CN=viewer-user/O=viewer-group"
openssl x509 -req -in viewer-user.csr -CA ~/.minikube/ca.crt -CAkey ~/.minikube/ca.key -CAcreateserial -out viewer-user.crt -days 365

# Пользователь 3: editor-user
openssl genrsa -out editor-user.key 2048
openssl req -new -key editor-user.key -out editor-user.csr -subj "/CN=editor-user/O=editor-group"
openssl x509 -req -in editor-user.csr -CA ~/.minikube/ca.crt -CAkey ~/.minikube/ca.key -CAcreateserial -out editor-user.crt -days 365

echo "Пользователи созданы:"
echo "- admin-user (admin-group)"
echo "- viewer-user (viewer-group)"
echo "- editor-user (editor-group)"