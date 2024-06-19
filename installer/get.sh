#!/bin/sh

# 2024/06/19/ml tested with CorOS:  2.2.2

readonly OPPATH='/media/p4/OpenCortex'
readonly BINDNAME="${OPPATH}/bin"
readonly BREWDNAME="${OPPATH}/ZenBrew"
readonly URI="https://github.com/OpenCortex-Research/ZenBrew/releases/download/V1.0.0"
readonly curlbin="/bin/wget"

test -x ${curlbin} || {
	echo "ERROR: unable t oexecute ${curlbin}"
	exit 99
}

echo "Installing ZenBrew..."
mkdir -p ${OPPATH} && \
mkdir -p ${BINDNAME} && \
mkdir -p ${BREWDNAME} && \
cd ${BINDNAME} && \
rm -f zenbrew && \
${curlbin} ${URI}/zenbrew && \
strings ./zenbrew|grep 'GOARM=' 1>/dev/null 2>&1 || {
	echo "ERROR: failed to download the right binary 'zenbrew' for ARM architecture"
	exit 100
} && \
chmod +x ${BINDNAME}/zenbrew && \
cd ${BREWDNAME} && \
${curlbin} ${URI}/settings.json 2>/dev/null && \
test -z settings.json && {
	echo "ERROR: fiel size of settings.json is zero"
	exit 99
}

cd ${BINDNAME} && \
./zenbrew install zenbrew || {
	echo "ERROR: install failed"
	exit 99
}
