#------------------------------------------------------------------------------
# ECS Cluster
#------------------------------------------------------------------------------
module ecs-cluster {
  source  = "cn-terraform/ecs-cluster/aws"
  version = "1.0.5"
  # source  = "../terraform-aws-ecs-cluster"

  name    = "${var.name_preffix}"
}

#------------------------------------------------------------------------------
# ECS Task Definition
#------------------------------------------------------------------------------
module "td" {
  source  = "github.com/mastercoder8/terraform-aws-ecs-fargate-task-definition"
  # version = "1.0.11"
  # source  = "../terraform-aws-ecs-fargate-task-definition"

  name_preffix                 = var.name_preffix
  container_image              = var.container_image
  container_name               = var.container_name
  command                      = var.command
  container_cpu                = var.container_cpu
  container_depends_on         = var.container_depends_on
  container_memory             = var.container_memory
  container_memory_reservation = var.container_memory_reservation
  dns_servers                  = var.dns_servers
  docker_labels                = var.docker_labels
  entrypoint                   = var.entrypoint
  environment                  = var.environment
  essential                    = var.essential
  firelens_configuration       = var.firelens_configuration
  healthcheck                  = var.healthcheck
  links                        = var.links
  linux_parameters             = var.linux_parameters
  log_configuration            = var.log_configuration
  mount_points                 = var.mount_points
  port_mappings                = var.port_mappings
  readonly_root_filesystem     = var.readonly_root_filesystem
  repository_credentials       = var.repository_credentials
  secrets                      = var.secrets
  start_timeout                = var.start_timeout
  stop_timeout                 = var.stop_timeout
  system_controls              = var.system_controls
  ulimits                      = var.ulimits
  user                         = var.user
  volumes_from                 = var.volumes_from
  working_directory            = var.working_directory
  placement_constraints        = var.placement_constraints_task_definition
  proxy_configuration          = var.proxy_configuration
  volumes                      = var.volumes
}


#------------------------------------------------------------------------------
# ECS Service
#------------------------------------------------------------------------------
module "ecs-fargate-service" {
  source  = "cn-terraform/ecs-fargate-service/aws"
  version = "2.0.4"
  # source  = "../terraform-aws-ecs-fargate-service"
  
  name_preffix = var.name_preffix
  vpc_id       = var.vpc_id

  ecs_cluster_arn                    = module.ecs-cluster.aws_ecs_cluster_cluster_arn
  deployment_maximum_percent         = var.deployment_maximum_percent
  deployment_minimum_healthy_percent = var.deployment_minimum_healthy_percent
  desired_count                      = var.desired_count
  enable_ecs_managed_tags            = var.enable_ecs_managed_tags
  health_check_grace_period_seconds  = var.health_check_grace_period_seconds
  ordered_placement_strategy         = var.ordered_placement_strategy
  placement_constraints              = var.ecs_service_placement_constraints
  platform_version                   = var.platform_version
  propagate_tags                     = var.propagate_tags
  service_registries                 = var.service_registries
  task_definition_arn                = module.td.aws_ecs_task_definition_td_arn

  # Network configuration block
  public_subnets   = var.public_subnets_ids
  private_subnets  = var.private_subnets_ids
  security_groups  = var.ecs_service_security_groups
  assign_public_ip = var.assign_public_ip

  # ECS Service Load Balancer block
  container_name = var.container_name

  # ECS Autoscaling
  ecs_cluster_name = module.ecs-cluster.aws_ecs_cluster_cluster_name

  lb_arn                  = var.lb_arn
  lb_http_tgs_arns        = var.lb_http_tgs_arns
  lb_https_tgs_arns       = var.lb_https_tgs_arns
  lb_http_listeners_arns  = var.lb_http_listeners_arns
  lb_https_listeners_arns = var.lb_https_listeners_arns
  load_balancer_sg_id     = var.load_balancer_sg_id
}
