#!/bin/sh
# base16-shell (https://github.com/chriskempson/base16-shell)
# Base16 Shell template by Chris Kempson (http://chriskempson.com)
# Atelier Dune scheme by Bram de Haan (http://atelierbramdehaan.nl)

# This script doesn't support linux console (use 'vconsole' template instead)
if [ "${TERM%%-*}" = 'linux' ]; then
    return 2>/dev/null || exit 0
fi

color00="20/20/1d" # Base 00 - Black
color01="d7/37/37" # Base 08 - Red
color02="60/ac/39" # Base 0B - Green
color03="ae/95/13" # Base 0A - Yellow
color04="66/84/e1" # Base 0D - Blue
color05="b8/54/d4" # Base 0E - Magenta
color06="1f/ad/83" # Base 0C - Cyan
color07="a6/a2/8c" # Base 05 - White
color08="7d/7a/68" # Base 03 - Bright Black
color09="b6/56/11" # Base 09
color10="29/28/24" # Base 01
color11="6e/6b/5e" # Base 02
color12="99/95/80" # Base 04
color13="e8/e4/cf" # Base 06
color14="d4/35/52" # Base 0F
color15="fe/fb/ec" # Base 07 - Bright White
color_foreground="a6/a2/8c" # Base 05
color_background="20/20/1d" # Base 00
color_cursor="a6/a2/8c" # Base 05

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
  printf $printf_template_custom Pg a6a28c # forground
  printf $printf_template_custom Ph 20201d # background
  printf $printf_template_custom Pi a6a28c # bold color
  printf $printf_template_custom Pj 6e6b5e # selection color
  printf $printf_template_custom Pk a6a28c # selected text color
  printf $printf_template_custom Pl a6a28c # cursor
  printf $printf_template_custom Pm 20201d # cursor text
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
