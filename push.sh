cp -R ~/.config/nvim ./;
cp ~/.zshrc ./;
cp -R ~/.vim ./;
git add *;
git commit -m "Pushed `date`";
git push origin master;
