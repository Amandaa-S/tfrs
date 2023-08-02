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


#RUN apk add git g++ cmake make boost-dev wget unzip zip

#BAZEL
RUN mkdir /workspace
WORKDIR /workspace


RUN wget https://storage.googleapis.com/tensorflow/libtensorflow/libtensorflow-cpu-linux-x86_64-2.6.0.tar.gz
RUN tar -C /workspace -xzf libtensorflow-cpu-linux-x86_64-2.6.0.tar.gz
RUN ldconfig
#RUN export LIBRARY_PATH=$LIBRARY_PATH:~/workspace/libtensorflow-cpu-linux-x86_64-2.6.0.tar.gz/lib
#RUN export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:~/workspace/libtensorflow-cpu-linux-x86_64-2.6.0.tar.gz/lib
# RUN chmod +x protoc-3.9.2-linux-x86_64.zip
# RUN ./protoc-3.9.2-linux-x86_64.zip --user
# RUN export PATH="$PATH:$HOME/bin"
#RUN ./configure --prefix=/home/rangsiman/protobuf-3.9.2/ CXXFLAGS="-D_GLIBCXX_USE_CXX11_ABI=0"

RUN gcc hello_tf.c -ltensorflow -o hello_tf

# WORKDIR /
# RUN git clone https://github.com/serizba/cppflow.git
# WORKDIR /cppflow/examples/load_model
# #RUN g++ -std=c++17 -o main.out main.cpp -ltensorflow
# RUN mkdir build
# WORKDIR /cppflow/examples/load_model/build
# #RUN -DCMAKE_PREFIX_PATH=/workspace/libtensorflow-cpu-linux-x86_64-2.6.0.tar.gz/lib
# RUN cmake ..
# RUN make -j
# RUN make install




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