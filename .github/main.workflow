workflow "Main workflow" {
  on = "push"
  resolves = [
    "Build Docker image"
  ]
}

action "Shell Lint" {
  uses = "actions/bin/shellcheck@master"
  args = ["entrypoint.sh", "docker-lib.sh"]
}

action "Docker Lint" {
  uses = "docker://replicated/dockerfilelint"
  args = ["Dockerfile"]
}

action "Build Docker image" {
  needs = ["Docker Lint", "Shell Lint"]
  uses = "actions/docker/cli@master"
  args = "build -t heroku ."
}