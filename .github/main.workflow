workflow "Main workflow" {
  on = "push"
  resolves = [
    "Build Docker image"
  ]
}

action "Docker Lint" {
  uses = "docker://replicated/dockerfilelint"
  args = ["Dockerfile"]
}

action "Build Docker image" {
  needs = "Docker Lint"
  uses = "actions/docker/cli@master"
  args = "build -t heroku ."
}
