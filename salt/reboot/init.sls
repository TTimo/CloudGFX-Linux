# stuffed this one here
"cat /tmp/password | passwd --stdin fedora":
  cmd.run

# gdm reports "Gdm: GdmDisplay: Session never registered, failing"
# I have not found a way to fix this other than a reboot, so mark this such that it happens at the end
system.reboot:
  module.run
