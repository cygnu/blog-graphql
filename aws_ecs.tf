resource "aws_ecs_cluster" "main" {
  name = var.name_prefix

  tags = {
    Name = "${var.tag_name}-cluster"
  }
}

data "template_file" "task_definiton" {
  template = file("${path.module}/task-definitions/ecs-task-definition.json")

  vars = {
    APP_CLIENT_IMAGE = "${var.aws_account_id}.dkr.ecr.${var.aws_region}.amazonaws.com/${var.name_prefix}/client:latest"
    APP_SERVER_IMAGE = "${var.aws_account_id}.dkr.ecr.${var.aws_region}.amazonaws.com/${var.name_prefix}/api:latest"
    WEB_SERVER_IMAGE = "${var.aws_account_id}.dkr.ecr.${var.aws_region}.amazonaws.com/${var.name_prefix}/nginx:latest"
  }
}

resource "aws_ecs_task_definition" "main" {
  family                = "${var.name_prefix}-task"
  container_definitions = data.template_file.task_definiton.rendered

  requires_compatibilities = ["FARGATE"]
  network_mode             = "awsvpc"
  cpu                      = 256
  memory                   = 512

  tags = {
    Name = "${var.tag_name}-task"
  }
}
