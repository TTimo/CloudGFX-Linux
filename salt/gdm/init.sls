/etc/gdm/custom.conf:
  file.managed:
    - source: salt://gdm/files/custom.conf

'systemctl enable --now gdm':
  cmd.run
