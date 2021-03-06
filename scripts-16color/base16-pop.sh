#!/bin/sh
# base16-shell (https://github.com/chriskempson/base16-shell)
# Base16 Shell template by Chris Kempson (http://chriskempson.com)
# Pop scheme by Chris Kempson (http://chriskempson.com)

# This script doesn't support linux console (use 'vconsole' template instead)
if [ "${TERM%%-*}" = 'linux' ]; then
    return 2>/dev/null || exit 0
fi

color00="00/00/00" # Base 00 - Black
color01="eb/00/8a" # Base 08 - Red
color02="37/b3/49" # Base 0B - Green
color03="f8/ca/12" # Base 0A - Yellow
color04="0e/5a/94" # Base 0D - Blue
color05="b3/1e/8d" # Base 0E - Magenta
color06="00/aa/bb" # Base 0C - Cyan
color07="d0/d0/d0" # Base 05 - White
color08="50/50/50" # Base 03 - Bright Black
color09="f2/93/33" # Base 09
color10="20/20/20" # Base 01
color11="30/30/30" # Base 02
color12="b0/b0/b0" # Base 04
color13="e0/e0/e0" # Base 06
color14="7a/2d/00" # Base 0F
color15="ff/ff/ff" # Base 07 - Bright White
color_foreground="d0/d0/d0" # Base 05
color_background="00/00/00" # Base 00
color_cursor="d0/d0/d0" # Base 05

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
  printf $printf_template_custom Pg d0d0d0 # forground
  printf $printf_template_custom Ph 000000 # background
  printf $printf_template_custom Pi d0d0d0 # bold color
  printf $printf_template_custom Pj 303030 # selection color
  printf $printf_template_custom Pk d0d0d0 # selected text color
  printf $printf_template_custom Pl d0d0d0 # cursor
  printf $printf_template_custom Pm 000000 # cursor text
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
