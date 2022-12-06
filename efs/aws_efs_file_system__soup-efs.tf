# mysql-efs1
resource "aws_efs_file_system" "mysql-efs1" {
  depends_on       = [aws_security_group_rule.eks-efs]
  encrypted        = true
  performance_mode = "generalPurpose"
  lifecycle_policy {
    transition_to_ia = "AFTER_30_DAYS"
  }
  tags = {
    Name = "mysql-efs1"
  }
}

output "mysql-efs1" {
  value = aws_efs_file_system.mysql-efs1.id
}

# mysql-efs2
resource "aws_efs_file_system" "mysql-efs2" {
  depends_on       = [aws_security_group_rule.eks-efs]
  encrypted        = true
  performance_mode = "generalPurpose"
  lifecycle_policy {
    transition_to_ia = "AFTER_30_DAYS"
  }
  tags = {
    Name = "mysql-efs2"
  }
}

output "mysql-efs2" {
  value = aws_efs_file_system.mysql-efs2.id
}

# es-efs1
resource "aws_efs_file_system" "es-efs1" {
  depends_on       = [aws_security_group_rule.eks-efs]
  encrypted        = true
  performance_mode = "generalPurpose"
  lifecycle_policy {
    transition_to_ia = "AFTER_30_DAYS"
  }
  tags = {
    Name = "es-efs1"
  }
}

output "es-efs1" {
  value = aws_efs_file_system.es-efs1.id
}

# es-efs2
resource "aws_efs_file_system" "es-efs2" {
  depends_on       = [aws_security_group_rule.eks-efs]
  encrypted        = true
  performance_mode = "generalPurpose"
  lifecycle_policy {
    transition_to_ia = "AFTER_30_DAYS"
  }
  tags = {
    Name = "es-efs2"
  }
}

output "es-efs2" {
  value = aws_efs_file_system.es-efs2.id
}

# es-efs3
resource "aws_efs_file_system" "es-efs3" {
  depends_on       = [aws_security_group_rule.eks-efs]
  encrypted        = true
  performance_mode = "generalPurpose"
  lifecycle_policy {
    transition_to_ia = "AFTER_30_DAYS"
  }
  tags = {
    Name = "es-efs3"
  }
}

output "es-efs3" {
  value = aws_efs_file_system.es-efs3.id
}