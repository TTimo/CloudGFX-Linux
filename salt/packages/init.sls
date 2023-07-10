update_packages:
  pkg.uptodate:
    - refresh: True

# spent way too much time setting this up nicely, to find that it will still fail due to https://github.com/saltstack/salt/issues/60276
#{% for group in [ "workstation-product-environment", "kde-desktop-environment", "developer-workstation-environment", "games" ] %}
#install_{{ group }}:
#  pkg.group_installed:
#    - name: {{ group }}
#{% endfor %}

# workaround:
install_groups_workaround:
  cmd.run:
    - name: "dnf install -y @workstation-product-environment @kde-desktop-environment @developer-workstation-environment @games"

packages:
  pkg.installed:
    - pkgs:
      - tigervnc-server
