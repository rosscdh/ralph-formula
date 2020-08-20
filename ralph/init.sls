{%- from "ralph/map.jinja" import config with context %}

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

