Useful mechanism for testing Ansible configured distributed systems in small fleets of VMs with Vagrant.

Prerequisites:
* virtualbox
* vagrant plugin install vagrant-hostmanager

In my ~/.ssh/config to prevent the re-creation of ssh host keys at each rebuild from causing problems
In a production setting always use StrictHostKeyChecking to ensure ur not getting MITMed
```
Host 192.168.99.* *.vagrant.test
  StrictHostKeyChecking no
  UserKnownHostsFile=/dev/null
  User vagrant
  LogLevel ERROR
```
