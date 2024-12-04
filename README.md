### Để bảo mật hơn thì cần phải tạo một user khác user root trên server vì nếu hacker chiếm

### được quyền của user root thì không thể vào được các user khác do yêu cầu password

### build image

docker build -t todolist:v1 .

### run container từ image

### docker run --name {container-name} -dp port-server:port-container {image-name}

docker run --name todolist-v1 -dp 8888:80 todolist:v1
