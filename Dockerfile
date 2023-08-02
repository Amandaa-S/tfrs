FROM ubuntu

# Install dependencies
RUN apt-get update \
    && apt-get install -y git \
    && apt-get install -y gcc \
    && apt-get install -y cmake \
    && apt-get install -y make \
    && apt-get install -y wget \
    && apt-get install -y zip \
    && apt-get install -y unzip


#BAZEL
RUN mkdir /workspace
WORKDIR /workspace


RUN wget https://storage.googleapis.com/tensorflow/libtensorflow/libtensorflow-cpu-linux-x86_64-2.6.0.tar.gz
RUN tar -C /usr/local -xzf libtensorflow-cpu-linux-x86_64-2.6.0.tar.gz
RUN ldconfig


WORKDIR /
RUN git clone https://github.com/Amandaa-S/tfrs.git
WORKDIR /tfrs
RUN gcc hello_tf.c -ltensorflow -o hello_tf




CMD ["./hello_tf"]


#ROUNDING SAT
# WORKDIR /
# RUN git clone https://gitlab.com/MIAOresearch/software/roundingsat.git
# WORKDIR /roundingsat/
# RUN wget https://soplex.zib.de/download/release/soplex-5.0.1.tgz
# WORKDIR /roundingsat/build
# RUN cmake -DCMAKE_BUILD_TYPE=Release -Dsoplex=ON ..
# RUN make

# Provide RoundingSAT executable as executable to call when starting container
#CMD [ "/roundingsat/build/roundingsat" ]
#ENTRYPOINT [ "/roundingsat/build/roundingsat" ]