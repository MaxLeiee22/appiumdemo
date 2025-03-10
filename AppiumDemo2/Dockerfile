# Base image
FROM node:16

# Set working directory
WORKDIR /app
COPY . .

# Set Android version and home directory
ENV ANDROID_VERSION=30
ENV ANDROID_HOME="/opt/android-sdk"
ENV PATH="${PATH}:${ANDROID_HOME}/cmdline-tools/latest/bin:${ANDROID_HOME}/platform-tools"


# Install dependencies
RUN apt-get update && apt-get install -y openjdk-11-jdk wget unzip curl

# Download and set up Android SDK command-line tools
RUN wget https://dl.google.com/android/repository/commandlinetools-linux-11076708_latest.zip -O /tmp/tools.zip && \
    mkdir -p /opt/android-sdk/cmdline-tools && \
    unzip /tmp/tools.zip -d /opt/android-sdk/cmdline-tools && \
    mv /opt/android-sdk/cmdline-tools/cmdline-tools /opt/android-sdk/cmdline-tools/latest && \
    rm -rf /tmp/tools.zip

# Set environment variables
ENV ANDROID_HOME="/opt/android-sdk"
ENV PATH="${PATH}:${ANDROID_HOME}/cmdline-tools/latest/bin:${ANDROID_HOME}/platform-tools"


# Install Android SDK components for Android 11 only
RUN yes | sdkmanager --licenses || true
RUN yes | ${ANDROID_HOME}/cmdline-tools/latest/bin/sdkmanager --licenses || true
RUN ${ANDROID_HOME}/cmdline-tools/latest/bin/sdkmanager --verbose \
    "platform-tools" \
    "platforms;android-30" \
    "build-tools;30.0.3" \
    "system-images;android-30;google_apis;x86_64" || true
    

# Install Android Emulator and other dependencies (optional)
RUN sdkmanager "emulator" "tools" || true

# Install Appium globally as root
RUN npm install -g appium@next --unsafe-perm=true --allow-root

# Install UiAutomator2 driver globally as root
RUN npx appium driver install uiautomator2 --debug --loglevel verbose || true

# Optionally install appium-doctor to verify setup
RUN npm install -g appium-doctor --unsafe-perm=true --allow-root

# Expose port for Appium server
EXPOSE 4725

# Start Appium server
CMD ["appium"]
