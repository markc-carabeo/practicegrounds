"""Print the most-used opaque colours in a PNG (e.g. a logo), ignoring near-white.
Usage: python3 -I logo_colours.py <file.png> [top=6]
Standard library only (no Pillow needed)."""
import struct, sys, zlib, collections

def pixels(path):
    d = open(path, "rb").read()
    if d[:8] != b"\x89PNG\r\n\x1a\n":
        sys.exit("Not a PNG. Convert first: sips -s format png in.jpg --out logo.png")
    i, pal, trns, idat, hdr = 8, None, None, b"", None
    while i < len(d):
        n = struct.unpack(">I", d[i:i+4])[0]; t = d[i+4:i+8]; c = d[i+8:i+8+n]; i += 12 + n
        if t == b"IHDR": hdr = struct.unpack(">IIBBBBB", c)
        elif t == b"PLTE": pal = [c[j:j+3] for j in range(0, len(c), 3)]
        elif t == b"tRNS": trns = c
        elif t == b"IDAT": idat += c
    w, h, bd, ct, _, _, interlace = hdr
    if bd != 8 or interlace:
        sys.exit("Unsupported PNG (needs 8-bit, non-interlaced). Re-save with: sips -s format png in.png --out out.png")
    bpp = {0: 1, 2: 3, 3: 1, 4: 2, 6: 4}[ct]
    raw = zlib.decompress(idat); stride = w * bpp; prev = bytearray(stride); p = 0
    for _ in range(h):
        f = raw[p]; p += 1; line = bytearray(raw[p:p+stride]); p += stride
        for x in range(stride):
            a = line[x-bpp] if x >= bpp else 0; b = prev[x]; c = prev[x-bpp] if x >= bpp else 0
            if f == 1: line[x] = (line[x] + a) & 255
            elif f == 2: line[x] = (line[x] + b) & 255
            elif f == 3: line[x] = (line[x] + (a + b) // 2) & 255
            elif f == 4:
                pa, pb, pc = abs(b-c), abs(a-c), abs(a+b-2*c)
                line[x] = (line[x] + (a if pa <= pb and pa <= pc else b if pb <= pc else c)) & 255
        prev = line
        for x in range(w):
            if ct == 3:
                k = line[x]; alpha = trns[k] if trns and k < len(trns) else 255
                if alpha > 200: yield tuple(pal[k])
            elif ct == 6:
                px = line[x*4:x*4+4]
                if px[3] > 200: yield tuple(px[:3])
            elif ct == 2: yield tuple(line[x*3:x*3+3])
            elif ct == 0: yield (line[x],) * 3
            elif ct == 4:
                if line[x*2+1] > 200: yield (line[x*2],) * 3

top = int(sys.argv[2]) if len(sys.argv) > 2 else 6
counts = collections.Counter(c for c in pixels(sys.argv[1]) if min(c) < 235)
total = sum(counts.values()) or 1
for c, n in counts.most_common(top):
    print("#%02x%02x%02x  %5.1f%%" % (*c, 100 * n / total))
