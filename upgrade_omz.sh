GREEN="\033[1;32m"
NOCOLOR="\033[0m"

cd ~/.oh-my-zsh/custom/plugins/
for dir in */     # list directories in the form "/tmp/dirname/"
do
    dir=${dir%*/}      # remove the trailing "/"
	cd $dir
  echo "upgrading ${GREEN}$dir${NOCOLOR}"
	git pull
	cd ..
done

cd ~/.oh-my-zsh/custom/themes/
for dir in */     # list directories in the form "/tmp/dirname/"
do
    dir=${dir%*/}      # remove the trailing "/"
	cd $dir
  echo "upgrading ${GREEN}$dir${NOCOLOR}"
	git pull
	cd ..
done

