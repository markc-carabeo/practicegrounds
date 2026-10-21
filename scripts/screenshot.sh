#!/bin/zsh
# Full-page screenshot at 2x with headless Chrome.
# Usage: screenshot.sh <url-or-local-html> <out.png> [width=1440] [force height in CSS px]
# If a JavaScript site is cut off, pass a height as the 4th argument.
# Widths under 500px (phones) are rendered inside a centred iframe, because Chrome
# won't make a window narrower than ~500px; the result is then cropped to the phone width.
set -e
SRC="$1"; OUT="$2"; W="${3:-1440}"; FORCEH="${4:-}"
CH="/Applications/Google Chrome.app/Contents/MacOS/Google Chrome"
UA="Mozilla/5.0 (Macintosh; Intel Mac OS X 14_0) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/17.0 Safari/605.1.15"
TMP=$(mktemp -d)
rm -f "$OUT"
# Run Chrome with a time limit so a slow or stuck site can't hang the run (macOS has no `timeout`)
LIMIT="${SHOT_TIMEOUT:-45}"
chrome() { perl -e 'alarm shift; exec @ARGV' "$LIMIT" "$CH" "$@"; }

if [[ "$SRC" == http* ]]; then
  TARGET="$SRC"
  # Render with Chrome first so JavaScript-built sites (React, Vue, Wix) are measured correctly
  chrome --headless=new --disable-gpu --virtual-time-budget=12000 --window-size=$W,1000 --dump-dom "$SRC" 2>/dev/null > "$TMP/m.html" || true
  [[ -s "$TMP/m.html" ]] || curl -m 30 -sL -A "$UA" "$SRC" -o "$TMP/m.html"
  BASE="$SRC"
else
  ABS="$(cd "$(dirname "$SRC")" && pwd)/$(basename "$SRC")"
  TARGET="file://$ABS"
  cp "$ABS" "$TMP/m.html"; BASE="file://$(dirname "$ABS")/"
fi

if (( W >= 500 )); then
  # Measuring copy that reports page height in its <title>
  python3 -I - "$TMP/m.html" "$BASE" <<'PY'
import sys, re
p, base = sys.argv[1], sys.argv[2]
t = open(p, encoding="utf-8", errors="ignore").read()
t = re.sub(r"<head([^>]*)>", lambda m: f'<head{m.group(1)}><base href="{base}">', t, count=1)
probe = '<script>window.addEventListener("load",function(){setTimeout(function(){document.title="H="+Math.max(document.documentElement.scrollHeight,document.body.scrollHeight)},1500)})</script>'
t = t.replace("</body>", probe + "</body>") if "</body>" in t else t + probe
open(p, "w", encoding="utf-8").write(t)
PY
  H=$(chrome --headless=new --disable-gpu --hide-scrollbars --allow-file-access-from-files --window-size=$W,1000 --virtual-time-budget=12000 --dump-dom "file://$TMP/m.html" 2>/dev/null | grep -o 'H=[0-9]*' | head -1 | cut -d= -f2)
  [[ -z "$H" || "$H" -lt 600 ]] && H=6000 && echo "Could not measure height; using $H (check for empty space or cut-off)"
  H=$((H + 40))
  [[ -n "$FORCEH" ]] && H=$FORCEH
  chrome --headless=new --disable-gpu --hide-scrollbars --force-device-scale-factor=2 --window-size=$W,$H --virtual-time-budget=12000 --screenshot="$OUT" "$TARGET" 2>/dev/null || true
  [[ -s "$OUT" ]] || { echo "Screenshot timed out after ${LIMIT}s. Retry with a fixed height (4th argument) or SHOT_TIMEOUT=90"; exit 1; }
else
  WIN=600
  cat > "$TMP/wrap.html" <<HTML
<!doctype html><html><body style="margin:0;background:#fff;display:flex;justify-content:center">
<iframe id="f" src="$TARGET" style="width:${W}px;height:800px;border:0;display:block;flex:none"></iframe>
<script>document.getElementById("f").addEventListener("load",function(){var f=this;setTimeout(function(){var d=f.contentDocument;document.title="H="+Math.max(d.documentElement.scrollHeight,d.body.scrollHeight)},1500)})</script>
</body></html>
HTML
  H=$(chrome --headless=new --disable-gpu --hide-scrollbars --allow-file-access-from-files --window-size=$WIN,1000 --virtual-time-budget=12000 --dump-dom "file://$TMP/wrap.html" 2>/dev/null | grep -o 'H=[0-9]*' | head -1 | cut -d= -f2)
  [[ -z "$H" || "$H" -lt 600 ]] && H=9000 && echo "Could not measure height (remote sites can't be measured at phone width); using $H"
  sed -i '' "s/height:800px/height:${H}px/" "$TMP/wrap.html"
  chrome --headless=new --disable-gpu --hide-scrollbars --allow-file-access-from-files --force-device-scale-factor=2 --window-size=$WIN,$H --virtual-time-budget=12000 --screenshot="$TMP/full.png" "file://$TMP/wrap.html" 2>/dev/null
  sips -c $((H * 2)) $((W * 2)) "$TMP/full.png" --out "$OUT" >/dev/null   # sips crops from the centre
fi
rm -rf "$TMP"
echo "Saved $OUT (${W}x${H} CSS px at 2x)"
