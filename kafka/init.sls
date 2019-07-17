kafka-pkg-setup:
  pkgrepo.managed:
    - name: deb [arch=amd64] http://packages.confluent.io/deb/5.1 stable main
    - file: /etc/apt/sources.list.d/kafka.list
    - key_url: http://packages.confluent.io/deb/5.1/archive.key
    - require_in:
      - pkg: confluent-kafka-2.11

  pkg.installed:
    - name: confluent-kafka-2.11
    - refresh: True

kafka-user:
  user.present:
    - name: kafka
    - gid_from_name: True
    - system: True

/var/log/kafka:
  file.directory:
    - user: kafka
    - group: kafka
