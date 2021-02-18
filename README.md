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
In order for the deploy action to execute properly, you will need to use other github actions for authentication.
1. [`webfactory/ssh-agent`](https://github.com/run-x/webfactory/ssh-agent), to allow access to other repositories' opta configuration files. Note that you only need to use this if you have opta.yml files in other repos.
2. [`aws-actions/configure-aws-credentials`](https://github.com/run-x/aws-actions/configure-aws-credentials), to allow push and deploy to AWS. Make sure that the API key associated with this account has admin permissions.

```yml
# You only need to include this step if you have opta files outside of this repo
- name: Setup ssh
  uses: webfactory/ssh-agent@v0.4.1
  with:
    # if you don't have a github SSH key, you can generate one here: 
    # https://docs.github.com/en/github/authenticating-to-github/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent
    ssh-private-key: ${{ secrets.GITHUB_SSH_KEY }}

- name: Configure AWS credentials	
  uses: aws-actions/configure-aws-credentials@v1	
  with:	
    # This aws account should have admin permissions
    aws-access-key-id: ${{ secrets.AWS_ACCESS_KEY }}	
    aws-secret-access-key: ${{ secrets.AWS_SECRET_ACCESS_KEY }}	
    aws-region: us-east-1	
```

## Complete Example
See [example.yml](example.yml).