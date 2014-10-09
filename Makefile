DESTINATION=jeannedhack:/home/www/jeannedhack.org/btssio/public_html

curdate=`date +"%Y-%m-%d"`

clean:
	rm -rf ../BTSSIO.www

noremote:
	NOREMOTE=1 skf -r -g ./ ../BTSSIO.www

debug:
	skf -d -r -g ./ ../BTSSIO.www

once:
	skf -r -g ./ ../BTSSIO.www
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
