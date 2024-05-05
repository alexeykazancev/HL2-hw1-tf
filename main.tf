#
resource "yandex_compute_instance" "vm-hw-1" { 
  name = "vm-hw-1"
  platform_id = "standard-v3"

  resources {
    cores  = 2 # vCPU
    memory = 2 # RAM
  }

  boot_disk {
    initialize_params {
      image_id = var.image_id # ОС (Ubuntu, 20.04 LTS)
    }
  }

  network_interface {
    subnet_id = var.subnet_id # одна из дефолтных подсетей
    nat = true # автоматически установить динамический ip
  }
  
  metadata = {
    ssh-keys = "ubuntu:${file("~/.ssh/id_rsa.pub")}"
  }
}
