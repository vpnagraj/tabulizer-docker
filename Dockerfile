FROM r-base:latest

MAINTAINER VP Nagraj "nagraj@nagraj.net"

RUN apt-get -y update && apt-get install -y \
   default-jdk \
   r-cran-rjava

RUN Rscript -e "install.packages('tabulizer', repos = 'http://cran.rstudio.com')" 

# create output directory
RUN mkdir output

# move run script in
COPY ./run.R /

ENTRYPOINT ["Rscript","--vanilla", "run.R"]
