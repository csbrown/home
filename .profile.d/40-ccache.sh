# Android build system uses USE_CCACHE.
export USE_CCACHE=1

# Run cpp twice. This eliminates clang warnings.
export CCACHE_CPP2=1

export CCACHE_DIR="$HOME/.cache/ccache"

kw_path_prepend "$HOME/.config/ccache/bin"

# From ccache(1):
#   If you strike problems with GDB not using the correct directory then
#   enable this option.
#export CCACHE_HASHDIR=1

