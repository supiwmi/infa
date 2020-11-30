# Keep Terraform State at Local
ถ้าต้องการเก็บ terraform stater ไว้ที่ local ก็ไม่ต้องรัน terraform init, terraform apply ใน 0-RemoteTerraformStateฃ

# Keep Terraform State in AWS S3 Bucket
แต่ถ้าเรามีเรามี s3 bucket อยู่แล้วก็เอาไปไว้ที่ remote ก็ได้เพื่อที่ว่าเราจะได้ไปรัน share script นี้ไปให้คืนอื่นรันหรือเราเองไปรันที่เครื่องไหนก็ได้ (แต่ต้องติดตั้ง AWS CLI และ configure aws user profile ให้เรียบร้อยก่อน)

# Keep Terraform State in Terraform Cloud (Free)
ถ้าไม่มี aws account เราสามารถใช้ terraform cloud เพื่อ เก็บ state ไฟล์ก็ได้ ฟรี แต่ต้อง register และ set configuration ให้เรียบร้อยก่อนเช่นกัน