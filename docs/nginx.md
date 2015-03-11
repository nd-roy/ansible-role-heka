Nginx configuration
===================

Simple configuration
--------------------
    
This is the configuration to declare nginx files in heka.

Several files will be agregated :

  - /var/log/nginx/error.log
  - /var/log/nginx/access.log

__Example:__

    heka_decoders:
      - { type: nginx_error, timezone: 'Europe/London' }

    heka_inputs:
      - nginx_access_log_input:
        type: file
        name: nginx_access_main
        file_directory: /var/log/nginx
        file_match: access\.log
        decoder: NginxAccessLogDecoder
    
      - nginx_error_others_log_input:
        type: file
        name: nginx_error_main
        file_directory: /var/log/nginx
        file_match: error\.log
        decoder: NginxErrorLogDecoder


Advanced configuration
----------------------

It is possible to match files with a regex.

All files with a specific pattern will be agregated.

__Example:__

    heka_inputs:
      - nginx_access_custom_log_input:
        type: file
        name: nginx_access_custom
        file_directory: /var/log/nginx
        file_match: "(?P<DomainName>[^/]+)_access\\.log"
        decoder: NginxAccessLogDecoder
        differentiator: ["DomainName"]
    
      - nginx_error_custom_log_input:
        type: file
        name: nginx_error_custom
        file_directory: /var/log/nginx
        file_match: "(?P<DomainName>[^/]+)_error\\.log"
        decoder: NginxErrorLogDecoder
        differentiator: ["DomainName"]
        

In this case, __DomainName__ is the denominator to find your log by domain in kibana.
