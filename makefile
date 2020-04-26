all:
	git add .
	git commit -m "updated website"
	git push origin mater
	cd /public
	git add .
	git commit -m "updated website"
	git push origin gh-pages
	cd ../
