# Docker Bamboo Agent

This is a minimalistic bamboo agent. It can be used as a base to build upon or it can be used with volumes if you build with containers. This also container the latest docker client.

This is an example of how it it can be run and still use containers to build/test.

```
docker run -e BAMBOO_SERVER=http://yourbamboo.domain.com -h bamboo-agent --name bamboo-agent -d -v /bamboo-agent-home:/bamboo-agent-home -v /var/run/docker.sock:/var/run/docker.sock ahromis/bamboo-agent
```

A lot of credit goes to `hwuethrich/docker-images` as this is essentially using a modified version of his `start.sh` script. 