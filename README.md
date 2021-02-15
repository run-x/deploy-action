## RunX Deploy

Deploy your docker container using runx.

**Table of Contents**

<!-- toc -->

- [Usage](#usage)
- [Authentication](#authentication)

<!-- tocstop -->

## Usage

Add the following step to your workflow:

```yaml
- name: Update deployment
  uses: run-x/deploy-action@v0.6
  with:
    env: runx-staging
    image: app:latest
    tag: ${{ github.sha }}
```

See [action.yml](action.yml) for the full documentation for this action's inputs and outputs.

## Authentication
Before calling the `run-x/deploy-action` github action, you will need to call two other Github actions:
1. `webfactory/ssh-agent`, to allow access to other repositories' opta configuration files.
2. `aws-actions/configure-aws-credentials`, to allow push and deploy to AWS.

```yml
- name: Setup ssh
  uses: webfactory/ssh-agent@v0.4.1
  with:
    ssh-private-key: ${{ secrets.SSH_KEY }}

- name: Configure AWS credentials	
  uses: aws-actions/configure-aws-credentials@v1	
  with:	
    aws-access-key-id: ${{ secrets.DEPLOYER_AWS_ACCESS_KEY }}	
    aws-secret-access-key: ${{ secrets.DEPLOYER_AWS_SECRET_ACCESS_KEY }}	
    aws-region: us-east-1	
```

## Complete Example
See [example.yml](example.yml).