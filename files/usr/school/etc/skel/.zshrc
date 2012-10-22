## BOCAL STAFF 2010-2011
## FEDORA DUMP


# School
export PATH='/usr/school/bin/'
# Bocal
export PATH='/usr/site/sbin:/usr/site/bin'
# NetSoul
export PATH="${PATH}:/usr/netsoul/sbin:/usr/netsoul/bin"
# Heimdal
export PATH="${PATH}:/usr/heimdal/sbin:/usr/heimdal/bin"
# Package
export PATH="${PATH}:/usr/local/sbin:/usr/local/bin"
# System
export PATH="${PATH}:/usr/sbin:/usr/bin:/sbin:/bin"

export EDITOR='emacs'
export HISTFILE="$HOME/.history"
export LOGCHECK='60'
export MAILCHECK=0
export PAGER='less'
export WATCH='all'
export WATCHFMT='%n has %a %l from %m at %T'




######################################################################
###
### Options (man zshoptions)
###
######################################################################

######################################################################
##
## Changing Directories
##
######################################################################

# If a command  is issued that can't be executed  as a normal command,
# and the command  is the name of a directory,  perform the cd command
# to that directory.
setopt AUTO_CD

######################################################################
##
## Completion
##
######################################################################

# If unset, key  functions that list completions try  to return to the
# last prompt if given a  numeric argument. If set these functions try
# to return to the last prompt if given no numeric argument.
setopt ALWAYS_LAST_PROMPT

# If a  completion is performed with  the cursor within a  word, and a
# full completion is  inserted, the cursor is moved to  the end of the
# word.  That is, the cursor is moved to the end of the word if either
# a single match is inserted or menu completion is performed.
setopt ALWAYS_TO_END

# Automatically list choices on an ambiguous completion.
setopt AUTO_LIST

# Automatically  use  menu  completion  after the  second  consecutive
# request  for  completion,  for  example  by  pressing  the  tab  key
# repeatedly. This option is overridden by MENU_COMPLETE.
setopt AUTO_MENU

# If  a  parameter  is  completed  whose  content is  the  name  of  a
# directory, then add a trailing slash instead of a space.
setopt AUTO_PARAM_SLASH

# Prevents  aliases   on  the  command  line   from  being  internally
# substituted before  completion is attempted.  The effect  is to make
# the alias a distinct command for completion purposes.
setopt COMPLETE_ALIASES

# If unset, the cursor is set to  the end of the word if completion is
# started. Otherwise it  stays there and completion is  done from both
# ends.
setopt COMPLETE_IN_WORD

# Whenever  a command completion  is attempted,  make sure  the entire
# command  path is  hashed  first.  This  makes  the first  completion
# slower.
setopt HASH_LIST_ALL

# This option works when AUTO_LIST  or BASH_AUTO_LIST is also set.  If
# there is an  unambiguous prefix to insert on  the command line, that
# is done without  a completion list being displayed;  in other words,
# auto-listing  behaviour  only  takes  place when  nothing  would  be
# inserted.  In the  case of BASH_AUTO_LIST, this means  that the list
# will be delayed to the third call of the function.
setopt LIST_AMBIGUOUS

# Beep on  an ambiguous completion.  More accurately,  this forces the
# completion widgets to return status  1 on an ambiguous com- pletion,
# which causes the shell to beep  if the option BEEP is also set; this
# may be modified if completion is called from a user-defined widget.
unsetopt LIST_BEEP

# When listing files  that are possible completions, show  the type of
# each file with a trailing identifying mark.
setopt LIST_TYPES

######################################################################
##
## Expansion and Globbing
##
######################################################################

# Nothing !

######################################################################
##
## History
##
######################################################################

# Beep when an  attempt is made to access a  history entry which isn't
# there.
unsetopt HIST_BEEP

######################################################################
##
## Initialisation
##
######################################################################

# All parameters subsequently defined are automatically exported.
unsetopt ALL_EXPORT

# If  this   option  is   unset,  the  startup   files  /etc/zprofile,
# /etc/zshrc, /etc/zlogin and /etc/zlogout will not be run.  It can be
# disabled and re-enabled at  any time, including inside local startup
# files (.zshrc, etc.).
unsetopt GLOBAL_RCS

######################################################################
##
## Input/Output
##
######################################################################

# Expand aliases.
setopt ALIASES

# Try  to correct  the  spelling  of commands.   Note  that, when  the
# HASH_LIST_ALL option is not set or when some directories in the path
# are not readable, this may  falsely report spelling errors the first
# time some commands are used.
setopt CORRECT

# Try to correct the spelling of all arguments in a line.
setopt CORRECT_ALL

# Allow comments even in interactive shells.
setopt INTERACTIVE_COMMENTS

# Note the  location of  each command the  first time it  is executed.
# Subsequent  invocations  of the  same  command  will  use the  saved
# location, avoiding a path search.   If this option is unset, no path
# hashing  is done  at all.   However, when  CORRECT is  set, commands
# whose names  do not appear in  the functions or  aliases hash tables
# are hashed in order to avoid reporting them as spelling errors.
setopt HASH_CMDS

# Whenever a command name is hashed, hash the directory containing it,
# as well as  all directories that occur earlier in  the path.  Has no
# effect if neither HASH_CMDS nor CORRECT is set.
setopt HASH_DIRS

# Print a warning  message if a mail file has  been accessed since the
# shell last checked.
unsetopt MAIL_WARNING

# Do not query the user before executing `rm *' or `rm path/*'.
setopt RM_STAR_SILENT

######################################################################
##
## Job Control
##
######################################################################

# With this  option set,  stopped jobs that  are removed from  the job
# table with the disown builtin  command are automatically sent a CONT
# signal to make them running.
setopt AUTO_CONTINUE

# Treat single word simple  commands without redirection as candidates
# for resumption of an existing job.
setopt AUTO_RESUME

# Run all background jobs at a  lower priority.  This option is set by
# default.
setopt BG_NICE

# Send the HUP signal to running jobs when the shell exits.
unsetopt HUP

# List jobs in the long format by default.
setopt LONG_LIST_JOBS

######################################################################
##
## Prompting
##
######################################################################

# Remove any right prompt from  display when accepting a command line.
# This may be useful with terminals with other cut/paste methods.
setopt TRANSIENT_RPROMPT

######################################################################
##
## Scripts and Functions
##
######################################################################

# Output  hexadecimal numbers in  the standard  C format,  for example
# `0xFF' instead of the usual  `16#FF'.  If the option OCTAL_ZEROES is
# also  set (it  is not  by default),  octal numbers  will  be treated
# similarly and hence appear as  `077' instead of `8#77'.  This option
# has no effect on the choice of the output base, nor on the output of
# bases  other than hexadecimal  and octal.   Note that  these formats
# will be understood on input irrespective of the setting of C_BASES.
setopt C_BASES

# When  executing  a shell  function  or  sourcing  a script,  set  $0
# temporarily to the name of the function/script.
setopt FUNCTION_ARGZERO

######################################################################
##
## Shell Emulation
##
######################################################################

# Make the echo builtin compatible with the BSD echo(1) command.  This
# disables backslashed escape sequences  in echo strings unless the -e
# option is specified.
setopt BSD_ECHO

######################################################################
##
## Shell State
##
######################################################################

# Nothing !

######################################################################
##
## Zle
##
######################################################################

# Beep on error in ZLE.
unsetopt BEEP

# If ZLE is  loaded, turning on this option  has the equivalent effect
# of `bindkey -e'.   In addition, the VI option  is unset.  Turning it
# off has no effect.  The  option setting is not guaranteed to reflect
# the  current keymap.   This  option is  provided for  compatibility;
# bindkey is the recommended interface.
setopt EMACS

# Use  the zsh  line editor.   Set  by default  in interactive  shells
# connected to a terminal.
setopt ZLE




######################################################################
###
### Builtins (man zshbuiltins)
###
######################################################################

# Alias
alias c='clear'
alias df='df -h'
alias du='du -h'
alias ls='ls -h'
alias ll='ls -l'
alias la='ls -la'
alias cp='cp -v'
alias mv='mv -v'
alias rm='rm -v'
alias ne='emacs -nw'
alias j='jobs'
alias z='zlock'
alias reload=". ${HOME}/.zshrc"




######################################################################
###
### Zle (man zshzle)
###
######################################################################

# Selects keymap `emacs', and also links it to `main'.
bindkey -e




######################################################################
###
### Modules (man zshmodules)
###
######################################################################

# Nothing !
# zmodload zsh/$module




######################################################################
###
### Contrib (man zshcontrib)
###
######################################################################

# Nothing !
# autoload compinit




######################################################################
###
### Usefull (personnal) functions
###
######################################################################

precmd()
{
    print -Pn "\e]0;%n@%m: %~\a"
}

preexec()
{
    print -Pn "\e]0;%n@%m: ${1}\a"
}

clean()
{
    SEARCH='.'
    if [ ${1} ]
    then
	SEARCH=${1}
    fi
    find ${SEARCH} \( -name "*~" -or -name ".*~" \) -exec rm -fv {} \;
}

setenv()
{
    typeset -x "${1}${1:+=}${(@)argv[2,$#]}"
}




######################################################################
###
### Prompt system for school and home compatibility.
###
######################################################################
setprompt()
{
    CL_NORMAL='%{[0m%}'	# %{[0m%} = normal
    CL_GREY='%{[0;30m%}'	# %{[0;30m%} = grey
    CL_RED='%{[0;31m%}'	# %{[0;31m%} = red
    CL_GREEN='%{[0;32m%}'	# %{[0;32m%} = green
    CL_YELLOW='%{[0;33m%}'	# %{[0;33m%} = yellow
    CL_BLUE='%{[0;34m%}'	# %{[0;34m%} = blue
    CL_VIOLET='%{[0;35m%}'	# %{[0;35m%} = violet
    CL_CYAN='%{[0;36m%}'	# %{[0;36m%} = cyan
    CL_SPECIAL='%{[1;30m%}'	# %{[1;30m%} = bold grey
    case ${HOST} in
	*grimly*)
	    if [ ${USER} = 'root' ]
	    then
		PR_USER="[${CL_GREEN}%n${CL_NORMAL} @"
		PR_HOST=" ${CL_SPECIAL}%m${CL_NORMAL}] %# "
	    elif [ ${USER} = 'rockyluke' ]
	    then
		PR_USER="${CL_YELLOW}%n${CL_NORMAL}"
		PR_HOST=" ${CL_GREEN}%m${CL_NORMAL} %# "
	    else
		PR_USER="%n"
		PR_HOST=" %m %#"
	    fi
	    ;;
	*)
	    if [ ${USER} = 'root' ]
	    then
		PR_USER="[${CL_RED}%n${CL_NORMAL} @"
		PR_HOST=" ${CL_SPECIAL}%m${CL_NORMAL}] %# "
	    elif [ ${USER} = 'rockyluke' ]
	    then
		PR_USER="${CL_YELLOW}%n${CL_NORMAL}"
		PR_HOST=" ${CL_RED}%m${CL_NORMAL} %# "
	    else
		PR_USER="(%n@"
		PR_HOST="%m %h)"
	    fi
	    ;;
    esac
    PROMPT="${PR_USER}${PR_HOST}"
    RPROMPT="(%y) [${CL_RED}%~${CL_NORMAL}]"
}
setprompt
# EOF

if [ -f ${HOME}/.myzshrc ]
then
    . ${HOME}/.myzshrc
fi
