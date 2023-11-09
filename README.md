# ServerSetup Docker Action

Github Action to Setup a Server from New Ubuntu 22 LTS Install to Node Server and Push New Code on Commit.   

## Inputs

## `who-to-greet`

**Required** The name of the person to greet. Default `"World"`.

## Outputs

## `time`

The time we greeted you.

## Example usage

uses: actions/hello-world-docker-action@v2
with:
  who-to-greet: 'Mona the Octocat'

# Add Release Tag
git tag -a -m "My first action release" v1
git push --follow-tags
