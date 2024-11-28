# Lab2_Devops: Quản lý và triển khai hạ tầng AWS và ứng dụng microservices với Terraform, 
CloudFormation, GitHub Actions, AWS CodePipeline và Jenkins
***Tasks:** 
- Triển khai hạ tầng AWS sử dụng Terraform và tự động hóa quy trình với GitHub Actions 
- Triển khai hạ tầng AWS với CloudFormation và tự động hóa quy trình build và deploy 
với AWS CodePipeline
- Sử dụng Jenkins để quản lý quy trình CI/CD cho ứng dụng microservices 

## 1. Cấu hình VPC bằng Terraform 
  + Setup các tài nguyên cần thiết:
    + Cài đặt Terraform: [Terraform installation guide](https://learn.hashicorp.com/tutorials/terraform/install-cli).  
    + Cài đặt AWS CLI. 
    + Cấu hình aws configure với AWS Access Key ID, AWS Secret Access Key, Default region name (us-east-1)

  + Chạy lệnh:

    Khởi tạo terraform
    ```bash
    terraform init
    ```
    Tạo kế hoạch thực thi terraform
    ```bash
    terraform plan
    ```
    Thực thi code terraform
    ```bash
    terraform aplly
    ```
  + Lưu ý: Dọn dẹp 

    Sau khi triển khai và kiểm tra thành công, xóa các tài nguyên đã triển khai để tránh mất phí aws
    ```bash
    terraform destroy
    ```
## 2. Cấu hình VPC bằng CloudFormation
  + Sử dụng AWS CLI
  + Cấu hình aws configure với AWS Access Key ID, AWS Secret Access Key, Default region name (ap-southeast-2), Default output format.
  + Chạy lệnh:
  ```bash
  aws cloudformation create-stack --stack-name MyVPC --template-body file://CloudFormation_VPC.yaml
  ```
  để tạo stack trên CloudFormation.
  + Sau đó kiểm tra tiến trình tạo stack bằng lệnh:
  ```bash
  aws cloudformation describe-stacks --stack-name MyVPC
  ```
