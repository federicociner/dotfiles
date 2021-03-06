# Source .bashrc
[[ ~/.bashrc ]] && source ~/.bashrc

# Bash-completion via Homebrew (brew install bash-completion)
[ -f /usr/local/etc/bash_completion ] && . /usr/local/etc/bash_completion

# ----------------------- System-specific ---------------------------
# Java
export JAVA_HOME=$(/usr/libexec/java_home)

# Python
export REQUESTS_CA_BUNDLE=/etc/ssl/certs/ca-certificates.crt

# CNTLM Proxy for CBA
export http_proxy=http://127.0.0.1:3128
export https_proxy=$http_proxy
export HTTP_PROXY=$http_proxy
export HTTPS_PROXY=$http_proxy

# Vault
export VAULT_ADDR=https://vault.ai.cba

# ----------------- SBT with internal Artifactory -------------------
# Use internal Artifactory
JVM_OPTS="-Dsbt.override.build.repos=true -Dsbt.boot.credentials=/Users/cinerfe/.sbt/.credentials -Dsbt.repository.config=/Users/cinerfe/code/cba/tooling.repositories/repositories"
SBT_OPTS="-Dsbt.override.build.repos=true -Dsbt.boot.credentials=/Users/cinerfe/.sbt/.credentials -Dsbt.repository.config=/Users/cinerfe/code/cba/tooling.repositories/repositories"

# Add CA certs store for JVM
JVM_OPTS="$JVM_OPTS -Djavax.net.ssl.trustStore=/Library/Java/JavaVirtualMachines/jdk1.8.0_191.jdk/Contents/Home/jre/lib/security/cacerts"

# Performance options handy for SBT
JVM_OPTS="$JVM_OPTS -Xms2g -Xmx3g"
SBT_OPTS="$SBT_OPTS -Xms2g -Xmx3g"
JVM_OPTS="$JVM_OPTS -XX:+CMSClassUnloadingEnabled -XX:+UseConcMarkSweepGC"
SBT_OPTS="$SBT_OPTS -XX:+CMSClassUnloadingEnabled -XX:+UseConcMarkSweepGC"

# Misc options
JVM_OPTS="$JVM_OPTS -Djava.io.tmpdir=$HOME/src/tmp -Dfile.encoding=UTF8"
SBT_OPTS="$SBT_OPTS -Dfile.encoding=UTF8"

export JVM_OPTS
export SBT_OPTS
