{%- from "ralph/map.jinja" import config with context %}

install_compose:
  pip.install:
  - name: docker-compose

{{ config.location }}:
  file.directory:
    - mode: 755
    - makedirs: True

ralph_env_file:
  file.managed:
  - name: {{ config.location }}/.env
  - source: salt://ralph/files/.env.jinja2
  - template: jinja

ralph_compose_file:
  file.managed:
  - name: {{ config.location }}/docker-compose.yml
  - source: salt://ralph/files/docker-compose.yml.jinja2
  - template: jinja

start_ralph:
  dockercompose.up:
  - name: {{ config.location }}/docker-compose.yml

restart_ralph:
  dockercompose.restart:
  - watch:
    - file: {{ config.location }}/.env
    - file: {{ config.location }}/docker-compose.yml
