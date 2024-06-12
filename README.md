# ipv-terraform-modules-pub
IPV Terraform Modules - Public

## Module versioning
Our Terraform module versions should be in lockstep with those of the DevPlatform CloudFormation (CFN) templates. So we only publish new module versions when they do. This can happen in one of two scenarios:

Scenario 1: We don't have to make any code changes, just a new version is published. Example scenarios:
    - the CFN templates update default values
    - the CFN templates add a new resource
    - the CFN templates delete a resources

In this case we can manually publish a new version of the module using the `publish-manual` GHA and specify the module and new module version (this should subsequently be automated where possible).

Scenario 2: We have to make code changes to accompany the CFN template changes. Example scenarios:
    - the CFN templates input parameters change

In this case we need to make code changes to the module parameters. so will open a PR and have the `publish` GHA run on merge. This will find the latest version of the CFN template and publish a matching module.

### Supporting version ranges
SemVer allows you to specify version ranges, allowing automatic upgrading to newest patch or minor depending on range specifier. This means someone doesn't have to update the pinned version everytime a new patch or minor version comes out. However using git tags and github source URLs, this can't be done. However, we can publish immutable tags for full semver specific versions, e.g. `v1.5.2`, as well as less-specific mutable tags that are overwritted by newer versions, e.g. a `v1.5` and `v1`. This means a consumer can specify a source URL like:

```tf
module "example" {
    source = ".....?ref=vpc/v1"
}
```

and be sure they will not update to any breaking changes, but do not have to constantly udpate patch version identifiers if they don't want to.

Alternatively, they can specify the full SemVer version number to pin to an exact version:


```tf
module "example" {
    source = ".....?ref=vpc/v1.5.2"
}
```


## Pre-Commit Checking / Verification

There is a `.pre-commit-config.yaml` configuration setup in this repo, this uses [pre-commit](https://pre-commit.com/) to verify your commit before actually commiting. It runs the following checks:

* Check `JSON` files for formatting issues
* Fixes end of file issues (it will auto correct if it spots an issue - you will need to run the git commit again after it has fixed the issue)
* It automatically removes trailing whitespaces (again will need to run commit again after it detects and fixes the issue)
* Detects aws credentials or private keys accidentally added to the repo
* Reformat `HCL` files (those using the `.tf` extension) into a consistent structure

### Dependency Installation
To use this locally you will first need to install the dependencies, this can be done in 2 ways:

#### Method 1 - Python pip

Run the following in a terminal:

```
sudo -H pip3 install checkov pre-commit cfn-lint
```

this should work across platforms.

#### Method 2 - Brew

If you have brew installed please run the following:

```
brew install pre-commit ;\
brew install cfn-lint ;\
brew install checkov
```

### Post Installation Configuration
Once installed run:
```
pre-commit install
```

To update the various versions of the pre-commit plugins, this can be done by running:

```
pre-commit autoupdate && pre-commit install
```

This will install / configure the pre-commit git hooks, if it detects an issue while committing it will produce an output like the following:

```
 git commit -a
check json...........................................(no files to check)Skipped
fix end of files.........................................................Passed
trim trailing whitespace.................................................Passed
detect aws credentials...................................................Passed
detect private key.......................................................Passed
AWS CloudFormation Linter................................................Failed
- hook id: cfn-python-lint
- exit code: 4

W3011 Both UpdateReplacePolicy and DeletionPolicy are needed to protect Resources/PublicHostedZone from deletion
core/deploy/dns-zones/template.yaml:20:3

Checkov..............................................(no files to check)Skipped
- hook id: checkov
```

To remove the pre-commit hooks should there be an issue
```
pre-commit uninstall
```
