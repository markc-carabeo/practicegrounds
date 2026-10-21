#!/bin/zsh
# Side-by-side Before & After image at 2x.
# Usage: before_after.sh <current.png> <new.png> <out.png> "<Business name>" [accent #hex]
#   accent = client's brand colour for the "AFTER" label (white text sits on it, so pick a darker brand colour)
set -e
CUR="$(cd "$(dirname "$1")" && pwd)/$(basename "$1")"
NEW="$(cd "$(dirname "$2")" && pwd)/$(basename "$2")"
OUT="$3"; NAME="$4"; ACC="${5:-#1b2340}"
CH="/Applications/Google Chrome.app/Contents/MacOS/Google Chrome"
dim() { sips -g "$2" "$1" | tail -1 | awk '{print $2}'; }
COLW=720
H1=$(( $(dim "$CUR" pixelHeight) * COLW / $(dim "$CUR" pixelWidth) ))
H2=$(( $(dim "$NEW" pixelHeight) * COLW / $(dim "$NEW" pixelWidth) ))
MAXH=$(( H1 > H2 ? H1 : H2 ))
TOTAL=$(( MAXH + 230 ))
TMP=$(mktemp -d)
cat > "$TMP/ba.html" <<HTML
<!doctype html><html><head><meta charset="utf-8"><link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Barlow+Condensed:wght@700;800&display=swap">
<style>body{margin:0;background:#e9ecf1;font-family:"Barlow Condensed",Arial,sans-serif}
.top{padding:40px 60px 0;font-size:28px;color:#5d6470;font-weight:700;text-transform:uppercase;letter-spacing:.08em}
.row{display:flex;gap:60px;padding:30px 60px 60px;align-items:flex-start}
.col{width:${COLW}px}.lbl{font-size:44px;font-weight:800;text-transform:uppercase;letter-spacing:.06em;margin:0 0 18px;color:#1b2340;line-height:1}
.lbl span{display:inline-flex;align-items:center;gap:12px;background:${ACC};color:#fff;padding:10px 24px 10px 20px;border-radius:999px;font-size:38px;letter-spacing:.1em;box-shadow:0 10px 24px rgba(0,0,0,.18)}
.lbl span::before{content:"";width:12px;height:12px;border-radius:50%;background:#fff;opacity:.9}
img{width:${COLW}px;display:block;box-shadow:0 10px 40px rgba(20,27,50,.18)}</style></head><body>
<div class="top">${NAME} · Homepage concept by Sites n Stores</div>
<div class="row"><div class="col"><p class="lbl">Before</p><img src="file://${CUR}"></div>
<div class="col"><p class="lbl"><span>After</span></p><img src="file://${NEW}"></div></div></body></html>
HTML
"$CH" --headless=new --disable-gpu --hide-scrollbars --allow-file-access-from-files --force-device-scale-factor=2 --window-size=1620,$TOTAL --virtual-time-budget=6000 --screenshot="$OUT" "file://$TMP/ba.html" 2>/dev/null
rm -rf "$TMP"
echo "Saved $OUT"
