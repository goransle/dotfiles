cp -R ~/.config/nvim ./nvim;
cp ~/.zshrc ./zshrc;
cp -R ~/.vim ./vim;
git add *;
git commit -m "Pushed `date`";
git push origin master;
