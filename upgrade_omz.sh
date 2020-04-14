cd ~/.oh-my-zsh/custom/plugins/
for dir in */     # list directories in the form "/tmp/dirname/"
do
    dir=${dir%*/}      # remove the trailing "/"
	cd $dir
	git pull
	cd ..
done

cd ~/.oh-my-zsh/custom/themes/
for dir in */     # list directories in the form "/tmp/dirname/"
do
    dir=${dir%*/}      # remove the trailing "/"
	cd $dir
	git pull
	cd ..
done

