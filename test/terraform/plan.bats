load 'lib'

function setup() {
  skip_unless_terraform
  clean
  export TF_CLI_ARGS_plan="-input=false -detailed-exitcode"
  terraform init
}

function teardown() {
  clean
  unset TF_CLI_ARGS_plan
}

@test "check if terraform plan works" {
  skip_unless_terraform
  run terraform plan
  log "$output"
  [ $status -eq 0 ] || [ $status -eq 2 ]
}
