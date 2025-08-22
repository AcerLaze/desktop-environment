if [[ -o interactive ]]; then
  if type fastfetch >/dev/null; then
    fastfetch --config neofetch
  elif type neofetch >/dev/null; then
    neofetch
  fi
fi
