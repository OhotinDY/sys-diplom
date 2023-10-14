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
