all:
	Rscript -e 'blogdown::build_site'
	git add .
	git commit -m "updated website"
	git push origin master
	$(MAKE) -C public
