# Do not strip ascii color escape sequences.
LESS="-r"; export LESS

# Enable colors in man manpages.
#
# From termcap(5):
#
#       mb   Start blinking
#       md   Start bold mode
#       me   End all mode like so, us, mb, md and mr
#       se   End standout mode
#       so   Start standout mode
#       ue   End underlining
#       us   Start underlining
#
LESS_TERMCAP_mb=`printf "\e[${kw_color_face_bold};${kw_color_fg_blue}m"`
LESS_TERMCAP_md=`printf "\e[${kw_color_face_bold};${kw_color_fg_blue}m"`
LESS_TERMCAP_me=`printf "\e[${kw_color_reset}m"`
LESS_TERMCAP_se=`printf "\e[${kw_color_reset}m"`
LESS_TERMCAP_so=`printf "\e[${kw_color_face_bold};${kw_color_bg_blue};${kw_color_fg_yellow}m"`
LESS_TERMCAP_ue=`printf "\e[${kw_color_reset}m"`
LESS_TERMCAP_us=`printf "\e[${kw_color_face_ul};${kw_color_fg_green}m"`

export LESS_TERMCAP_mb
export LESS_TERMCAP_md
export LESS_TERMCAP_me
export LESS_TERMCAP_se
export LESS_TERMCAP_so
export LESS_TERMCAP_ue
export LESS_TERMCAP_us
