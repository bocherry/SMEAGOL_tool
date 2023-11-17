# SMEAGOL

 <img src="SMEAGOL_logo.png" width="50%" />

Companion repository of submission "SMEAGOL: MongoDB code smells static detection" for [SANER2024 Tool Demo Track](https://conf.researchr.org/track/saner-2024/saner-2024-tool-demo-track-)

- [Source code](src/README.md)
- [Code smells examples](examples/README.md)
- [Definition and Detection rules](definitions/README.md)
- [Evaluation data](evaluation/analysis.ipynb)

## Usage

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

### Docker

A CodeQL docker [image](https://github.com/microsoft/codeql-container) has been proposed by Microsoft.

You can install it via docker pull
`$ docker pull mcr.microsoft.com/cstsectools/codeql-container`
or by building the container
<code>$ git clone https://github.com/microsoft/codeql-container
cd codeql-container
docker build . -f Dockerfile -t codeql-container</code>

To compile the project:
`$ docker run --rm --name codeql-container -v path/to/project:/opt/src -v path/to/directoryDB:/opt/results -e CODEQL_CLI_ARGS="database create -l=javascript /opt/results/source_db -s /opt/src" mcr.microsoft.com/cstsectools/codeql-container `
where path/to/project is the filepath to your project and path/to/directoryDB is the directory where you want to place the codeql database of you project.
