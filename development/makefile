start: checkout vagrant_exists
	vagrant up opnsense  

vagrant_exists:
	@command -v vagrant >/dev/null 2>&1 || { echo >&2 "Please install vagrant https://www.vagrantup.com/downloads.html"; exit 1; }

checkout: 
	[[ -d core ]] || git clone https://github.com/opnsense/core	


stop:
	vagrant stop

rm:	
	vagrant destroy
