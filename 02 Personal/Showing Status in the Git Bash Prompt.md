---
title: "Showing Status in the Git Bash Prompt"
source: "https://blog.sasworkshops.com/showing-status-in-the-git-bash-prompt/"
author:
  - "[[Samuel Taggart]]"
published: 2021-01-06
created: 2025-10-05
description: "Whenever you use Git there is always this conflict between using a GUI and the Git Bash. They both have their strengths and most people prefer one over the other. I feel like in order to master Git you really need to learn to use both and take advantage of"
tags:
  - "clippings"
---
Whenever you use Git there is always this conflict between using a GUI and the Git Bash. They both have their strengths and most people prefer one over the other. I feel like in order to master Git you really need to learn to use both and take advantage of the strengths of each. The GUIs are really good at presenting a lot of information at once. I just discovered a way of bringing a little bit of that to Git Bash.

## How GUIs Display Information

If we look at SourceTree here, you’ll notice it displays a lot of information. Without typing anything or moving the mouse, you can gain a lot of information just by moving your eyes around the page. You can easily see the commit graph and you can easily see what changes I have made to my working copy and what is staged to be committed. All just by glancing around. Very convenient.

![](https://blog.sasworkshops.com/content/images/wordpress/2020/12/image_2020-12-28_105240-1024x555.png)

SourceTree, like most other Git GUIs excels at displaying a lot of information at once.

## What you get with Git Bash

When using Git Bash, the prompt does tell you the current branch you are on, but that is it. The one piece of information I miss having easily available is the `git status`. The Git status command is amazing. It gives you information about what changes you have made to your working copy and what is staged. It tells you if you are ahead or behind your remote. It also gives you hints as to what commands you might use next.

![](https://blog.sasworkshops.com/content/images/wordpress/2020/12/default-git-bash-prompt.png)

This is the default Git Bash prompt. The only information you get about your Git repository is the current branch which is shown in parenthesis.

Git Status is so useful that I came up with a way to [run it continuously in a separate](https://blog.sasworkshops.com/git-tips-for-beginners/#status) window. I like that approach, particularly for beginners. However having an extra window open in addition to all the extra LabVIEW Windows is cumbersome, so I had gotten away from that. However, I found myself constantly typing in `git status`. There had to be a better way.

![](https://blog.sasworkshops.com/content/images/wordpress/2020/06/gitstatus.png)

Git Status output showing untracked files, modified files, and staged files as well as some hints.

## How ZSH does it

In a recent post I talked about Z shell and how I really liked its command prompt (once you install the powershell10k theme) because it displayed a lot of useful information including the number of modified and staged files and whether you were ahead or behind your remote. With Z shell you get that for free. The downside is while you can run ZSH under WSL, you can’t run it in Git Bash. Interacting with my repos using Linux caused some issues with line endings, so that wasn’t working well for me.

![](https://blog.sasworkshops.com/content/images/wordpress/2020/11/image_2020-11-11_092329-1024x110.png)

Z I SH prompt showing the branch, whether you are ahead or behind and changed and modified files.

## What we can do in Git Bash

A little googling found a gem of an article about how to customize your Git Bash prompt to add some of the information that you get for free in ZSH. Be warned the article is a hard read. It is really detailed and I’m not sure I followed all of it. [Here is the link](https://medium.com/@damianczapiewski/how-to-pimp-up-the-git-bash-prompt-on-windows-without-any-external-stuff-c69eb9ef0125?ref=blog.sasworkshops.com) if want to read more. What I was able to do was grok enough that I could come up with the following (see image below).

![](https://blog.sasworkshops.com/content/images/wordpress/2020/12/Git-Bash.png)

Git Bash with updated prompt which now shows more git satus information.

So my Git Bash prompt now has 5 different sections. Blue is just my username. The 1st yellow section is just the current directory. The purple is the branch name along with whether you are ahead or behind your remote. The yellow section lists unstaged changes in your working copy. It breaks them into 3 parts: untracked files, modified files, and drc which stands for deleted, renamed, or copied. Lastly, it tells you how many files are staged.

This replicates a lot of the information from git status. You still will have to (and should) run git status, but shouldn’t need to do it as often. Often I would add a file and then immediately run git status just to assure myself that it was added. Now I don’t need to do that. I just watch the counter increment.

## Caveat

The counts are only updated when the prompt is written to the terminal. That means it is not live. So if you have a terminal open and then make a bunch of changes in LabVIEW, and go back to the terminal, the numbers shown won’t have changed. They will be stale. The easy solution is to just type clear and it’ll clear the terminal and redraw the prompt with accurate numbers.

## How Do I Set This Up?

Below is the bashrc file I used to setup the prompt. If you want to use it, all you have to do create a.bashrc file in your users directory. It’ll run everytime you start Git Bash. If you want to play around with the colors or anything else, see [the page I mentioned earlier.](https://medium.com/@damianczapiewski/how-to-pimp-up-the-git-bash-prompt-on-windows-without-any-external-stuff-c69eb9ef0125?ref=blog.sasworkshops.com) All the information is there, but it is will require some studying to figure it out.

Just take the content below and put it in a file called.bashrc inside your C:\\Users\\YourUsername folder (which is your ~ folder in Git Bash). Then restart Git Bash and you should notice the change.  
  
NOTE: this is not exactly what is on the linked page. I did customize it a bit.

```
#PS1 - Command Prompt Display Setup
# from https://medium.com/@damianczapiewski/how-to-pimp-up-the-git-bash-prompt-on-windows-without-any-external-stuff-c69eb9ef0125

git_stats() {
  local STATUS=$(git status -s 2> /dev/null)
  local UNTRACKED=$(echo "$STATUS" | grep '^??' | wc -l)
  local STAGED=$(($(echo "$STATUS" | grep '^M ' | wc -l) + $(echo "$STATUS" | grep '^D ' | wc -l) + $(echo "$STATUS" | grep '^R ' | wc -l) + $(echo "$STATUS" | grep '^C ' | wc -l)+$(echo "$STATUS" | grep '^A ' | wc -l)))
  local DRC=$(($(echo "$STATUS" | grep '^ D' | wc -l) + $(echo "$STATUS" | grep '^ R' | wc -l) + $(echo "$STATUS" | grep '^ C' | wc -l)))
  local MODIFIED=$(echo "$STATUS" | grep '^ M' | wc -l)
  local STATS=''
  if [ $UNTRACKED != 0 ]; then
    STATS="\e[43m untr: $UNTRACKED "
  fi
  if [ $MODIFIED != 0 ]; then
    STATS="$STATS\e[43m mod: $MODIFIED "
  fi
  if [ $DRC != 0 ]; then
    STATS="$STATS\e[43m drc: $DRC "
  fi
  if [ $STAGED != 0 ]; then
    STATS="$STATS \e[42m staged: $STAGED "
  fi
  if [ ! -z "$STATS" ]; then
  echo -e "\e[30m $STATS\e[0m"
  fi
}

function origin_dist {
 local STATUS="$(git status 2> /dev/null)"
 local DIST_STRING=""
 local IS_AHEAD=$(echo -n "$STATUS" | grep "ahead")
 local IS_BEHIND=$(echo -n "$STATUS" | grep "behind")
 if [ ! -z "$IS_AHEAD" ]; then
  local DIST_VAL=$(echo "$IS_AHEAD" | sed 's/[^0-9]*//g')
  DIST_STRING="$DIST_VAL AHEAD"
 elif [ ! -z "$IS_BEHIND" ]; then
  local DIST_VAL=$(echo "$IS_BEHIND" | sed 's/[^0-9]*//g')
  DIST_STRING="BEHIND $DIST_VAL"
 fi
 if [ ! -z "$DIST_STRING" ]; then
  echo -en "\e[97;45m $DIST_STRING"
 fi
}
__PS1_BEFORE='\n\n'
__PS1_USER='\[\e[97;104m\] \u '
__PS1_LOCATION='\[\e[30;43m\] \w '
__PS1_GIT_BRANCH='\[\e[97;45m\] \`__git_ps1\` ' __PS1_GIT_STATS='\`git_stats\` '
__PS1_AFTER='\[\e[0m\]\n\n>> '
__PS1_GIT_DIST='\`origin_dist\`'
export PS1="${__PS1_BEFORE}${__PS1_USER}${__PS1_LOCATION}${__PS1_GIT_BRANCH}${__PS1_GIT_DIST}${__PS1_GIT_STATS}${__PS1_AFTER}"

#PS1 - Command Prompt Display Setup
# from https://medium.com/@damianczapiewski/how-to-pimp-up-the-git-bash-prompt-on-windows-without-any-external-stuff-c69eb9ef0125

git_stats() {
  local STATUS=$(git status -s 2> /dev/null)
  local UNTRACKED=$(echo "$STATUS" | grep '^??' | wc -l)
  local STAGED=$(($(echo "$STATUS" | grep '^M ' | wc -l) + $(echo "$STATUS" | grep '^D ' | wc -l) + $(echo "$STATUS" | grep '^R ' | wc -l) + $(echo "$STATUS" | grep '^C ' | wc -l)+$(echo "$STATUS" | grep '^A ' | wc -l)))
  local DRC=$(($(echo "$STATUS" | grep '^ D' | wc -l) + $(echo "$STATUS" | grep '^ R' | wc -l) + $(echo "$STATUS" | grep '^ C' | wc -l)))
  local MODIFIED=$(echo "$STATUS" | grep '^ M' | wc -l)
  local STATS=''
  if [ $UNTRACKED != 0 ]; then
    STATS="\e[43m untr: $UNTRACKED "
  fi
  if [ $MODIFIED != 0 ]; then
    STATS="$STATS\e[43m mod: $MODIFIED "
  fi
  if [ $DRC != 0 ]; then
    STATS="$STATS\e[43m drc: $DRC "
  fi
  if [ $STAGED != 0 ]; then
    STATS="$STATS \e[42m staged: $STAGED "
  fi
  if [ ! -z "$STATS" ]; then
  echo -e "\e[30m $STATS\e[0m"
  fi
}

function origin_dist {
 local STATUS="$(git status 2> /dev/null)"
 local DIST_STRING=""
 local IS_AHEAD=$(echo -n "$STATUS" | grep "ahead")
 local IS_BEHIND=$(echo -n "$STATUS" | grep "behind")
 local DIVERGED=$(echo -n "$STATUS" | grep "diverged")
 if [ ! -z "$IS_AHEAD" ]; then
  local DIST_VAL=$(echo "$IS_AHEAD" | sed 's/[^0-9]*//g')
  DIST_STRING="$DIST_VAL AHEAD"
 elif [ ! -z "$IS_BEHIND" ]; then
  local DIST_VAL=$(echo "$IS_BEHIND" | sed 's/[^0-9]*//g')
  DIST_STRING="BEHIND $DIST_VAL"
 elif [ ! -z "$DIVERGED" ]; then
    DIST_STRING="DIVERGED"
 fi
 if [ ! -z "$DIST_STRING" ]; then
  echo -en "\e[97;45m $DIST_STRING"
 fi
}
__PS1_BEFORE='\n\n'
__PS1_USER='\[\e[97;104m\] \u '
__PS1_LOCATION='\[\e[30;43m\] \w '
__PS1_GIT_BRANCH='\[\e[97;45m\] \`__git_ps1\` ' __PS1_GIT_STATS='\`git_stats\` '
__PS1_AFTER='\[\e[0m\]\n\n>> '
__PS1_GIT_DIST='\`origin_dist\`'
export PS1="${__PS1_BEFORE}${__PS1_USER}${__PS1_LOCATION}${__PS1_GIT_BRANCH}${__PS1_GIT_DIST}${__PS1_GIT_STATS}${__PS1_AFTER}"

#PS1 - Command Prompt Display Setup
# from https://medium.com/@damianczapiewski/how-to-pimp-up-the-git-bash-prompt-on-windows-without-any-external-stuff-c69eb9ef0125

git_stats() {
  local STATUS=$(git status -s 2> /dev/null)
  local UNTRACKED=$(echo "$STATUS" | grep '^??' | wc -l)
  local STAGED=$(($(echo "$STATUS" | grep '^M ' | wc -l) + $(echo "$STATUS" | grep '^D ' | wc -l) + $(echo "$STATUS" | grep '^R ' | wc -l) + $(echo "$STATUS" | grep '^C ' | wc -l)+$(echo "$STATUS" | grep '^A ' | wc -l)))
  local DRC=$(($(echo "$STATUS" | grep '^ D' | wc -l) + $(echo "$STATUS" | grep '^ R' | wc -l) + $(echo "$STATUS" | grep '^ C' | wc -l)))
  local MODIFIED=$(echo "$STATUS" | grep '^ M' | wc -l)
  local STATS=''
  if [ $UNTRACKED != 0 ]; then
    STATS="\e[43m untr: $UNTRACKED "
  fi
  if [ $MODIFIED != 0 ]; then
    STATS="$STATS\e[43m mod: $MODIFIED "
  fi
  if [ $DRC != 0 ]; then
    STATS="$STATS\e[43m drc: $DRC "
  fi
  if [ $STAGED != 0 ]; then
    STATS="$STATS \e[42m staged: $STAGED "
  fi
  if [ ! -z "$STATS" ]; then
  echo -e "\e[30m $STATS\e[0m"
  fi
}

function origin_dist {
 local STATUS="$(git status 2> /dev/null)"
 local DIST_STRING=""
 local IS_AHEAD=$(echo -n "$STATUS" | grep "ahead")
 local IS_BEHIND=$(echo -n "$STATUS" | grep "behind")
 if [ ! -z "$IS_AHEAD" ]; then
  local DIST_VAL=$(echo "$IS_AHEAD" | sed 's/[^0-9]*//g')
  DIST_STRING="$DIST_VAL AHEAD"
 elif [ ! -z "$IS_BEHIND" ]; then
  local DIST_VAL=$(echo "$IS_BEHIND" | sed 's/[^0-9]*//g')
  DIST_STRING="BEHIND $DIST_VAL"
 fi
 if [ ! -z "$DIST_STRING" ]; then
  echo -en "\e[97;45m $DIST_STRING"
 fi
}
__PS1_BEFORE='\n\n'
__PS1_USER='\[\e[97;104m\] \u '
__PS1_LOCATION='\[\e[30;43m\] \w '
__PS1_GIT_BRANCH='\[\e[97;45m\] \`__git_ps1\` ' __PS1_GIT_STATS='\`git_stats\` '
__PS1_AFTER='\[\e[0m\]\n\n>> '
__PS1_GIT_DIST='\`origin_dist\`'
export PS1="${__PS1_BEFORE}${__PS1_USER}${__PS1_LOCATION}${__PS1_GIT_BRANCH}${__PS1_GIT_DIST}${__PS1_GIT_STATS}${__PS1_AFTER}"
```

If you liked this post, you should also check out [how to use bashrc to cache your ssh credentials](https://blog.sasworkshops.com/ssh-keys-and-git-bash/) and you should also checkout [lazygit](https://github.com/jesseduffield/lazygit?ref=blog.sasworkshops.com). It is an attempt to replicate one of the Git GUIs in the CLI. Maybe I will write another post about that someday.

Also be sure to checkout our “Using Git Effectively” course for more tips and tricks on how to make using Git easy and fun!

Checkout Our Course