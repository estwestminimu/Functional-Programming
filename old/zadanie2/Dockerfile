FROM ubuntu:24.04

#OBRAZ DOCKEROWY Z OSTATIN LTS KTÓRY MA W SOBIE 
#JAVE 8
#SCAL 
#HASKELL 
#SBT
#WRZUCIĆ obraz do dockerhub - link do tego


#NOWE polecenie
# - Java 8 - check
# - Python 3 - check - zainstalowany domyślnie
# - Scala (dowolna wersja) - check
# - sbt - check
# - vim - check


RUN apt-get update

#Java
RUN apt-get update && apt-get install -y openjdk-8-jdk

#scala
#error missing package fix
RUN apt-get install -y libjansi-java
RUN apt-get install -y scala


#sbt
RUN  apt-get update
RUN  apt-get install apt-transport-https curl gnupg -yqq
RUN echo "deb https://repo.scala-sbt.org/scalasbt/debian all main" |  tee /etc/apt/sources.list.d/sbt.list
RUN echo "deb https://repo.scala-sbt.org/scalasbt/debian /" |  tee /etc/apt/sources.list.d/sbt_old.list
RUN curl -sL "https://keyserver.ubuntu.com/pks/lookup?op=get&search=0x2EE0EA64E40A89B84B2DF73499E82A75642AC823" |  gpg --no-default-keyring --keyring gnupg-ring:/etc/apt/trusted.gpg.d/scalasbt-release.gpg --import
RUN  chmod 644 /etc/apt/trusted.gpg.d/scalasbt-release.gpg
RUN  apt-get update
RUN  apt-get install -y sbt
#sbt --version


#vim
RUN apt-get install -y vim 


#haskell
# #remove libffi6 libncurses5 libtinfo5
# RUN apt-get install -y build-essential curl libffi-dev libgmp-dev libgmp10 libncurses-dev
# RUN curl --proto '=https' --tlsv1.2 -sSf https://get-ghcup.haskell.org | sh
# #zmienen srodowiskowe
# ENV PATH="/root/.ghcup/bin:$PATH"
# #ghc --version



#Szymon Tomaszewski
