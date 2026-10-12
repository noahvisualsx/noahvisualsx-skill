---
name: x-carousel-split
description: 用户发一张图说拼图、三联屏、切成几条、做 X 横滑拼图时使用：把图竖切成等宽长条并出带白缝圆角的预览，按顺序发回，附构图和比例建议。
---

# X 横滑拼图（三联屏）

原理：X 多图帖是横着滑的，把一张宽图竖切成几条按顺序上传，看起来就是一整张被白缝隔开的画面。不是几张独立的图。

## 流程

1. 读图拿到宽高，判断横竖：
   - 横图（宽 >= 高）：默认切 3 条；16:9 及更宽可以切 4 条。
   - 竖图或方图：切 2 条和 3 条各出一版让用户挑，并提醒竖图切 3 条每条会很细长（约 1:4），X 信息流可能裁掉上下。
   - 用户指定条数就按用户的来。
2. 用下面的脚本切图并生成预览。
3. 自己先看一眼预览：切线落在哪里（最好穿过眼睛、鼻梁、主体中间这类让人想滑过去看全的位置），哪版更好。
4. 把文件发回给用户：先发预览，再按顺序发切好的长条（文件名带序号）。
5. 回复保持简短：推荐哪一版、为什么（切线落在哪）、上传顺序、比例提醒。

## 切图脚本

把 SRC 换成图片路径，NS 换成要切的条数列表：

```python
from PIL import Image, ImageDraw
SRC = '图片路径'
NS = (2, 3)
im = Image.open(SRC).convert('RGB'); W, H = im.size
for n in NS:
    edges = [round(W * i / n) for i in range(n + 1)]
    parts = [im.crop((edges[i], 0, edges[i + 1], H)) for i in range(n)]
    for i, p in enumerate(parts):
        p.save(f'{n}张_{i + 1}.png')
    gap, pad, r = 24, 40, 36
    cw = sum(p.width for p in parts) + gap * (n - 1) + pad * 2
    c = Image.new('RGB', (cw, H + pad * 2), 'white'); x = pad
    for p in parts:
        m = Image.new('L', p.size, 0)
        ImageDraw.Draw(m).rounded_rectangle((0, 0, p.width - 1, p.height - 1), radius=r, fill=255)
        c.paste(p, (x, pad), m); x += p.width + gap
    c.save(f'预览_{n}张.jpg', quality=92)
print(W, H)
```

切出来的长条本身是直角原图，不加白边圆角（X 会自己加圆角和间隙），预览图只是给用户看效果。

不能运行代码时：算出每条的像素范围告诉用户（宽 W 切 n 条，第 i 条从 W*(i-1)/n 到 W*i/n），让用户用切图 App 按这个范围切。

## 给用户的建议要点

- 比例：每条接近 4:9 时在 X 里最好看。3 条拼 4:3 左右，4 条拼 16:9。以后专门做拼图，出图时直接用宽比例（MJ 写 --ar 16:9 或 --ar 4:3）。
- 构图：主体要跨过切线，比如一只眼睛被切成两半、脸从鼻梁处分开，用户得滑过去才能看全，停留更久。不要让主体正好落在某一条正中间。
- 上传：严格按 1、2、3 的顺序传，顺序错了画面就断了。
- 电脑端也可以用 X-Puzzle-Kit 这类 Chrome 插件，手机上搜全景切图类 App。

## 写拼图专用提示词时

用户要先出图再拼，就按横幅构图写：主体横向延展，近景特写或宽景都行，在提示词里写清楚主体位置跨越画面中部，比例用 --ar 16:9（切 4 条）或 --ar 4:3（切 3 条）。MJ 写法：短句、强调材质和光、Raw 用 Standard、stylize 300 到 400、锁脸放 Edit。
