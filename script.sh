#!/usr/bin/env bash

# Запуск окружения
docker run --name centos7 --rm -d centos:7 sleep 900000000
docker run --name ubuntu --rm -d ubuntu sleep 900000000
docker run --name fedora --rm -d pycontribs/fedora sleep 900000000

# Запуск ansible
# ansible-playbook site.yml -i inventory/prod.yml --ask-vault-password
ansible-playbook site.yml -i inventory/prod.yml --vault-password-file .vaults/prod.pass

# Очистка окружения. Контейнеры удалятся автоматом, т.к. запуск с ключом --rm
docker stop centos7
docker stop ubuntu
docker stop fedora