#!/bin/bash

# Docker helper aliases for {{ project_name }}
# Created and managed by Ansible

{% for name in openstack_docker.alternatives %}
function {{ name }}() {
  docker run --rm --net host \
         -a STDIN -a STDOUT -a STDERR \
         --name {{ name }} \
         --env-file /etc/docker/{{ project_name }}.env \
         -v /etc/{{project_name}}:/etc/{{project_name}} \
         -v /var/log/{{project_name}}:/var/log/{{project_name}} \
         -v {{ cafile }}:{{ cafile }} \
        {{ openstack_docker.registry }}/openstack-{{ project_name }}:{{ openstack_docker.tag }} \
        {{ name }} $@
}
{% endfor %}
