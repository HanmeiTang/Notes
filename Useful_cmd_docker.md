# test run after installation
```bash
sudo docker run hello-world
```

# Check running containers and find container_id
```shell
sudo docker ps
```

# stop the running container
```shell
sudo docker stop <container_id>
```

# Check the log of a running container
```bash
sudo docker logs <container_id>
```

# List all images created by Docker
```bash
sudo docker images
```

# Build a container by using Dockfile and name it "your_image_name"
```bash
sudo docker build -t <your_image_name> .
```

# Run the image "your_image_name" locally
```bash
sudo docker run -d -p 80:8080 <your_image_name>
```
