andrewrothstein.nerdctl
=========

![Build Status](https://github.com/andrewrothstein/ansible-nerdctl/actions/workflows/build.yml/badge.svg)

Installs [nerdctl](https://github.com/containerd/nerdctl).

Requirements
------------

See [meta/main.yml](meta/main.yml)

Role Variables
--------------

See [defaults/main.yml](defaults/main.yml)

Dependencies
------------

See [meta/main.yml](meta/main.yml)

Example Playbook
----------------

```yml
- hosts: servers
  roles:
    - andrewrothstein.nerdctl
```

License
-------

MIT

Author Information
------------------

Andrew Rothstein <andrew.rothstein@gmail.com>
