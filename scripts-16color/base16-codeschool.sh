#!/bin/sh
# base16-shell (https://github.com/chriskempson/base16-shell)
# Base16 Shell template by Chris Kempson (http://chriskempson.com)
# Codeschool scheme by brettof86

# This script doesn't support linux console (use 'vconsole' template instead)
if [ "${TERM%%-*}" = 'linux' ]; then
    return 2>/dev/null || exit 0
fi

color00="23/2c/31" # Base 00 - Black
color01="2a/54/91" # Base 08 - Red
color02="23/79/86" # Base 0B - Green
color03="a0/3b/1e" # Base 0A - Yellow
color04="48/4d/79" # Base 0D - Blue
color05="c5/98/20" # Base 0E - Magenta
color06="b0/2f/30" # Base 0C - Cyan
color07="9e/a7/a6" # Base 05 - White
color08="3f/49/44" # Base 03 - Bright Black
color09="43/82/0d" # Base 09
color10="1c/36/57" # Base 01
color11="2a/34/3a" # Base 02
color12="84/89/8c" # Base 04
color13="a7/cf/a3" # Base 06
color14="c9/83/44" # Base 0F
color15="b5/d8/f6" # Base 07 - Bright White
color_foreground="9e/a7/a6" # Base 05
color_background="23/2c/31" # Base 00
color_cursor="9e/a7/a6" # Base 05

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
  printf $printf_template_custom Pg 9ea7a6 # forground
  printf $printf_template_custom Ph 232c31 # background
  printf $printf_template_custom Pi 9ea7a6 # bold color
  printf $printf_template_custom Pj 2a343a # selection color
  printf $printf_template_custom Pk 9ea7a6 # selected text color
  printf $printf_template_custom Pl 9ea7a6 # cursor
  printf $printf_template_custom Pm 232c31 # cursor text
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
