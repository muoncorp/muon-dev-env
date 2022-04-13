FROM ubuntu:20.04

# Install packages
RUN apt-get update
RUN DEBIAN_FRONTEND=noninteractive TZ=Asia/Seoul \
    apt-get install -y tzdata curl build-essential libssl-dev pkg-config git

# User add
RUN useradd -m -d /home/muon -s /bin/fish -G sudo -u 1000 muon

# Preparing files
RUN mkdir -p /home/muon/muon-dev-env
COPY --chown=muon:muon step1_rust.sh /home/muon/muon-dev-env/
COPY --chown=muon:muon step2_starship.sh /home/muon/muon-dev-env/
COPY --chown=muon:muon step3_node.sh /home/muon/muon-dev-env/

# Set up develeopment environments
USER muon
RUN /home/muon/muon-dev-env/step1_rust.sh
RUN . $HOME/.cargo/env; /home/muon/muon-dev-env/step2_starship.sh
RUN /home/muon/muon-dev-env/step3_node.sh

# Finish
WORKDIR /home/muon
CMD /bin/bash --login
