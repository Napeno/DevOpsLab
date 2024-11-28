# Lab2_Devops: Quản lý và triển khai hạ tầng AWS và ứng dụng microservices với Terraform, 
CloudFormation, GitHub Actions, AWS CodePipeline và Jenkins
***Tasks:** 
- Triển khai hạ tầng AWS sử dụng Terraform và tự động hóa quy trình với GitHub Actions 
- Triển khai hạ tầng AWS với CloudFormation và tự động hóa quy trình build và deploy 
với AWS CodePipeline
- Sử dụng Jenkins để quản lý quy trình CI/CD cho ứng dụng microservices 

## **1. Triển khai hạ tầng AWS sử dụng Terraform và tự động hóa quy trình với GitHub Actions (3 điểm)**

### **Các bước thực hiện**
1. **Dùng Terraform để triển khai hạ tầng AWS**:
   - Triển khai các dịch vụ AWS sau:
     - **VPC** (Virtual Private Cloud)
     - **Route Tables**
     - **NAT Gateway**
     - **EC2 Instances**
     - **Security Groups**
   - Sử dụng tệp `main.tf` trong thư mục `terraform/` để định nghĩa các tài nguyên.

2. **Tự động hóa triển khai với GitHub Actions**:
   - Tạo file pipeline `terraform-pipeline.yml` trong `.github/workflows/`.
   - Pipeline bao gồm các bước:
     - Checkout mã nguồn từ GitHub.
     - Thiết lập môi trường Terraform.
     - Chạy lệnh `terraform init`, `terraform plan`, và `terraform apply`.

3. **Tích hợp Checkov kiểm tra bảo mật**:
   - Tích hợp `Checkov` trong GitHub Actions để kiểm tra:
     - Tính tuân thủ bảo mật mã Terraform.
     - Báo cáo các vấn đề tiềm ẩn và lỗi cấu hình bảo mật.
   - Sử dụng action `bridgecrewio/checkov-action`.

---

## **2. Triển khai hạ tầng AWS với CloudFormation và tự động hóa với AWS CodePipeline (3 điểm)**

### **Các bước thực hiện**
1. **Dùng CloudFormation để triển khai hạ tầng AWS**:
   - Tạo tệp CloudFormation `infrastructure.yaml` để định nghĩa:
     - **VPC**, **Route Tables**, **NAT Gateway**, **EC2**, **Security Groups**.
   - Triển khai stack bằng AWS Management Console hoặc CLI.

2. **Kiểm tra mã CloudFormation với CodeBuild**:
   - Sử dụng `cfn-lint` để kiểm tra tính đúng đắn của mã.
   - Tích hợp `Taskcat` để kiểm thử các mẫu CloudFormation trên các môi trường thực tế.

3. **Tự động hóa với AWS CodePipeline**:
   - Tạo pipeline trong AWS CodePipeline với các giai đoạn:
     - **Source**: Lấy mã nguồn từ AWS CodeCommit.
     - **Build**: Sử dụng AWS CodeBuild để kiểm tra mã và build.
     - **Deploy**: Triển khai hạ tầng lên AWS.

---

## **3. Sử dụng Jenkins để quản lý quy trình CI/CD cho ứng dụng microservices (4 điểm)**

### **Các bước thực hiện**
1. **Tự động hóa với Jenkins**:
   - Tạo pipeline trong Jenkins để tự động hóa các bước:
     - Clone mã nguồn từ GitHub.
     - Build Docker image từ Dockerfile.
     - Push image lên Docker Hub.
     - Deploy ứng dụng lên Kubernetes hoặc Docker Compose.

2. **Tích hợp SonarQube kiểm tra chất lượng mã**:
   - Cấu hình SonarQube để:
     - Phát hiện bugs, vulnerabilities, và code smells.
     - Tăng cường độ sạch và bảo trì của mã.
   - Sử dụng Jenkinsfile với stage:
     - Chạy lệnh `/opt/sonar-scanner/bin/sonar-scanner`.

3. **Kiểm tra bảo mật với Snyk (Tùy chọn)**:
   - Tích hợp `Snyk` vào pipeline Jenkins để kiểm tra:
     - Dependencies (Node.js, Python...).
     - Dockerfile và cấu hình Docker Compose.
   - Chạy các lệnh `snyk test` và `snyk container test` để phát hiện các lỗ hổng bảo mật.
