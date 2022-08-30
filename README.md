# age-docker-cluster

This repo will spin up a docker based Altair Grid Engine Cluster 2022.1.0. It consists of a dedicated license server (`license`, a head node (`head`) and two compute nodes (`c1` and `c2`). 

RStudio Workbench is running in a separate container (rsw) and has the new AGE Launcher 2022.1.0 pre-configured against the AGE cluster. 

Version of RSW is 2022.07.1-554.pro3. 

## Pre-requisites 

### Altair Grid Engine 

In order to successfully run, one needs to download `ge-2022.1.0-bin-lx-amd64.tar.gz`, `ge-2022.1.0-common.tar.gz` and `ge-2022.1.0-rstudio-age-lx-amd64.tar.gz` into the `age` subfolder. Likewise `altair_licensing_15.1.linux_x64.bin` needs to be downloaded and copied into the `license` subfolder.

Finally a valid license file `age.dat` needs to be deploes into the `license` folder. 

### RStudio Workbench

In the environment launching the `docker-compose.yml`, the environment variable `RSW_LICENSE` must be set to a vaid license key. 

Default user name and password are `rstudio/rstudio`.

## Starting the environment 

First you will need to build the needed containers (this is a one-time activity): 

```
docker-compose build head rsw
```

Once done, you can start via

```
docker-compose up c2 rsw -d 
```

The cluster will then listen at http://localhost:8989 .

## Stopping the environment 
```
docker-compose down
```

It also may be advisable to clean out the volumes by running `scripts/clean-volumes.sh`.

## RSW details

The docker cluster uses a number of volumes for shared storage. For RSW it has set up shared storage for session-data as well as audit-data. 
