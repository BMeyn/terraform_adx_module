login:
	az login

init:
	terraform init

plan:
	terraform plan

test:
	cd test && go test -v -timeout 30m

apply:
	terraform apply --auto-approve

destroy:
	terraform destroy

go-setup:
	go mod init
	go mod tidy