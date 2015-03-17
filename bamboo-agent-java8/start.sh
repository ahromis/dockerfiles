#!/usr/bin/env bash

set -e # Exit on errors

mkdir -p /data/bamboo-agent-home

# Check if required parameters are set
: ${BAMBOO_SERVER:?"Please use 'docker run -e BAMBOO_SERVER=...' to run this container!"}

echo "-> Starting Bamboo Agent ..."
echo "   - BAMBOO_HOME:   $BAMBOO_HOME"
echo "   - BAMBOO_SERVER: $BAMBOO_SERVER"

BAMBOO_INSTALLER=$BAMBOO_HOME/bamboo-agent-installer.jar
if [ -f $BAMBOO_INSTALLER ]; then
	echo "-> Installer already found at $BAMBOO_INSTALLER. Skipping download."
else
	BAMBOO_INSTALLER_URL=$BAMBOO_SERVER/agentServer/agentInstaller
	echo "-> Downloading installer from $BAMBOO_INSTALLER_URL ..."
	wget --progress=dot:mega $BAMBOO_INSTALLER_URL -O $BAMBOO_INSTALLER
fi

BAMBOO_AGENT=$BAMBOO_HOME/bin/bamboo-agent.sh
if [ ! -f $BAMBOO_AGENT ]; then
	echo "-> Running Bamboo Installer ..."
	java -Dbamboo.home=$BAMBOO_HOME -jar $BAMBOO_INSTALLER $BAMBOO_SERVER/agentServer/ install
fi

# Run the Bamboo agent
$BAMBOO_AGENT console &

# Wait for Bamboo process to terminate
wait $(jobs -p)
