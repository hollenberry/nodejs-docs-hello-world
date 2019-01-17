workflow "Deploy on Now" {
  on = "push"
  resolves = ["deploy"]
}

action "deploy" {
  uses = "actions/zeit-now@master"
  secrets = [
    "ZEIT_TOKEN",
  ]
}
