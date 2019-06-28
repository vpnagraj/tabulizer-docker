# tabulizer docker

Instructions for Docker image with [`tabulizer` R package](https://github.com/ropensci/tabulizer) installed.

## Build

```
chmod+x run.R
docker build -t --no-cache vpnagraj/tabulizer .
```

Alternatively pull [existing image from DockerHub](https://cloud.docker.com/u/vpnagraj/repository/docker/vpnagraj/tabulizer):

```
docker pull vpnagraj/tabulizer
```

## Run

Example: extract a table from page 5 of a file called "some.pdf":

```
mkdir output
# table of interest is on page 5 of some.pdf
infile=some.pdf
docker run -ti \
-v $(pwd)/$infile:/$infile \
-v $(pwd)/output:/output vpnagraj/tabulizer $infile 5
```

Following the example above ... you should see a file called some_5.csv in `output/`.

