#!/bin/sh
# base16-shell (https://github.com/chriskempson/base16-shell)
# Base16 Shell template by Chris Kempson (http://chriskempson.com)
# Atelier Heath scheme by Bram de Haan (http://atelierbramdehaan.nl)

# This script doesn't support linux console (use 'vconsole' template instead)
if [ "${TERM%%-*}" = 'linux' ]; then
    return 2>/dev/null || exit 0
fi

color00="1b/18/1b" # Base 00 - Black
color01="ca/40/2b" # Base 08 - Red
color02="91/8b/3b" # Base 0B - Green
color03="bb/8a/35" # Base 0A - Yellow
color04="51/6a/ec" # Base 0D - Blue
color05="7b/59/c0" # Base 0E - Magenta
color06="15/93/93" # Base 0C - Cyan
color07="ab/9b/ab" # Base 05 - White
color08="77/69/77" # Base 03 - Bright Black
color09="a6/59/26" # Base 09
color10="29/23/29" # Base 01
color11="69/5d/69" # Base 02
color12="9e/8f/9e" # Base 04
color13="d8/ca/d8" # Base 06
color14="cc/33/cc" # Base 0F
color15="f7/f3/f7" # Base 07 - Bright White
color_foreground="ab/9b/ab" # Base 05
color_background="1b/18/1b" # Base 00
color_cursor="ab/9b/ab" # Base 05

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
  printf $printf_template_custom Pg ab9bab # forground
  printf $printf_template_custom Ph 1b181b # background
  printf $printf_template_custom Pi ab9bab # bold color
  printf $printf_template_custom Pj 695d69 # selection color
  printf $printf_template_custom Pk ab9bab # selected text color
  printf $printf_template_custom Pl ab9bab # cursor
  printf $printf_template_custom Pm 1b181b # cursor text
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
