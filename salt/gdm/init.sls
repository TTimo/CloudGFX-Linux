/etc/gdm/custom.conf:
  file.managed:
    - source: salt://gdm/files/custom.conf

'systemctl enable gdm':
  cmd.run

'systemctl set-default graphical.target':
  cmd.run

'systemctl isolate graphical.target':
  cmd.run
