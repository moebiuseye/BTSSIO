DESTINATION=jeannedhack:/home/www/jeannedhack.org/btssio/public_html

curdate=`date +"%Y-%m-%d"`

clean:
	rm -rf ../BTSSIO.www

noremote:clean
	NOREMOTE=1 skf -r -g ./ ../BTSSIO.www
	./makeopml.sh ../BTSSIO.www \; true

debug:
	skf -d -r -g ./ ../BTSSIO.www

once:clean
	skf -r -g ./ ../BTSSIO.www
	./makeopml.sh ../BTSSIO.www \; true
	rsync --delete-after -r ../BTSSIO.www/ $(DESTINATION)
	ssh jeannedhack 'chown www-data -R /home/www/jeannedhack.org/btssio/public_html'

watch:
	skf -r -w ./ ../BTSSIO.www

blogpost:
	echo "taper le titre:"
	read title ;\
	blogfile="Blog/./posts/$(curdate)-$${title}.md" ;\
	$(EDITOR) "$${blogfile}.tmp" ;\
	read rep ;\
	[ "$${rep}" == "y" ] && mv "$${blogfile}.tmp" "$${blogfile}" 
