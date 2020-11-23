[![Build Status](https://travis-ci.com/M99/PGR301_10009_infrastructure.svg?token=9rUAuyK5rhXyo46pbgfm&branch=master)](https://travis-ci.com/M99/PGR301_10009_infrastructure)

## Travis/Terraform
1. Google Cloud Project
    - Om det ikke har blitt gjort allerede, så må et prosjekt opprettes. Prosjektet trenger Container Registry, Cloud Storage og Cloud Run aktivert.
2. Service Account
    - En Service Account må lages. Denne skal ha rollene: Cloud Storage Admin, Container Registry Service Agent, Cloud Run Service Agent.
    - En .json nøkkel for service accounten må lastes ned/lages og bli navngitt `terraform.json`. Denne skal plasseres i rot-mappen.
3. Google Cloud Storage Bucket
    - En storage bucket må opprettes.
    - På linje 14 i `provider.tf` må bucket-navnet erstattes med navnet til den du nettopp lagde.
4. Kryptering
    - Logg in via Travis CLI.
    - Kjør følgende kommandoer kjøres:
    ```
    travis encrypt GCP_PROJECT_ID=<project-id> --add env.global
    travis encrypt LOGZ_TOKEN=<logzioToken> --add env.global
    travis encrypt LOGZ_URL=<logzioUrl> --add env.global
    travis encrypt STATUSCAKE_USERNAME=<statuscake-username> --add env.global
    travis encrypt STATUSCAKE_APIKEY=<statuscake-apikey> --add env.global
    travis encrypt-file terraform.json
    ```
5. Github
    - Ved commits til main/master vil infrastruktur reflektere koden.