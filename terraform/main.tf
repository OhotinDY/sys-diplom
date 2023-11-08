# Описание облака
terraform {
  required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
    }
  }
}

# Описание доступа и токена
provider "yandex" {
  token     = "xxxxxxxxxx"
  cloud_id  = "b1ggl8k3ceaee7m4b2oe"
  folder_id = "b1goro5b9fvkh8ohdjot"
}

