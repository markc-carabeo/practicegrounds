"""Turn a simple Markdown file (headings, paragraphs, bold, lists, code blocks) into a clean A4 PDF
using headless Google Chrome. Standard library only.
Usage: python3 -I md_to_pdf.py <file.md> [out.pdf]"""
import html, os, re, subprocess, sys, tempfile

src = sys.argv[1]
out = sys.argv[2] if len(sys.argv) > 2 else os.path.splitext(src)[0] + ".pdf"
lines = open(src, encoding="utf-8").read().splitlines()

def inline(s):
    s = html.escape(s)
    s = re.sub(r"\*\*(.+?)\*\*", r"<b>\1</b>", s)
    s = re.sub(r"(?<!\*)\*(?!\*)(.+?)(?<!\*)\*(?!\*)", r"<i>\1</i>", s)
    return s

body, para, in_list, in_code = [], [], False, False
def flush():
    global para
    if para: body.append("<p>" + "<br>".join(inline(x) for x in para) + "</p>"); para = []
for ln in lines:
    if ln.strip().startswith("```"):
        flush()
        if in_list: body.append("</ul>"); in_list = False
        body.append("</pre>" if in_code else "<pre>"); in_code = not in_code; continue
    if in_code: body.append(html.escape(ln)); continue
    m = re.match(r"^(#{1,4})\s+(.*)", ln)
    if m:
        flush()
        if in_list: body.append("</ul>"); in_list = False
        n = len(m.group(1)); body.append(f"<h{n}>{inline(m.group(2))}</h{n}>"); continue
    m = re.match(r"^\s*[-*]\s+(.*)", ln)
    if m:
        flush()
        if not in_list: body.append("<ul>"); in_list = True
        body.append(f"<li>{inline(m.group(1))}</li>"); continue
    if not ln.strip():
        flush()
        if in_list: body.append("</ul>"); in_list = False
        continue
    if ln.strip() == "---": flush(); body.append("<hr>"); continue
    para.append(ln.strip())
flush()
if in_list: body.append("</ul>")

doc = f"""<!doctype html><html><head><meta charset="utf-8">
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Figtree:wght@400;600;800&display=swap">
<style>@page{{size:A4;margin:20mm 18mm}}body{{font-family:Figtree,Helvetica,Arial,sans-serif;color:#1d2433;font-size:11pt;line-height:1.55}}
h1{{font-size:20pt;margin:0 0 10pt}}h2{{font-size:14pt;margin:18pt 0 6pt;color:#171f37;border-bottom:2px solid #edcd1f;padding-bottom:3pt}}
h3{{font-size:12pt;margin:14pt 0 4pt}}p{{margin:0 0 8pt}}ul{{margin:0 0 8pt 16pt;padding:0}}li{{margin:2pt 0}}
pre{{white-space:pre-wrap;font-family:inherit;background:#f4f6fa;padding:8pt;border-radius:4pt}}hr{{border:0;border-top:1px solid #d7dcef;margin:14pt 0}}
h2,h3{{break-after:avoid}}</style></head><body>{''.join(body)}</body></html>"""
tmp = tempfile.NamedTemporaryFile("w", suffix=".html", delete=False, encoding="utf-8"); tmp.write(doc); tmp.close()
chrome = "/Applications/Google Chrome.app/Contents/MacOS/Google Chrome"
subprocess.run([chrome, "--headless=new", "--disable-gpu", "--no-pdf-header-footer", "--virtual-time-budget=5000",
                f"--print-to-pdf={os.path.abspath(out)}", "file://" + tmp.name], stderr=subprocess.DEVNULL, check=True)
os.unlink(tmp.name)
print("Saved", out)
