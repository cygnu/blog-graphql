resource "aws_ecs_cluster" "main" {
  name = var.name_prefix

  tags = {
    Name = "${var.tag_name}-cluster"
  }
}

resource "aws_ecs_task_definition" "main" {
  family                = "${var.name_prefix}-task"
  container_definitions = file("task-definitions/ecs-task-definition.json")

  requires_compatibilities = ["FARGATE"]
  network_mode             = "awsvpc"
  cpu                      = 256
  memory                   = 512

  tags = {
    Name = "${var.tag_name}-task"
  }
}
