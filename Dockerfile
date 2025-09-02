FROM ubuntu AS hw_build
WORKDIR /BUILD
COPY dummy_serv.c .
RUN apt-get update
RUN apt-get install -y gcc bash git python3.7
RUN gcc -o dummyserv -static dummy_serv.c
RUN ls -lh /BUILD

# FROM scratch AS hw_sratch
# COPY --from=hw_build /BUILD/dummyserv /dummyserv
# CMD ["/dummyserv", "12344"]
CMD ["/BUILD/dummyserv", "12344"]
EXPOSE 12344
