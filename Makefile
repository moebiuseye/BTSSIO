
curdate=`date +"%Y-%m-%d"`

clean:
	rm -rf ../BTSSIO.www

noremote:
	skf -r -g ./ ../BTSSIO.www

debug:
	skf -d -r -g ./ ../BTSSIO.www

once:
	skf -r -g ./ ../BTSSIO.www
	#rsync -r ../BTSSIO.www/ $(DESTINATION)

watch:
	skf -r -w ./ ../BTSSIO.www

blogpost:
	echo "taper le titre:"
	read title ;\
	blogfile="Blog/./posts/$(curdate)-$${title}.md" ;\
	$(EDITOR) "$${blogfile}.tmp" ;\
	read rep ;\
	[ "$${rep}" == "y" ] && mv "$${blogfile}.tmp" "$${blogfile}" 
