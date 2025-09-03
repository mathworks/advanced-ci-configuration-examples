# Advanced Continuous Integration (CI) Configuration Examples for MATLAB

This repository includes examples of advanced workflows in MATLAB<sup>&reg;</sup> for common CI platforms. For example, you can use matrix-build templates to package and distribute toolboxes across operating systems or build and deploy standalone applications for multiple MATLAB releases. The repository includes all the required source code, tests, and configuration files for each workflow and CI platform.

This repository provides workflow examples for these platforms:
* [Azure<sup>&reg;</sup> DevOps](https://marketplace.visualstudio.com/items?itemName=MathWorks.matlab-azure-devops-extension)
* [CircleCI<sup>&reg;</sup>](https://github.com/mathworks/matlab-circleci-orb/blob/master/README.md)
* [GitHub<sup>&reg;</sup> Actions](https://github.com/matlab-actions)
* [Jenkins&trade;](https://plugins.jenkins.io/matlab/)

For starter workflows, use the [`ci-configuration-examples`](https://github.com/mathworks/ci-configuration-examples) repository instead.

<br>

# Workflows

The repository contains examples for packaging and distributing a toolbox, as well as building and uploading Python<sup>&reg;</sup> packages.

- **Package and Distribute Toolbox**: Using a matrix build across multiple platforms, compile, link, and test your C source files to produce a binary MEX file per operating system. Then, bundle the resulting binaries into a toolbox and distribute it as a GitHub release.

    To access the configuration files for this workflow, follow the links in this table.
    | **Platform**                        | **File Path**                                                                                                                                       |
    |--------------------------------------|-------------------------------------------------------------------------------------------------------------------------------------------------------|
    | Azure DevOps| [`AzureDevOps/ToolboxDistribution.yml`](https://github.com/mathworks/advanced-ci-configuration-examples/blob/main/AzureDevOps/ToolboxDistribution.yml) |
    | CircleCI| [`.circleci/ToolboxDistribution.yml`](https://github.com/mathworks/advanced-ci-configuration-examples/blob/main/.circleci/ToolboxDistribution.yml) |
    | GitHub Actions| [`.github/workflows/ToolboxDistribution.yml`](https://github.com/mathworks/advanced-ci-configuration-examples/blob/main/.github/workflows/ToolboxDistribution.yml) |
    | Jenkins | [`Jenkins/ToolboxDistribution/Jenkinsfile`](https://github.com/mathworks/advanced-ci-configuration-examples/blob/main/Jenkins/ToolboxDistribution/Jenkinsfile) |

- **Build and Upload Python Packages**: Using a matrix build across multiple platforms and MATLAB releases, build python packages by compiling MATLAB functions (requires MATLAB Compiler SDK&trade;) and upload the resulting packages as artifacts.

    To access the configuration files for this workflow, follow the links in this table.
    | **Platform**                        | **File Path**                                                                                                                                       |
    |--------------------------------------|-------------------------------------------------------------------------------------------------------------------------------------------------------|
    | Azure DevOps| [`AzureDevOps/CrossPlatformBuilder.yml`](https://github.com/mathworks/advanced-ci-configuration-examples/blob/main/AzureDevOps/CrossPlatformBuilder.yml) |
    | CircleCI| [`.circleci/CrossPlatformBuilder.yml`](https://github.com/mathworks/advanced-ci-configuration-examples/blob/main/.circleci/CrossPlatformBuilder.yml) |
    | GitHub Actions| [`.github/workflows/CrossPlatformBuilder.yml`](https://github.com/mathworks/advanced-ci-configuration-examples/blob/main/.github/workflows/CrossPlatformBuilder.yml) |
    | Jenkins | [`Jenkins/CrossPlatformBuilder/Jenkinsfile`](https://github.com/mathworks/advanced-ci-configuration-examples/blob/main/Jenkins/CrossPlatformBuilder/Jenkinsfile) |

<br>

## Get Started

Here's how to quickly get this repository running on a CI system:
1. Fork the repository to your own GitHub account.
2. Go to one of the supported CI platforms and install the available CI integration for MATLAB. (GitHub Actions does not require this step.)
3. Create a new CI job using your forked repository. You need to specify which file to use based on the workflow you intend to run.
4. Enjoy using MATLAB with CI!

That's really it!

<br>

## Licensing
Product licensing for your workflow depends on your project visibility as well as the types of products the workflow uses:

- Public project — The CI integration for MATLAB automatically licenses all products for you, except for transformation products, such as MATLAB Coder&trade; and MATLAB Compiler&trade;.
- Private project — The CI integration does not automatically license any products for you. 

To license products that are not automatically licensed, you can request a [MATLAB batch licensing token](https://github.com/mathworks-ref-arch/matlab-dockerfile/blob/main/alternates/non-interactive/MATLAB-BATCH.md#matlab-batch-licensing-token) by submitting the [MATLAB Batch Licensing Pilot](https://www.mathworks.com/support/batch-tokens.html) form. Batch licensing tokens are strings that enable MATLAB to start in noninteractive environments.

<br>

## See Also
- [Continuous Integration (CI) configuration examples for MATLAB](https://github.com/mathworks/ci-configuration-examples)
- [Continuous Integration with MATLAB and Simulink<sup>&reg;</sup>](https://www.mathworks.com/solutions/continuous-integration.html)

<br>

## Feedback and Support
If you encounter a product licensing issue, consider requesting a MATLAB batch licensing token to use in your workflow. For more information, see [Licensing](#licensing).

If you have an enhancement request or other feedback, create an issue on the [Issues](https://github.com/mathworks/advanced-ci-configuration-examples/issues) page.

For support, contact [MathWorks Technical Support](https://www.mathworks.com/support/contact_us.html).
