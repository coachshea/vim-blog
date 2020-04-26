all:
	git add .
	git commit -m "updated website"
	git push origin master
	cd /public
	git add .
	git commit -m "updated website"
	git push origin gh-pages
	cd ../
