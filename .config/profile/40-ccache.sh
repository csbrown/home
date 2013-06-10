# Android build system uses USE_CCACHE.
USE_CCACHE=1; export USE_CCACHE

# Run cpp twice. This eliminates clang warnings.
CCACHE_CPP2=1; export CCACHE_CPP2

CCACHE_DIR="$HOME/.cache/ccache"; export CCACHE_DIR

# From ccache(1):
#   If you strike problems with GDB not using the correct directory then
#   enable this option.
#CCACHE_HASHDIR=1; export 

