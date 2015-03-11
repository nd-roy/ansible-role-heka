Heka
====

[![Build Status](https://travis-ci.org/AbdoulNdiaye/ansible-role-heka.svg)](https://travis-ci.org/AbdoulNdiaye/ansible-role-heka)

Heka is a tool for collecting and collating data from a number of different sources, performing "in-flight" processing of collected data, and delivering the results to any number of destinations for further analysis.

This is an ansible project to configure Heka with Symfony2 applications.

Requirements
------------

None.

Role Variables
--------------

List of default values
    
    ---
    heka_hekad_dir: /etc/hekad.d
    heka_hekad_log_file: /var/log/hekad.log
    heka_hekad_cache_dir: /var/cache/hekad
    heka_hekad_lua_dir: "{{ heka_hekad_dir }}/lua"
    
    heka_dashboard_output_port: 4352
    
    heka_hekad_pid_dir: /var/run/hekad.d
    heka_hekad_pid_file: main.pid
    
    heka_decoders:
      - { type: monolog }
    
    heka_inputs:
      - udp_monolog_input:
        type: monolog_udp
        name: monolog_udp_main
    
    heka_outputs:
      - dashboard_output:
        type: dashboard
        name: dashboard_main
        port: "{{ heka_dashboard_output_port }}"
    
      - elastic_search_output:
        type: elastic_search
        name: elastic_search_main



Dependencies
------------

None.

Example Playbook
----------------

To try the role : ansible-galaxy install AbdoulNdiaye.heka

    - hosts: servers
      roles:
         - { role: AbdoulNdiaye.heka }

License
-------

MIT

Author Information
------------------

Abdoul N'Diaye [@AbdoulNdiaye](https://twitter.com/AbdoulNDiaye)

Contact : <abdoul.nd@gmail.com>

