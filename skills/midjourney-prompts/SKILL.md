---
name: "midjourney-prompts"
description: "为 Midjourney（V8.2 默认版本，Discord /imagine 或网页端）写图片生成提示词时使用，包括写实人像、参考图锁脸、电商主图、带文字海报和创意氛围图。"
---

# Midjourney V8.2 提示词

## 先确认的事
- 用户在 Discord（/imagine prompt: 框）还是网页端。没说就按 Discord 写。
- 有没有参考图（人物锁脸、产品、风格）。有人物参考图时，提示词写 keep the exact face from the reference image, same person，不要细描五官。
- 用途：社媒图、电商主图、海报、创意探索。决定 --raw 和 --s 的取值。
- 信息够用就直接写，不追问；缺关键信息（比如产品是什么）才问一句。

## 版本事实（2026 年 10 月）
- V8.2 是默认版本（2026-07-24 起），主打美学、画质和个性化。V8.1 需写 --v 8.1。V8.0 已下线。
- V8 系列喜欢长而具体的提示词，对颜色、光线、空间布局、材质细节理解更准。
- 每次生成 4 张独立图，不是拼图。
- 已失效，不要写：--q、多重提示 ::、--cref、--oref / --ow（Omni Reference）、Turbo、--niji（V8 下）。
- 锁人物/物体改用 Edit Model：Discord 里在提示词末尾加 --edit 再贴图片 URL，多张用空格隔开，最多 4 张。网页端在 Imagine 栏点图片图标拖进 Attach to prompt。
  - Edit 模式自动沿用第一张参考图的比例，需要别的比例必须写 --ar。
  - Edit 模式下可以用指令式句子（keep the same face / make this into a real photo / show from behind）。
  - 多个角色特征串了，建议把角色合到一张参考图里。
  - Edit 不兼容 --tile。
- 图里要文字：文字放英文双引号并带语境，如 a neon sign saying "OPEN 24/7"。单引号无效。文字跑偏时降 --s 到 100 以下或加 --raw，同 seed 重跑。

## 参数速查
- --ar：比例，最高 14:1，开 --hd 时最高 4:1。
- --hd：直出 2K（约 1.3 分钟 GPU，SD 为 0.8）。最终出图用；探索阶段不加。用 Pan/Zoom/局部重绘后会降回 SD。
- --s：0–1000，默认 100。写实/电商 50–150；海报文字 ≤100；氛围创意 500–1000。
- --raw：减少默认美化，提示词更字面。写实摄影、电商、建筑、文字海报默认加。
- --chaos 0–100：4 张差异度，探索构图用 10–30。
- --exp 0–100：更有冲击力的细节，可与 --s 叠加，超过 25 会压制 --s。
- --weird：怪异感，慎用。
- --sref 图片URL 或风格码：风格参考。用时在提示词里也写出风格描述，激活更稳。
- --p：个性化档案（需先在网页端为 V8.2 建档）。官方推荐创意图配 --p 和高 --s。
- --seed：复现，V8 下约 99% 一致。
- --no：排除元素，如 --no text, watermark。
- --iw 0–3：图片提示权重（图片 URL 放提示词开头，单张图必须配文字）。

## 提示词结构
按顺序写成一段自然英文，用逗号连接，不堆无意义形容词：

主体（人物年龄/气质/发型/服装，或产品材质） → 动作/状态 → 场景与道具 → 光线（方向、时段、质感） → 镜头与构图（机位、景别、景深、留白） → 色调与质感 → 媒介风格（editorial photo / candid iPhone photo / product photography / poster） → 参数

写法原则：
- 用摄影语言：soft window light from the left、overhead flat lay、shallow depth of field、85mm、eye level、negative space on the right。
- 写实人像要防网红化：natural skin texture, visible pores, no heavy retouching, candid, slightly imperfect framing。
- 电商主图关注点击率和理解成本：产品居中或三分位、主体清晰、背景干净、预留文案区、材质和卖点可见（水珠、质地、剖面）。
- 一组图要统一（同人、同天、同场景、同服装、同光线）时，每条提示词保留相同的人物/场景/光线描述，只改动作、角度、表情或构图，并锁同一张参考图；必要时同 --seed。
- 用户的中文需求先理解再译成英文画面描述，不要逐字直译。

## 场景模板

写实人像（参考图锁脸）：
```
keep the exact face from the reference image, same person, [年龄+气质] [发型], [服装], [动作], [场景], [光线], natural skin texture, no heavy retouching, candid iPhone photo, [色调] --ar 3:4 --raw --s 50 --edit [参考图URL]
```

电商主图：
```
commercial product photo of [产品+材质+颜色], [摆放/台面材质], [点缀道具], [光线方向与阴影], [背景色], [构图+留白位置], high-end minimal advertising --ar 1:1 --raw --s 100 --hd
```

带文字海报：
```
[风格] poster, large bold [字体类型] headline "[主标题]", small subtitle "[副标题]" at the bottom, [主视觉], [背景与纸张质感], strong typographic hierarchy --ar 2:3 --raw --s 80
```

氛围创意：
```
[主体与动作], [场景], [时间与天气], [镜头景别], [情绪关键词] --ar 16:9 --s 800 --p
```

## 输出格式
- 每条提示词单独放一个代码块，方便直接复制进 /imagine 的 prompt 框；代码块里不要带 /imagine prompt: 前缀。
- 默认给 3–5 条不同方向，或用户要一组时给同一设定下的多条。
- 代码块外只用一两句说明用途或要替换的部分（如参考图 URL），不写长解释。
- 需要参考图时提醒：Discord 里的 URL 要是已上传到网上的图片链接。

## 迭代建议（用户反馈效果不好时）
- 太“AI 味”/过度美化：加 --raw，--s 降到 50 以下。
- 太平淡：去掉 --raw，--s 升到 300–800，加 --p 或 --sref。
- 构图不对：在提示词前段写清机位和景别，加 --chaos 15 多出几种。
- 文字错：缩短文字，确认用双引号，--s ≤100，--raw。
- 角色不像：换更清晰的正脸参考图，或多传一张不同角度，提示词开头写 keep the exact face。