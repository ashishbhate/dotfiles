#!/bin/bash
# for server use
# rsync -avzHP $TO $FROM
#rsync -avs  /home/ab/Entertainment/ /media/ab/Backups/Entertainment/
rsync -avs --delete /home/ab/AB/ /media/ab/Backups/AB/
cp /home/ab/.bashrc /media/ab/Backups/Dotfiles/
cp /home/ab/.config/nvim/init.vim /media/ab/Backups/Dotfiles/
cp /home/ab/.tmux.conf /media/ab/Backups/Dotfiles/
cp /home/ab/.zshrc /media/ab/Backups/Dotfiles/
