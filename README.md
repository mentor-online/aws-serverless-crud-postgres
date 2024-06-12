
# Giới thiệu
Trong bối cảnh công nghệ thông tin ngày càng phát triển, việc xây dựng các ứng dụng có khả năng mở rộng và linh hoạt là rất cần thiết. Khóa học này sẽ giúp bạn hiểu sâu hơn về việc triển khai các dịch vụ không máy chủ (serverless) trên nền tảng AWS, sử dụng RDS PostgreSQL làm cơ sở dữ liệu, và kiểm soát tải với API Gateway.

## Thông Tin Khóa Học
Chúng tôi sẽ bắt đầu bằng việc thiết lập một mô hình CRUD (Create, Read, Update, Delete) serverless cho ứng dụng của bạn, sử dụng RDS PostgreSQL. Bạn sẽ được hướng dẫn cách xây dựng và quản lý bốn API sau để tương tác với cơ sở dữ liệu:

- **Tạo Người Dùng Mới (Create User)**
- **Cập Nhật Thông Tin Người Dùng (Update User)**
- **Xóa Người Dùng Theo Tên Người Dùng (Delete User)**
- **Lấy Danh Sách Người Dùng Theo Tên (Get User List)**

## Mô hình triển khai
![""](architecture.png)


### Tạo Bảng User
Đầu tiên, chúng ta cần tạo một bảng `users` để lưu trữ thông tin. Dưới đây là câu lệnh SQL để tạo bảng:

```sql
CREATE TABLE "users" (
    "id" bigserial,
    username character varying(50) COLLATE pg_catalog."default",
    name character varying(50) COLLATE pg_catalog."default" NOT NULL,
    phone character varying(50) COLLATE pg_catalog."default",
    PRIMARY KEY ("id")
);
```

### Cấu Trúc API
Mỗi API sẽ có đầu vào là thông tin của người dùng và đầu ra là kết quả của quá trình xử lý. Đặc biệt, bạn cần kiểm tra tính duy nhất của `username` khi tạo mới, không sử dụng ràng buộc unique của cơ sở dữ liệu.

### API Insert
- create user với username, name, phone. Phải check username tồn tại duy nhất trong table, không sử dụng unique của database
- input:
```go
{
    "requestId": {{uuid}},
    "requestTime": {{timeRPC3339}},
    "data": {
        "username": {{string}},
        "name": {{string}},
        "phone": {{string}}
    }
}
```
- output:
```go
{
    "responseId": {{requestId}},
    "responseTime": {{timeRPC3339}},
    "responseCode": {{string}},
    "responseMessage": {{string}}
}
```

### API Update
- update user by username. Thông tin update là name và phone.
- input:
```go
{
    "requestId": {{uuid}},
    "requestTime": {{timeRPC3339}},
    "data": {
        "username": {{string}},
        "name": {{string}},
        "phone": {{string}}
    }
}
```

- output:
```go
{
    "responseId": {{requestId}},
    "responseTime": {{timeRPC3339}},
    "responseCode": {{string}},
    "responseMessage": {{string}},
}
```

### API Delete
- delete user by username
- input:
```go
{
    "requestId": {{uuid}},
    "requestTime": {{timeRPC3339}},
    "data": {
        "username": {{string}}
    }
}
```

- output:
```go
{
    "responseId": {{requestId}},
    "responseTime": {{timeRPC3339}},
    "responseCode": {{string}},
    "responseMessage": {{string}},
}
```

### API Get list
- get list by username
- input:
```go
{
    "requestId": {{uuid}},
    "requestTime": {{timeRPC3339}},
    "data": {
        "username": {{string}}
    }
}
```

- output:
```go
{
    "responseId": {{uuid}},
    "responseTime": {{timeRPC3339}},
    "responseCode": {{string}},
    "responseMessage": {{string}},
    "data": {
        "username": {{string}},
        "name": {{string}},
        "phone": {{string}}
    }
}
```

## Mời Tham Gia Khóa Học Nâng Cao
Sau khi hoàn thành khóa học này, bạn có thể tiếp tục tham gia vào khóa học chuyên sâu về **Ứng dụng Java Springboot xây dựng một hệ thống API RESTful chuẩn ngân hàng**. Hãy đăng ký ngay tại [mentoronline.edu.vn](https://mentoronline.edu.vn/subcribe-java-beanstalk-aws)  
