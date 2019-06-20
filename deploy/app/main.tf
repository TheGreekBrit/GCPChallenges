provider "google" {
	project = "ahouston-playground-personal"
	region = "us-west1"
	zone = "us-west1-a"
}

resource "google_compute_instance" "vm_instance" {
	name		 = "flask-instance"
	machine_type = "f1-micro"

	metadata_startup_script = "${file("${path.module}/startup.sh")}"

	boot_disk {
		initialize_params {
			image = "debian-cloud/debian-9"
		}
	}

	network_interface {
		network 	  = "${google_compute_network.vpc_network.self_link}"
		access_config {
		}
	}

	#metadata_startup_script = ""
}

resource "google_compute_network" "vpc_network" {
	name				    = "terraform-network"
	auto_create_subnetworks = "true"
}

