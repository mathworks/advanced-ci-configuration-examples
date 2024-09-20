# Advanced Continuous Integration (CI) Configuration Examples for MATLAB

This repository includes examples of advanced workflows in MATLAB<sup>&reg;</sup> for common CI platforms. For example, you can use these templates to package and distribute toolboxes across multiple Operating Systems or to build and deploy standalone applications for multiple MATLAB releases using Matrix Strategy. The repository includes all necessary source code, tests, and configuration files for each workflow and CI platform, ensuring setting up MATLAB to work with the CI system and execute specific MATLAB workflows.

It includes examples for these platforms:
* [Azure<sup>&reg;</sup> DevOps](https://marketplace.visualstudio.com/items?itemName=MathWorks.matlab-azure-devops-extension)
* [CircleCI<sup>&reg;</sup>](https://circleci.com/developer/orbs/orb/mathworks/matlab)
* [GitHub<sup>&reg;</sup> Actions](https://github.com/matlab-actions)
* [Jenkins&trade;](https://plugins.jenkins.io/matlab/)

For starter workflows, use the [`ci-configuration-examples`](https://github.com/mathworks/ci-configuration-examples) repository instead.

<br>

# Workflows

The repository includes these 2 workflows— 

- **Package and Distribute Toolbox**: Compile, link, and test your C source files across multiple operating systems to produce a binary MEX file in a single job execution. Bundle the resulting binaries into a toolbox and distribute it as a GitHub release.

    To access the configuration files for this workflow, follow the links in this table.
    | **Platform**                        | **File Path**                                                                                                                                       |
    |--------------------------------------|-------------------------------------------------------------------------------------------------------------------------------------------------------|
    | `Azure DevOps`| [AzureDevOps/ToolboxDistribution.yml](https://github.com/tsharmaMW/ci-configuration-examples/blob/main/AzureDevOps/ToolboxDistribution.yml) |
    | `CircleCI`| [.circleci/ToolboxDistribution.yml](https://github.com/tsharmaMW/ci-configuration-examples/blob/main/.circleci/ToolboxDistribution.yml) |
    | `GitHub Actions`| [.github/workflows/ToolboxDistribution.yml](https://github.com/tsharmaMW/ci-configuration-examples/blob/main/.github/workflows/ToolboxDistribution.yml) |
    | `Jenkins` | [Jenkins/ToolboxDistribution.yml](https://github.com/tsharmaMW/ci-configuration-examples/blob/main/Jenkins/ToolboxDistribution.yml) |

- **Build and Deploy Standalone Application**: Automate the building and deployment of MATLAB standalone applications across multiple operating systems. Install specific MATLAB releases and compile MATLAB functions for deployment using the MATLAB Compiler SDK. Store the compiled standalones as artifacts, ensuring compatibility and efficiency in generating deployable applications.

    To access the configuration files for this workflow, follow the links in this table.
    | **Platform**                        | **File Path**                                                                                                                                       |
    |--------------------------------------|-------------------------------------------------------------------------------------------------------------------------------------------------------|
    | `Azure DevOps`| [AzureDevOps/CrossPlatformBuilder.yml](https://github.com/tsharmaMW/ci-configuration-examples/blob/main/AzureDevOps/CrossPlatformBuilder.yml) |
    | `CircleCI`| [.circleci/CrossPlatformBuilder.yml](https://github.com/tsharmaMW/ci-configuration-examples/blob/main/.circleci/CrossPlatformBuilder.yml) |
    | `GitHub Actions`| [.github/workflows/CrossPlatformBuilder.yml](https://github.com/tsharmaMW/ci-configuration-examples/blob/main/.github/workflows/CrossPlatformBuilder.yml) |
    | `Jenkins` | [Jenkins/CrossPlatformBuilder.yml](https://github.com/tsharmaMW/ci-configuration-examples/blob/main/Jenkins/CrossPlatformBuilder.yml) |

<br>

## Get Started

Here's how to quickly get this repository running on a CI system:
1. Fork the repository to your own GitHub account.
2. Go to one of the supported CI platforms and install the available MATLAB CI plugin (GitHub Actions does not require this step).
3. Create a new CI job using your forked repository. To ensure your configuration file is recognized by the CI platform, you need to specify which file to use based on the workflow you intend to run.
4. Enjoy using MATLAB with CI!

That's really it!

<br>

## Licensing
Product licensing for your workflow depends on your project visibility as well as the type of products to set up:

- Public project — If your workflow does not include transformation products, such as MATLAB Coder and MATLAB Compiler, then the action automatically licenses any products that you set up. If your workflow includes transformation products, you can request a [MATLAB batch licensing token](https://github.com/mathworks-ref-arch/matlab-dockerfile/blob/main/alternates/non-interactive/MATLAB-BATCH.md#matlab-batch-licensing-token) by submitting the [MATLAB Batch Licensing Pilot](https://www.mathworks.com/support/batch-tokens.html) form.
- Private project — The action does not automatically license any products for you. You can request a batch licensing token by submitting the [MATLAB Batch Licensing Pilot](https://www.mathworks.com/support/batch-tokens.html) form.

<br>

## See Also
- [Continuous Integration (CI) configuration examples for MATLAB](https://github.com/mathworks/ci-configuration-examples)
- [Continuous Integration with MATLAB and Simulink<sup>&reg;</sup>](https://www.mathworks.com/solutions/continuous-integration.html)

## Contact Us
If you have any questions or suggestions, contact MathWorks at [continuous-integration@mathworks.com](mailto:continuous-integration@mathworks.com).