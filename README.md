# VSDM Ersatzbescheinigung FHIR-Profiles

This Repo holds the FHIR Short Hand profile defintions and compiled FHIR Profile Resources for the VSDM Ersatzbescheinigung.

## Table of Contents

- [VSDM Ersatzbescheinigung FHIR-Profiles](#vsdm-ersatzbescheinigung-fhir-profiles)
  - [Table of Contents](#table-of-contents)
  - [About ](#about-)
  - [Getting Started ](#getting-started-)
    - [Installing](#installing)

## About <a name = "about"></a>

This Repo contains the fsh files to the published VSDM Ersatzbescheinigung files on https://simplifier.net/vsdm-ersatzbescheinigung and a script to validate them.

## Getting Started <a name = "getting_started"></a>

1. Clone this project to your local machine.
2. Run the install script once.
3. Work on teh FHIR Profiles build and validate them with the given script.

### Installing

To install the necessary tools run

```bash
sudo ./install_fhir_tools.sh
```

This will install

- Java SDK 17 JRE
- Sushi from <https://github.com/FHIR/sushi>
- dotnet-sdk-3.1
- firely.terminal
- yq yaml-parser

After successfull installation run:

```bash
./validate.sh -is
```

See `../validation_results/` for results.
