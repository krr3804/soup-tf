# mysql-efs1
resource "aws_efs_mount_target" "mysql-efs1-mt1" {
  depends_on      = [aws_efs_file_system.mysql-efs1]
  file_system_id  = aws_efs_file_system.mysql-efs1.id
  subnet_id       = data.terraform_remote_state.net.outputs.sub-prod-pri3
  security_groups = [aws_security_group.soup-efs-sg.id]
}

resource "aws_efs_mount_target" "mysql-efs1-mt2" {
  depends_on      = [aws_efs_file_system.mysql-efs1]
  file_system_id  = aws_efs_file_system.mysql-efs1.id
  subnet_id       = data.terraform_remote_state.net.outputs.sub-prod-pri4
  security_groups = [aws_security_group.soup-efs-sg.id]
}

# mysql-efs2
resource "aws_efs_mount_target" "mysql-efs2-mt1" {
  depends_on      = [aws_efs_file_system.mysql-efs2]
  file_system_id  = aws_efs_file_system.mysql-efs2.id
  subnet_id       = data.terraform_remote_state.net.outputs.sub-prod-pri3
  security_groups = [aws_security_group.soup-efs-sg.id]
}

resource "aws_efs_mount_target" "mysql-efs2-mt2" {
  depends_on      = [aws_efs_file_system.mysql-efs2]
  file_system_id  = aws_efs_file_system.mysql-efs2.id
  subnet_id       = data.terraform_remote_state.net.outputs.sub-prod-pri4
  security_groups = [aws_security_group.soup-efs-sg.id]
}

# es-efs1
resource "aws_efs_mount_target" "es-efs1-mt1" {
  depends_on      = [aws_efs_file_system.es-efs1]
  file_system_id  = aws_efs_file_system.es-efs1.id
  subnet_id       = data.terraform_remote_state.net.outputs.sub-prod-pri3
  security_groups = [aws_security_group.soup-efs-sg.id]
}

resource "aws_efs_mount_target" "es-efs1-mt2" {
  depends_on      = [aws_efs_file_system.es-efs1]
  file_system_id  = aws_efs_file_system.es-efs1.id
  subnet_id       = data.terraform_remote_state.net.outputs.sub-prod-pri4
  security_groups = [aws_security_group.soup-efs-sg.id]
}

# es-efs2
resource "aws_efs_mount_target" "es-efs2-mt1" {
  depends_on      = [aws_efs_file_system.es-efs2]
  file_system_id  = aws_efs_file_system.es-efs2.id
  subnet_id       = data.terraform_remote_state.net.outputs.sub-prod-pri3
  security_groups = [aws_security_group.soup-efs-sg.id]
}

resource "aws_efs_mount_target" "es-efs2-mt2" {
  depends_on      = [aws_efs_file_system.es-efs2]
  file_system_id  = aws_efs_file_system.es-efs2.id
  subnet_id       = data.terraform_remote_state.net.outputs.sub-prod-pri4
  security_groups = [aws_security_group.soup-efs-sg.id]
}


# es-efs3
resource "aws_efs_mount_target" "es-efs3-mt1" {
  depends_on      = [aws_efs_file_system.es-efs3]
  file_system_id  = aws_efs_file_system.es-efs3.id
  subnet_id       = data.terraform_remote_state.net.outputs.sub-prod-pri3
  security_groups = [aws_security_group.soup-efs-sg.id]
}

resource "aws_efs_mount_target" "es-efs3-mt2" {
  depends_on      = [aws_efs_file_system.es-efs3]
  file_system_id  = aws_efs_file_system.es-efs3.id
  subnet_id       = data.terraform_remote_state.net.outputs.sub-prod-pri4
  security_groups = [aws_security_group.soup-efs-sg.id]
}