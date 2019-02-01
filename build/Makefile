VERSION := 'na'

clean:
	rm OPNsense-*.iso

opnsense-vagrant: VERSION := 19.1
opnsense-vagrant: SHASUM := 58bf2f0ae7948791589cd11727a5daa270bf00f655d8defe0a43140d920e8065
opnsense-vagrant:
	[[ -e "OPNsense-$(VERSION)-OpenSSL-dvd-amd64.iso" ]] || (wget https://opnsense.c0urier.net/releases/$(VERSION)/OPNsense-$(VERSION)-OpenSSL-dvd-amd64.iso.bz2 && bunzip2 OPNsense-$(VERSION)-OpenSSL-dvd-amd64.iso.bz2)
	packer build -var "iso_sha256_checksum=$(SHASUM)" -var "iso_url=OPNsense-$(VERSION)-OpenSSL-dvd-amd64.iso" opnsense-vagrant.json


opnsense-19.1: VERSION := 19.1
opnsense-19.1: SHASUM := 58bf2f0ae7948791589cd11727a5daa270bf00f655d8defe0a43140d920e8065
opnsense-19.1:
	[[ -e "OPNsense-$(VERSION)-OpenSSL-dvd-amd64.iso" ]] || (wget https://opnsense.c0urier.net/releases/$(VERSION)/OPNsense-$(VERSION)-OpenSSL-dvd-amd64.iso.bz2 && bunzip2 OPNsense-$(VERSION)-OpenSSL-dvd-amd64.iso.bz2)
	packer build -var "iso_sha256_checksum=$(SHASUM)" -var "iso_url=OPNsense-$(VERSION)-OpenSSL-dvd-amd64.iso" opnsense.json

opnsense-18.7: VERSION := 18.7
opnsense-18.7: SHASUM := 63c80d66c4de4eaf7c4d98976855112ad097f63dac06ba59a55fa40496de384a
opnsense-18.7:
	[[ -e "OPNsense-$(VERSION)-OpenSSL-dvd-amd64.iso" ]] || (wget https://opnsense.c0urier.net/releases/$(VERSION)/OPNsense-$(VERSION)-OpenSSL-dvd-amd64.iso.bz2 && bunzip2 OPNsense-$(VERSION)-OpenSSL-dvd-amd64.iso.bz2)
	packer build -var "iso_sha256_checksum=$(SHASUM)" -var "iso_url=OPNsense-$(VERSION)-OpenSSL-dvd-amd64.iso" opnsense-18.7.json

opnsense-18.1: VERSION := 18.1
opnsense-18.1: SHASUM := 58ccaf06aa7d14b13d3462a6aa157c265962313c040b6d033ea76546340670e2
opnsense-18.1:
	[[ -e "OPNsense-$(VERSION)-OpenSSL-dvd-amd64.iso" ]] || (wget https://opnsense.c0urier.net/releases/$(VERSION)/OPNsense-$(VERSION)-OpenSSL-dvd-amd64.iso.bz2 && bunzip2 OPNsense-$(VERSION)-OpenSSL-dvd-amd64.iso.bz2)
	packer build -var "iso_sha256_checksum=$(SHASUM)" -var "iso_url=OPNsense-$(VERSION)-OpenSSL-dvd-amd64.iso" opnsense-18.1.json