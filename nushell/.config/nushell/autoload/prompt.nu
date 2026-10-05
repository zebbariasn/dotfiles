# Starship draws the whole prompt; drop Nushell's own vi mode indicators
# (the cursor shape already shows the mode)
$env.PROMPT_INDICATOR_VI_INSERT = ""
$env.PROMPT_INDICATOR_VI_NORMAL = ""
