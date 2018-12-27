PROJECT:=rojace-sam
BUCKET:=$(PROJECT)-playground
PROFILE:=training

bucket:
	aws s3 mb s3://$(BUCKET) --profile $(PROFILE)
package:
	rm -rf build
	mkdir build
	aws cloudformation package \
		--template-file template.yaml \
		--output-template-file build/output.yaml \
		--s3-bucket $(BUCKET) \
		--profile $(PROFILE) 
deploy:
	aws cloudformation deploy \
		--template-file build/output.yaml \
		--stack-name $(PROJECT) \
		--capabilities CAPABILITY_IAM \
		--profile $(PROFILE)