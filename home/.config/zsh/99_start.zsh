if [[ -o interactive ]]; then
  if type fastfetch >/dev/null; then
    fastfetch --load-config neofetch
  elif type neofetch >/dev/null; then
    neofetch
  fi
fi
