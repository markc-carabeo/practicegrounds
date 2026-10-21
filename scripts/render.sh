#!/bin/zsh
# One command for step 7: renders desktop + mobile in parallel, builds the Before & After,
# and makes small review crops so the whole page can be checked in a few images.
# Usage: render.sh <client folder> "<Business>" <brand hex> [current-site.png]
#   Writes "<Business> - Homepage - New.png", "- Mobile.png" and "- Before & After.png" into the client folder,
#   and review crops into <client folder>/.review/ (desktop-1.png…, mobile.png).
#   If current-site.png doesn't exist yet, capture it first with screenshot.sh <url> current-site.png
set -e
[[ $# -ge 3 && -f "$1/homepage.html" ]] || { echo "Usage: render.sh <client folder containing homepage.html> \"<Business>\" <brand hex> [current-site.png]"; exit 1; }
DIR="$(cd "$1" && pwd)"; NAME="$2"; HEX="$3"; CUR="${4:-$DIR/current-site.png}"
HERE="$(cd "$(dirname "$0")" && pwd)"
CH="/Applications/Google Chrome.app/Contents/MacOS/Google Chrome"
NEW="$DIR/$NAME - Homepage - New.png"; MOB="$DIR/$NAME - Homepage - Mobile.png"; BA="$DIR/$NAME - Homepage - Before & After.png"
R="$DIR/.review"; rm -rf "$R"; mkdir -p "$R"

"$HERE/screenshot.sh" "$DIR/homepage.html" "$NEW" &
"$HERE/screenshot.sh" "$DIR/homepage.html" "$MOB" 390 &
wait
[[ -f "$CUR" ]] && "$HERE/before_after.sh" "$CUR" "$NEW" "$BA" "$NAME" "$HEX" || echo "No current-site screenshot at $CUR; Before & After skipped"

# Review crops: desktop in 1250px slices (shown at 850px wide), mobile as one sheet of 3 columns
crop() { # <png> <css width> <slice height> <offset> <out>
  printf '<!doctype html><html><body style="margin:0;overflow:hidden"><div style="width:%spx;height:%spx;overflow:hidden"><img src="file://%s" style="width:%spx;display:block;margin-top:-%spx"></div></body></html>' "$2" "$3" "$1" "$2" "$4" > "$5.html"
  perl -e 'alarm 45; exec @ARGV' "$CH" --headless=new --disable-gpu --hide-scrollbars --allow-file-access-from-files --window-size=$2,$3 --virtual-time-budget=2000 --screenshot="$5" "file://$5.html" 2>/dev/null || true
  rm -f "$5.html"
}
H=$(( $(sips -g pixelHeight "$NEW" | tail -1 | awk '{print $2}') / 2 )); i=1
for o in $(seq 0 1250 $((H - 1))); do crop "$NEW" 1440 1260 $o "$R/desktop-$i.png" & i=$((i + 1)); done
MH=$(( $(sips -g pixelHeight "$MOB" | tail -1 | awk '{print $2}') / 2 )); j=1
for o in $(seq 0 1800 $((MH - 1))); do crop "$MOB" 390 1800 $o "$R/m$j.png" & j=$((j + 1)); done
wait
for f in "$R"/desktop-*.png; do sips -Z 850 "$f" >/dev/null; done
# Mobile sheets, 3 slices side by side per sheet
k=1; s=1
while [[ -f "$R/m$k.png" ]]; do
  printf '<html><body style="margin:0;display:flex;gap:8px;background:#999">' > "$R/s.html"
  for n in $k $((k+1)) $((k+2)); do [[ -f "$R/m$n.png" ]] && printf '<img src="m%s.png" style="width:390px;height:1800px;object-fit:cover;object-position:top">' $n >> "$R/s.html"; done
  "$CH" --headless=new --disable-gpu --hide-scrollbars --allow-file-access-from-files --window-size=1190,1800 --screenshot="$R/mobile-$s.png" "file://$R/s.html" 2>/dev/null
  sips -Z 1300 "$R/mobile-$s.png" >/dev/null; k=$((k + 3)); s=$((s + 1))
done
rm -f "$R"/m[0-9]*.png "$R/s.html"
echo "Rendered: New, Mobile$([[ -f "$BA" ]] && echo ', Before & After'). Review crops: $(ls "$R" | tr '\n' ' ')"
