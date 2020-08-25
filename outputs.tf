#------------------------------------------------------------------------------
# ECS CLUSTER
#------------------------------------------------------------------------------
output "aws_ecs_cluster_cluster_name" {
  description = "The name of the cluster"
  value       = module.ecs-cluster.aws_ecs_cluster_cluster_name
}

output "aws_ecs_cluster_cluster_id" {
  description = "The Amazon ID that identifies the cluster"
  value       = module.ecs-cluster.aws_ecs_cluster_cluster_id
}

output "aws_ecs_cluster_cluster_arn" {
  description = "The Amazon Resource Name (ARN) that identifies the cluster"
  value       = module.ecs-cluster.aws_ecs_cluster_cluster_arn
}

#------------------------------------------------------------------------------
# AWS ECS Task Execution Role
#------------------------------------------------------------------------------
output "aws_iam_role_ecs_task_execution_role_arn" {
  description = "The Amazon Resource Name (ARN) specifying the role."
  value       = module.td.aws_iam_role_ecs_task_execution_role_arn
}
output "aws_iam_role_ecs_task_execution_role_create_date" {
  description = "The creation date of the IAM role."
  value       = module.td.aws_iam_role_ecs_task_execution_role_create_date
}
output "aws_iam_role_ecs_task_execution_role_description" {
  description = "The description of the role."
  value       = module.td.aws_iam_role_ecs_task_execution_role_description
}
output "aws_iam_role_ecs_task_execution_role_id" {
  description = "The ID of the role."
  value       = module.td.aws_iam_role_ecs_task_execution_role_id
}
output "aws_iam_role_ecs_task_execution_role_name" {
  description = "The name of the role."
  value       = module.td.aws_iam_role_ecs_task_execution_role_name
}
output "aws_iam_role_ecs_task_execution_role_unique_id" {
  description = "The stable and unique string identifying the role."
  value       = module.td.aws_iam_role_ecs_task_execution_role_unique_id
}

#------------------------------------------------------------------------------
# ECS Task Definition
#------------------------------------------------------------------------------
output "aws_ecs_task_definition_td_arn" {
  description = "Full ARN of the Task Definition (including both family and revision)."
  value       = module.td.aws_ecs_task_definition_td_arn
}

output "aws_ecs_task_definition_td_family" {
  description = "The family of the Task Definition."
  value       = module.td.aws_ecs_task_definition_td_family
}

output "aws_ecs_task_definition_td_revision" {
  description = "The revision of the task in a particular family."
  value       = module.td.aws_ecs_task_definition_td_revision
}
output "container_name" {
  description = "Name of the container"
  value       = var.container_name
}


#------------------------------------------------------------------------------
# AWS ECS SERVICE
#------------------------------------------------------------------------------
output "aws_ecs_service_service_id" {
  description = "The Amazon Resource Name (ARN) that identifies the service."
  value       = module.ecs-fargate-service.aws_ecs_service_service_id
}

output "aws_ecs_service_service_name" {
  description = "The name of the service."
  value       = module.ecs-fargate-service.aws_ecs_service_service_name
}

output "aws_ecs_service_service_cluster" {
  description = "The Amazon Resource Name (ARN) of cluster which the service runs on."
  value       = module.ecs-fargate-service.aws_ecs_service_service_cluster
}

output "aws_ecs_service_service_desired_count" {
  description = "The number of instances of the task definition"
  value       = module.ecs-fargate-service.aws_ecs_service_service_desired_count
}

#------------------------------------------------------------------------------
# AWS SECURITY GROUPS
#------------------------------------------------------------------------------
output "ecs_tasks_sg_id" {
  description = "$${var.name_preffix} ECS Tasks Security Group - The ID of the security group"
  value       = module.ecs-fargate-service.ecs_tasks_sg_id
}

output "ecs_tasks_sg_arn" {
  description = "$${var.name_preffix} ECS Tasks Security Group - The ARN of the security group"
  value       = module.ecs-fargate-service.ecs_tasks_sg_arn
}

output "ecs_tasks_sg_name" {
  description = "$${var.name_preffix} ECS Tasks Security Group - The name of the security group"
  value       = module.ecs-fargate-service.ecs_tasks_sg_name
}

output "ecs_tasks_sg_description" {
  description = "$${var.name_preffix} ECS Tasks Security Group - The description of the security group"
  value       = module.ecs-fargate-service.ecs_tasks_sg_description
}
