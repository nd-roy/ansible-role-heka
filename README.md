Heka
====

__Work in progress.__

Heka is a tool for collecting and collating data from a number of different sources, performing "in-flight" processing of collected data, and delivering the results to any number of destinations for further analysis.

This is an ansible project to configure Heka with Symfony2 applications.

Requirements
------------

None.

Role Variables
--------------

TODO.

Dependencies
------------

None.

Example Playbook
----------------

To try the role : ansible-galaxy install git+git@github.com:AbdoulNdiaye/ansible-role-heka.git --force

    - hosts: servers
      roles:
         - { role: ansible-role-heka }

License
-------

BSD

Author Information
------------------

Abdoul N'Diaye [@AbdoulNdiaye](https://twitter.com/AbdoulNDiaye)

Contact : <abdoul.nd@gmail.com>

