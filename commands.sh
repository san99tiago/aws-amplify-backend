#!/bin/bash

# Prerrequisites:
# -> Install NodeJS
# -> Install NPM

# Install Amplify CLI
sudo npm install -g @aws-amplify/cli

# Configure Amplify
amplify configure

# Initialize Amplify
amplify init
#>> This creates an Amplify CloudFormation template and an "amplify" folder
#>>Some next steps:
#>>"amplify status" will show you what you've added already and if it's locally configured or deployed
#>>"amplify add <category>" will allow you to add features like user login or a backend API
#>>"amplify push" will build all your local backend resources and provision it in the cloud
#>>"amplify console" to open the Amplify Console and view your project status
#>>"amplify publish" will build all your local backend and frontend resources (if you have hosting category added) and provision it in the cloud


# Add amplify category
amplify add api
# -> API Type: GraphQL
# -> Authentication Type: API Key
# -> Empty schema (we will add it later on : amplify/backend/api/amplifypoc/schema.graphql")

# Deploy the Amplify with the updates
amplify push
# -> This will create multiple CF Templates (Nested templates)
# -> We can go to AWS Amplify Console to explore and play around with queries

# Add custom Lambda Function
amplify add function
# -> Lambda Function
# -> Python
# -> Advanced Settings (yes)
# -> Access to other resources: (api)
# -> Operation: (query)
# -> Scheduled: (no)
# -> Layer: (no)
# -> Environment Variables: (as needed)
# -> Access to Secret: (no)
# This will create the entrypoint at "amplify/backend/function/fnexample/src/index.py"

# Deploy the Amplify with the updates
amplify push


# Then we update the schema with the following lines:
# type Query {
#     customLogic(message: String): String @function(name: "fnexample-${env}")
# }

# Deploy the Amplify with the updates
amplify push

# We can now can execute Lambda Functions and have fun with the query

# We can add the auth by:
amplify add auth
# -> Default
# -> Email based: (add email settings)
# -> Advanced: (yes)
# -> Follow steps to configure

# Add storage support
amplify add storage
# -> Content
# -> Friendly name: (s3data)
# -> Bucket name: (any as needed)
# -> Auth access: (auth users only)
# -> Kind of access: (create/update)
# -> Lambda trigger: (no)
