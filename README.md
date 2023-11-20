# SMEAGOL (SMEll and Antipattern detection for monGOdb appLications)

 <img src="SMEAGOL_logo.png" width="50%" />

Companion repository of submission "SMEAGOL: A Static Code Smell Detector for MongoDB" for [SANER2024 Tool Demo Track](https://conf.researchr.org/track/saner-2024/saner-2024-tool-demo-track-)

- [Source code](src/README.md)
- [Definition and Detection rules](definitions/README.md)
- [Code smells examples](examples/README.md)
- [Evaluation data](evaluation/analysis.ipynb)
- [Demo video](https://youtu.be/h4Xbp9dIFt0)

## Usage

### Docker

We use a forked CodeQL docker [image](https://github.com/bocherry/codeql-container-SMEAGOL) from the one proposed by Microsoft.

For Windows environment, a [WSL](https://learn.microsoft.com/en-us/windows/wsl/install) terminal is advised.

You can install it by building the container

<code>git clone https://github.com/bocherry/codeql-container-SMEAGOL
cd codeql-container-SMEAGOL
docker build . -f Dockerfile -t codeql-container-SMEAGOL</code>

To compile the project:

`$ docker run --rm -v /path/to/project:/opt/src -v /path/to/directoryDB:/opt/codeqlDB -e CODEQL_CLI_ARGS="database create -l=javascript -s=/opt/src /opt/codeqlDB" codeql-container-smeagol`

where /path/to/project is your project directory and /path/to/directoryDB is an empty directory where you want to place the codeql database of you project.

To run SMEAGOL:

`$ docker run -v --rm /path/to/results:/opt/results -v /path/to/directoryDB:/opt/codeqlDB -e CODEQL_CLI_ARGS="database analyze --format=sarif-latest --additional-packs=/opt/SMEAGOL/packages --output=/opt/results/SMEAGOL.sarif /opt/codeqlDB /opt/SMEAGOL/src/SMEAGOL" codeql-container-smeagol`

where /path/to/results is the directory where you want to place the analysis result file which will be named `SMEAGOL.sarif` .

### Locally

First, [install the CodeQL CLI package](https://docs.github.com/en/code-security/codeql-cli/getting-started-with-the-codeql-cli/setting-up-the-codeql-cli#1-download-the-codeql-cli-zip-package) .
Once the installation is complete, first you need to compile the project you run SMEAGOL on.

This is done by running:

`$ codeql database create -l=javascript -s=path/to/project path/to/directoryDB`

where path/to/project is the filepath to your project and path/to/directoryDB is the directory where you want to place the codeql database of you project.

To execute SMEAGOL on your project, run:

`$ codeql database analyze --format=sarif-latest -o=path/to/result/SMEAGOL.sarif path/to/SMEAGOL_tool/src/SMEAGOL`

where path/to/result is the desired location the result file and path/to/SMEAGOL_too is the path to this repository.

You can now open the sarif files, the instances detected lie in the _runs.results_ path

### VS code

There is a [CodeQL extension](https://marketplace.visualstudio.com/items?itemName=GitHub.vscode-codeql) for vs code.

Before using, you still need to compile your project, so refer to one of the above method to install CodeQL and compile your project.

Once CodeQL is setup and your project compiled, you can open the src folder in this repository.
Install the [CodeQL extension](https://marketplace.visualstudio.com/items?itemName=GitHub.vscode-codeql) extension and go to the "QL" panel icon.
In the "Database" section, select "From a folder" and select your compiled project.

Then, under the "SMEAGOL" folder, right-click on the query you would like to run and select "Run Queries in Selected Files".

When the execution is over, you will see a panel with an alert message and hyperlinks to the localizations of the code smells.
