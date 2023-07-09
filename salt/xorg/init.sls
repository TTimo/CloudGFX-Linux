/etc/X11/xorg.conf.d/10-headless.conf:
  file.managed:
    - source: salt://xorg/files/10-headless.conf
