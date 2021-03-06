#!/bin/sh
# base16-shell (https://github.com/chriskempson/base16-shell)
# Base16 Shell template by Chris Kempson (http://chriskempson.com)
# Seti UI scheme by 

# This script doesn't support linux console (use 'vconsole' template instead)
if [ "${TERM%%-*}" = 'linux' ]; then
    return 2>/dev/null || exit 0
fi

color00="15/17/18" # Base 00 - Black
color01="Cd/3f/45" # Base 08 - Red
color02="9f/ca/56" # Base 0B - Green
color03="e6/cd/69" # Base 0A - Yellow
color04="55/b5/db" # Base 0D - Blue
color05="a0/74/c4" # Base 0E - Magenta
color06="55/db/be" # Base 0C - Cyan
color07="d6/d6/d6" # Base 05 - White
color08="41/53/5B" # Base 03 - Bright Black
color09="db/7b/55" # Base 09
color10="8e/c4/3d" # Base 01
color11="3B/75/8C" # Base 02
color12="43/a5/d5" # Base 04
color13="ee/ee/ee" # Base 06
color14="8a/55/3f" # Base 0F
color15="ff/ff/ff" # Base 07 - Bright White
color_foreground="d6/d6/d6" # Base 05
color_background="15/17/18" # Base 00
color_cursor="d6/d6/d6" # Base 05

if [ -n "$TMUX" ]; then
  # Tell tmux to pass the escape sequences through
  # (Source: http://permalink.gmane.org/gmane.comp.terminal-emulators.tmux.user/1324)
  printf_template='\033Ptmux;\033\033]4;%d;rgb:%s\033\033\\\033\\'
  printf_template_var='\033Ptmux;\033\033]%d;rgb:%s\033\033\\\033\\'
  printf_template_custom='\033Ptmux;\033\033]%s%s\033\033\\\033\\'
elif [ "${TERM%%-*}" = "screen" ]; then
  # GNU screen (screen, screen-256color, screen-256color-bce)
  printf_template='\033P\033]4;%d;rgb:%s\033\\'
  printf_template_var='\033P\033]%d;rgb:%s\033\\'
  printf_template_custom='\033P\033]%s%s\033\\'
else
  printf_template='\033]4;%d;rgb:%s\033\\'
  printf_template_var='\033]%d;rgb:%s\033\\'
  printf_template_custom='\033]%s%s\033\\'
fi

# 16 color space
printf $printf_template 0  $color00
printf $printf_template 1  $color01
printf $printf_template 2  $color02
printf $printf_template 3  $color03
printf $printf_template 4  $color04
printf $printf_template 5  $color05
printf $printf_template 6  $color06
printf $printf_template 7  $color07
printf $printf_template 8  $color08
printf $printf_template 9  $color09
printf $printf_template 10 $color10
printf $printf_template 11 $color11
printf $printf_template 12 $color12
printf $printf_template 13 $color13
printf $printf_template 14 $color14
printf $printf_template 15 $color15

# foreground / background / cursor color
if [ -n "$ITERM_SESSION_ID" ]; then
  # iTerm2 proprietary escape codes
  printf $printf_template_custom Pg d6d6d6 # forground
  printf $printf_template_custom Ph 151718 # background
  printf $printf_template_custom Pi d6d6d6 # bold color
  printf $printf_template_custom Pj 3B758C # selection color
  printf $printf_template_custom Pk d6d6d6 # selected text color
  printf $printf_template_custom Pl d6d6d6 # cursor
  printf $printf_template_custom Pm 151718 # cursor text
else
  printf $printf_template_var 10 $color_foreground
  printf $printf_template_var 11 $color_background
  printf $printf_template_custom 12 ";7" # cursor (reverse video)
fi

# clean up
unset printf_template
unset printf_template_var
unset color00
unset color01
unset color02
unset color03
unset color04
unset color05
unset color06
unset color07
unset color08
unset color09
unset color10
unset color11
unset color12
unset color13
unset color14
unset color15
unset color_foreground
unset color_background
unset color_cursor
