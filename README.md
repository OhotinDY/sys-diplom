# Дипломная работа по профессии «Системный администратор»

Скачиваем terraform из зеркала YandexCloud https://cloud.yandex.ru/docs/tutorials/infrastructure-management/terraform-quickstart#get-credentials

```
wget https://hashicorp-releases.yandexcloud.net/terraform/1.6.1/terraform_1.6.1_linux_amd64.zip
```

Распаковываем zip архив

```
unzip terraform_1.6.1_linux_amd64.zip
```

Даем разрешение на запуск файла terraform

```
chmod 766 terraform
```

Копируем файл terraform в папку запуска

```
cp terraform /usr/local/bin/
```

Проверка работоспособности и версии

```
terraform -v
```

Создаем файл конфигурации и дадим ему права

```
nano ~/.terraformrc
chmod 644 .terraformrc
```

```
provider_installation {
  network_mirror {
    url = "https://terraform-mirror.yandexcloud.net/"
    include = ["registry.terraform.io/*/*"]
  }
  direct {
    exclude = ["registry.terraform.io/*/*"]
  }
}
```

В папке, в которой хотим запустить terraform создаем файл `main.tf` с содержимым

```
terraform {
  required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
    }
  }
  required_version = ">= 0.13"
}

provider "yandex" {
  zone = "<зона доступности по умолчанию>"
}
```

Инициализируем terraform в папке ody@home:~/diplom$

```
terraform init
```

---

Создаем 2 одинаковые виртуальные машины

[Создание файла main.tf](https://github.com/OhotinDY/sys-diplom/blob/main/terraform/main.tf) - описание облака, описание доступа и токена

[Создание файла webservers.tf](https://github.com/OhotinDY/sys-diplom/blob/main/terraform/webservers.tf) - создание VM1 и VM2

Создаем машины для elastic, bastion, kibana, zabbix

[Создание файла elasticsearch.tf](https://github.com/OhotinDY/sys-diplom/blob/main/terraform/elasticsearch.tf) - создание host-elasticsearch

[Создание файла bastion.tf](https://github.com/OhotinDY/sys-diplom/blob/main/terraform/bastion.tf) - создание host-bastion

[Создание файла kibana.tf](https://github.com/OhotinDY/sys-diplom/blob/main/terraform/kibana.tf) - создание host-kibana

[Создание файла zabbix.tf](https://github.com/OhotinDY/sys-diplom/blob/main/terraform/zabbix.tf) - создание host-zabbix

[Создание файла security_group.tf](https://github.com/OhotinDY/sys-diplom/blob/main/terraform/security_group.tf) - создание группы безопасности

[Создание файла alb.tf](https://github.com/OhotinDY/sys-diplom/blob/main/terraform/alb.tf) - создание таргет и целевой группы 

[Создание файла network.tf](https://github.com/OhotinDY/sys-diplom/blob/main/terraform/network.tf) - создание внешней и внутренней сети

[Создание файла outputs.tf](https://github.com/OhotinDY/sys-diplom/blob/main/terraform/outputs.tf) - вывод ip-адресов

[Создание файла snapshot.tf](https://github.com/OhotinDY/sys-diplom/blob/main/terraform/snapshot.tf) - snapshot

Создание файла meta.yml - создание пользователей

```
#cloud-config
users:
- name: user
groups: sudo
shell: /bin/bash
sudo: [‘ALL=(ALL) NOPASSWD:ALL’]
ssh-authorized-keys:
- ssh-rsa xxxxxxxxxx ody@home.com
```

Создаем ресурсы

```
terraform apply
```

После завершения развертки получаем следующие ip-адреса

![ip]([https://github.com/OhotinDY/sys-diplom/blob/main/img/1_ip.png]

Развертка в Yandex Cloud: 

![yc](https://github.com/OhotinDY/sys-diplom/blob/main/img/2_YCmain.png)

![yc](https://github.com/OhotinDY/sys-diplom/blob/main/img/3_YC_VM.png)

![yc](https://github.com/OhotinDY/sys-diplom/blob/main/img/4_YC_grsec.png)

