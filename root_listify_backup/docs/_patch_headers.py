import re
from pathlib import Path

root = Path(r"E:/xampp/htdocs/listify.asia/resources/views/layouts")
pat = re.compile(
    r"@php\s*// Unread count[\s\S]*?</ul>\s*</li>\s*@endif",
    re.MULTILINE,
)
repl = "@include('layouts.partials.header-notification-bell')"
for p in list(root.rglob("header.blade.php")) + [root / "_header.blade.php"]:
    if not p.exists():
        continue
    t = p.read_text(encoding="utf-8")
    if "// Unread count" not in t:
        continue
    t2, n = pat.subn(repl, t, count=1)
    if n:
        p.write_text(t2, encoding="utf-8")
        print("updated", p)
    else:
        print("NO MATCH", p)
