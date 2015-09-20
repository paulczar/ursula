# Support for running openstack projects in docker.

Ursula has experimental support for running the various openstack projects in docker.   We do not recommend ( yet ) running the harder stuff like `nova-compute` and `neutron` in docker,  however projects like `heat` are perfect for it and any examplesin this doc will demonstrate with `heat`.

To see this experimental support in action run `ursula --vagrant envs/example/docker site.yml`

Ursula assumes you built your images with `giftwrap` or wish to.   It will run a docker registry for you ( on controller nodes ) if you set `docker_registry.enabled=True` , but does not currently replicate the registry data dir across both.

To enabled heat to build and run via docker you will set `heat.openstack_install_method=docker`.   There are some docker related defaults in `roles/heat/defaults/main.yml` if you wish to override specific versions or not use the built in registry.

the `openstack-docker` role does all the work prepare a docker image to be run for the given project.

## role/openstack-docker

First it will try and pull the docker image specified in the heat defaults.  If this does not exist then it will attempt to build an image for you with `giftwrap` based on hints provided from the `heat` defaults.
