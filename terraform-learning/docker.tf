resource "docker_image" "nginx" {
  name         = "nginx:latest"
}

resource "docker_container" "web" {
    image = docker_image.nginx.image_id
    name  = "sampledocker"
    ports {
        external = 8080
        internal = 80
        ip       = "0.0.0.0"
        protocol = "tcp"
    }
}


/* Sample docker resource

resource "docker_container" "web" {}

resource "docker_container" "web" {
    command           = [
        "nginx",
        "-g",
        "daemon off;",
    ]
    cpu_shares        = 0
    dns               = []
    dns_opts          = []
    dns_search        = []
    entrypoint        = [
        "/docker-entrypoint.sh",
    ]
    group_add         = []
    hostname          = "1b0cb3ac47df"
    id                = "1b0cb3ac47df582829fe1b2d608b9ab964bcd9d4d73de2cf106a4105e72a9757"
    image             = "sha256:fffffc90d343cbcb01a5032edac86db5998c536cd0a366514121a45c6723765c"
    init              = false
    ipc_mode          = "private"
    log_driver        = "json-file"
    log_opts          = {}
    max_retry_count   = 0
    memory            = 0
    memory_swap       = 0
    name              = "hashicorp-learn"
    network_data      = [
        {
            gateway                   = "172.17.0.1"
            global_ipv6_address       = ""
            global_ipv6_prefix_length = 0
            ip_address                = "172.17.0.2"
            ip_prefix_length          = 16
            ipv6_gateway              = ""
            mac_address               = "02:42:ac:11:00:02"
            network_name              = "bridge"
        },
    ]
    network_mode      = "bridge"
    privileged        = false
    publish_all_ports = false
    read_only         = false
    restart           = "no"
    rm                = false
    runtime           = "runc"
    security_opts     = []
    shm_size          = 64
    stdin_open        = false
    stop_signal       = "SIGQUIT"
    stop_timeout      = 0
    storage_opts      = {}
    sysctls           = {}
    tmpfs             = {}
    tty               = false

    ports {
        external = 8080
        internal = 80
        ip       = "0.0.0.0"
        protocol = "tcp"
    }
}
*/