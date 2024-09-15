FROM gcc:9

WORKDIR /app

COPY . .

RUN apt-get update && apt-get install -y --no-install-recommends \
    wget \
    python3.9 \
    python3-pip \
    libc6-dev \
    libz-dev \
    && apt-get clean

RUN wget https://github.com/Nextomics/NextPolish/releases/download/v1.4.1/NextPolish.tgz

RUN pip install paralleltask

RUN tar -vxzf NextPolish.tgz
RUN cd NextPolish && make

CMD ["nextPolish"]