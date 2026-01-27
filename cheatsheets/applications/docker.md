
# Docker

## Docker Service Status

`sudo systemctl status docker`

## Swarm Cluster Status

`sudo systemctl status docker`


## Docker Swarm Commands

```text
Commands:
  demote      Demote one or more nodes from manager in the swarm
  inspect     Display detailed information on one or more nodes
  ls          List nodes in the swarm
  promote     Promote one or more nodes to manager in the swarm
  ps          List tasks running on one or more nodes, defaults to current node
  rm          Remove one or more nodes from the swarm
  update      Update a node
```

**init**
`docker swarm init --advertise-addr 10.10.125.101`

**join-token**

`docker swarm join-token [OPTIONS] (worker|manager)`

* `docker swarm join-token manager`
* `docker swarm join-token worker`

**leave**
`docker swarm leave --force`

## Docker Node Commands
`docker node`
`docker node ls`
`docker node ps`

## Docker Stack Commands


# Create overlay network
docker network create --scope=swarm --attachable -d overlay "NEW_OVERLAY_NETWORK"
 './_docker_scripts/create_overlay_network.sh' "NEW_OVERLAY_NETWORK"
./_docker_scripts/bounce-prod.sh