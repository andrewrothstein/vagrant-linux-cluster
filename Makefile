clean:
	rm -rf pki-dir/
	vagrant destroy -f
	rm -rf ansible-roles/
	rm -rf ansible-factcache/

ping:
	@echo ssh pinging the vms with ansible...
	ansible -m ping vms

converge: ping
	@echo converging the vms...
	ansible-playbook playbook.yml

pki:
	@echo installing ansible pki-requirements.yml
	ansible-galaxy install -f -r pki-requirements.yml
	@echo initializing the pki...
	ansible-playbook ca.yml

init:
	@echo currently installed vagrant plugins:
	vagrant plugin list
	vagrant plugin install vagrant-hostmanager

up:
	@echo who awakens the foomonster?
	$(MAKE) pki
	@echo booting the vms...
	vagrant up
	@echo installing ansible requirements.yml...
	ansible-galaxy install -f -r requirements.yml
	$(MAKE) converge
	@echo the foomonster sleeps soundly
