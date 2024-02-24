FROM dart
RUN apt-get update
RUN apt-get install -y curl git unzip xz-utils zip libglu1-mesa nano wget
RUN apt-get clean
RUN git clone https://github.com/flutter/flutter.git -b stable --depth 1 /flutter
ENV PATH="/flutter/bin:$PATH"
RUN flutter doctor

#  curl -s "https://get.sdkman.io" | bash
#  source /root/.sdkman/bin/sdkman-init.sh
#  mkdir /android-sdk
#  cd /android-sdk
#  wget https://dl.google.com/android/repository/commandlinetools-linux-10406996_latest.zip
#  unzip commandlinetools-linux-10406996_latest.zip
#  rm commandlinetools-linux-10406996_latest.zip
#  cd cmdline-tools
#  mkdir latest
#  mv * latest
#  sdk install java 17.0.9-oracle
#  echo "export ANDROID_SDK_ROOT='/android-sdk'" >> ~/.bashrc
#  echo "export PATH='$PATH:/android-sdk/cmdline-tools/latest/bin'" >> ~/.bashrc
#  source ~/.bashrc
# sdkmanager --licenses
