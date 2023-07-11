/home/fedora/.config/systemd/user/x0vncserver.service:
  file.managed:
    - source: salt://x0vncserver/files/x0vncserver.service
    - user: fedora
    - group: fedora
    - makedirs: True

# equivalent to 'systemctl --user enable x0vncserver'
# see https://github.com/saltstack/salt/issues/40887
/home/fedora/.config/systemd/user/default.target.wants/x0vncserver.service:
  file.symlink:
    - target: /home/fedora/.config/systemd/user/x0vncserver.service
    - makedirs: True

/home/fedora/.vnc:
  file.directory:
    - user: fedora
    - group: fedora

/home/fedora/.vnc/password:
  cmd.run:
    - name: 'cat /tmp/password | vncpasswd -f > /home/fedora/.vnc/passwd'

fix-vnc-permissions:
  cmd.run:
    - name: 'chown fedora:fedora /home/fedora/.vnc/passwd'
