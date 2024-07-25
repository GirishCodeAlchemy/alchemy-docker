# Alchemy Docker

## Install Docker

## Commands to build

```bash
docker build -t <ImageName>:<Tagname> -f src/multi-stage-Dockerfile .
```

## Facts:

### 1. Alpine:

- One of the smallest Docker base images, typically around 5 MB in size.
- Uses apk (Alpine Package Keeper) for package management
- Ideal for creating minimal, resource-efficient Docker images for applications where size and security are critical, such as microservices and lightweight applications.

### 2. Slim:

- Generally larger than Alpine but smaller than full versions of the same operating systems. The size can vary, but it is significantly more substantial than Alpine.
- Uses apt (Advanced Package Tool) for package management, consistent with Debian-based systems.
- Suitable for scenarios where a smaller image is desired but compatibility with Debian-based packages and software is required, providing a good balance between size and functionality.

# Manage the Docker deployment using Terraform

- [Document](./terraform/README.md)
- [![Docker](https://github.com/user-attachments/assets/419f3872-1905-4084-a498-4e0756277e3f)](./terraform/README.md)


## License

This project is licensed under the MIT License. See the [LICENSE](./LICENSE) file for details.

## Contributing

Contributions are welcome! Please open an issue or submit a pull request for any changes.
