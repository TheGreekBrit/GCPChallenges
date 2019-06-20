provider "google" {
        project = "ahouston-playground-personal"
        region = "us-west1"
        zone = "us-west1-a"
}

resource "google_compute_image" "flask-image" {
	name = "flask-image"

	source_disk = "flask-instance"
}

resource "google_compute_instance_template" "flask-template" {
	name		= "flask-template"
	description = "Flask deploy for Challenge2"

	instance_description = "flask worker"
	machine_type		 = "f1-micro"

	disk {
		source_image = "${google_compute_image.flask-image.self_link}"
		boot = true
	}

	network_interface {
		network = "terraform-network"
	}
}

#todo persist in terraform.tfstate
resource "google_compute_instance_group_manager" "flask-mig" {
	name			   = "flask-mig"
	instance_template  = "${google_compute_instance_template.flask-template.self_link}"
	base_instance_name = "flask-worker"
	target_size 	   = "1"
}


