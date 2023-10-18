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
  token     = "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"
  cloud_id  = "b1ggl8k3ceaee7m4b2oe"
  folder_id = "b1goro5b9fvkh8ohdjot"
}

# Создание ВМ1
resource "yandex_compute_instance" "vm-1" {
  name = "web1"
  platform_id = "standard-v3"
  zone = var.zone1

  resources {
    core_fraction = 20
    cores  = 2
    memory = 2
  }

  boot_disk {
    initialize_params {
      image_id = "fd89dg1rq7uqslc6eigm"
      size = 10
    }
  }


  network_interface {
    subnet_id = yandex_vpc_subnet.subnet-1.id
    nat       = true
  }

  metadata = {
    user-data = "${file("./meta.yml")}"
  }
}

# Создание ВМ2
resource "yandex_compute_instance" "vm-2" {
  name = "web2"
  platform_id = "standard-v3"
  zone = var.zone1

  resources {
    core_fraction = 20
    cores  = 2
    memory = 2
  }

  boot_disk {
    initialize_params {
      image_id = "fd89dg1rq7uqslc6eigm"
      size = 10
    }
  }

  network_interface {
    subnet_id = yandex_vpc_subnet.subnet-1.id
    nat       = true
  }

  metadata = {
    user-data = "${file("./meta.yml")}"
  }
}

