workflow "Deploy on Now" {
  on = "push"
  resolves = ["deploy"]
}

action "deploy" {
  uses = "actions/zeit-now@master"
  secrets = [
    "ZEIT_TOKEN",
    "GITHUB_TOKEN",
  ]
  args = "-e GITHUB_TOKEN=$GITHUB_TOKEN"
}

action "alias" {
  needs = ["deploy"]
  uses = "actions/zeit-now@master"
  args = "alias"
  secrets = [
    "ZEIT_TOKEN",
  ]
}
