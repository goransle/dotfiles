cp -R ~/.config/nvim ./;
cp ~/.zshrc ./;
# cp -R ~/.vim ./;
cp -R ~/bunches ./;

git add .;
git commit -m "Pushed `date`";
git push origin master;
