if [ $TERM_PROGRAM != "Apple_Terminal" ]; then
  eval "$(starship init bash)"
fi

source $HOME/.profile

# Added by LM Studio CLI (lms)
export PATH="$PATH:$HOME/.lmstudio/bin"

# Added by LM Studio CLI (lms)
export PATH="$PATH:/Users/jaco/.lmstudio/bin"
# End of LM Studio CLI section

