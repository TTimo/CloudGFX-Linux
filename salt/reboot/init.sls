# stuffed this one here
"cat /tmp/password | passwd --stdin fedora":
  cmd.run

# gdm reports "Gdm: GdmDisplay: Session never registered, failing"
# I have not found a way to fix this other than a reboot
# Reboots are nasty business in salt, trying to use system.reboot ends with an error from terraform
# So we try our best to kick this off in the background

/root/wrap-reboot.sh:
  file.managed:
    - source: salt://reboot/files/wrap-reboot.sh
    - mode: '0755'

/root/wait-and-reboot.sh:
  file.managed:
    - source: salt://reboot/files/wait-and-reboot.sh
    - mode: '0755'

yolo:
  cmd.run:
    - name: /root/wrap-reboot.sh
    - bg: True
