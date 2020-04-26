all:
	git add .
	git commit -m "updated website"
	git push origin master
	$(MAKE) -C public
