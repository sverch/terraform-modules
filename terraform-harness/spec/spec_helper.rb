require 'awspec'

aws_region = ENV.fetch("AWSPEC_AWS_REGION")
Aws.config.update({region: aws_region})
