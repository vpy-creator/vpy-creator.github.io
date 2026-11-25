#!/usr/bin/env bash
# Kiểm mọi trang .html trong repo đã gắn Google Analytics (G-NNE6620MNK) chưa.
# Chạy: bash tools/kiem-ga.sh        (chỉ kiểm)
#       bash tools/kiem-ga.sh --gan  (tự gắn thẻ vào trang còn thiếu, ngay sau <meta charset>)
ID="G-NNE6620MNK"
thieu=0
while IFS= read -r f; do
  if ! grep -q "gtag/js?id=$ID" "$f"; then
    if [ "$1" = "--gan" ]; then
      python3 - "$f" "$ID" <<'PY'
import sys,re
f,i=sys.argv[1],sys.argv[2]
tag=('<!-- Google tag (gtag.js) -->\n<script async src="https://www.googletagmanager.com/gtag/js?id=%s"></script>\n'
     '<script>\n  window.dataLayer = window.dataLayer || [];\n  function gtag(){dataLayer.push(arguments);}\n'
     "  gtag('js', new Date());\n  gtag('config', '%s');\n</script>\n")%(i,i)
s=open(f,encoding='utf-8').read()
m=re.search(r'<meta charset[^>]*>\n?',s,re.I) or re.search(r'<head[^>]*>\n?',s,re.I)
s=s[:m.end()]+tag+s[m.end():] if m else tag+s
open(f,'w',encoding='utf-8').write(s)
PY
      echo "Đã gắn: $f"
    else
      echo "Thiếu Google Analytics: $f"; thieu=1
    fi
  fi
done < <(find . -name "*.html" -not -path "./.git/*" -not -path "./.git-*/*" | sort)
[ $thieu -eq 0 ] && echo "Mọi trang đã gắn Google Analytics."
exit $thieu
