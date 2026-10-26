---
name: fabric-texture-prompt-cn
description: 提升 AI 生图里衣服质感的提示词方法：拆解一段提示词为什么衣服质感好，把这套质感写法迁移到别的服装（汉服换旗袍、换婚纱、换西装等），并按模型改写成 Seedream / 即梦、ChatGPT 图像、Nano Banana、Midjourney 各自的格式。用户说「衣服质感不好」「衣服像塑料」「怎么让面料更高级」「这张图衣服质感特别好帮我分析」「把这件衣服换成旗袍但质感保留」「刺绣糊了」「丝绸不飘」「改成 Midjourney 提示词」时使用；给虚拟人做服装写真、古风 / 国风 / 高定时装图时也使用。
version: 1.0.0
---

# 衣服质感提示词

## 何时用

- 用户贴了一段别人的提示词或一张图，说衣服质感好，想知道靠什么撑起来的
- 想保留质感、换一种衣服（汉服→旗袍、礼服→西装）
- 生成出来衣服发假：塑料感、刺绣一片糊、纱不透、布料僵硬
- 同一套衣服要在不同模型里出图

不负责人物脸和身材一致性，那部分用 `refimg-prompt-cn` 和用户自己的虚拟人身材模板（`~/图文创作/02-提示词库/虚拟人身材-通用模板（填空复用）.txt`）。两者一起用时，身份锁定句永远放在最前面。

---

## 核心：质感五层

衣服显得贵，不是靠「luxurious」「high quality」这种形容词，而是五层具体描述叠在一起。拆别人的提示词、写新提示词都按这五层逐一检查，缺哪层补哪层。

| 层 | 写什么 | 例子（英文模型更认英文） |
|---|---|---|
| 1 面料本体 | 材质 + 重量 + 表面光泽，三样都要有 | heavy liquid silk satin with a soft pearly sheen；matte wool crepe；crisp cotton poplin |
| 2 层次 | 不透明的底 + 半透明的罩，写清罩在哪里 | translucent ivory silk organza layered over embroidered blue brocade |
| 3 立体工艺 | 工艺名称 + 立体程度 + 数量级 + 疏密分布 | thousands of three-dimensional embroidered peonies, raised gold metallic thread work, densest at the collar and hem, fading toward the waist |
| 4 动态 | 布料怎么动、褶皱什么形状 | weightless, billowing in the wind, sculptural curves, intricate organic folds；修身衣服写 fine fabric tension lines along the body |
| 5 光和材质的互动 | 光打在面料上发生什么 | realistic textile reflections, light-catching gold threads, soft subsurface scattering through the sheer silk, delicate rim light |

再加两样辅助：
- **色板**：3 到 5 个带材质感的颜色名，不写 blue / white，写 sapphire blue、antique ivory、porcelain white、champagne gold
- **镜头**：看质感用 macro-level textile detail、shallow depth of field；要气势用 low-angle、布料占满画面

判断质感是否到位的检查句：**把衣服那几句单独拿出来，不看图能不能想象出摸上去的手感和光打上去的样子。** 想象不出来就是层数不够。

---

## 换衣服时保留质感

换服装种类时，五层里只有 1、2、3 可以直接沿用，4 动态要按版型重新分配。

**宽松飘逸的衣服**（汉服、披风、长裙、婚纱拖尾）：衣服本身就能飘，动态写在衣服上。

**修身的衣服**（旗袍、西装、紧身礼服、针织）：衣服本身飘不起来，硬写 billowing 会把版型改成宽袍大袖。做法是：
- 衣服本身写贴身的张力和高光：fitted silhouette, realistic satin highlights, fine fabric tension lines along the body
- 动态交给配件：披帛 / 披肩、拖尾、飘带、头纱、长流苏，写成 an enormous shawl of translucent silk billowing...
- 版型关键词写死：旗袍写 high mandarin collar、frog buttons、ankle-length；西装写 sharp tailored shoulders、peak lapels

常见服装的写法见 `references/garments.md`，词汇库见 `references/vocab.md`。

换完必查：新衣服的标志性结构（领、扣、袖、开衩、廓形）有没有写，旧衣服的标志词（hanfu、enormous flowing sleeves）有没有删干净。漏删一个，模型就会画成混搭。

---

## 按模型改写

| 模型 | 写法 | 人物锁定 | 负面词 |
|---|---|---|---|
| Seedream / 即梦 5.0 Pro | 完整句子，中英文都可以，可以长 | 开头一句锁定参考图人物，上传母图 | 结尾写成句子：No plastic skin, no text... 或「禁止…」 |
| ChatGPT 图像 | 完整句子，分段，越具体越好 | 同上 | 同上 |
| Nano Banana | 完整句子，偏短更稳 | 同上，多图时写清每张图管什么 | 写成句子 |
| Midjourney | 逗号分隔的短语，删掉解释性的句子和数手指的长段 | 母图放 Omni Reference，`--ow` 先 100，脸不像加到 200 到 300，衣服被母图带偏降到 50 | 只能写在 `--no` 后面 |

Midjourney 参数默认：全身大场面 `--style raw --stylize 400`，质感特写 `--style raw --stylize 250`；想要更浓的绘画感去掉 `--style raw`。不写 `--v`，用账号默认最新版本；参数名以用户当前版本为准，不确定就提醒用户核对。

提示词里写「Rendered in the aesthetic of Midjourney Vx」对其他模型没有作用，迁移时删掉。

---

## 合规（用户要发 X，要算原创收益）

- 半透明面料只用在披肩、袖子、外罩层，不要罩在身体上，写清 sheer layer 的位置
- 旗袍开衩写 modest side slit at the calf，负面词加 no high thigh slit, no revealing outfit
- 改写别人的提示词时，在保存的文件和交付说明里注明原作者，发帖建议首评注明出处

---

## 出问题怎么改

| 现象 | 原因 | 改法 |
|---|---|---|
| 衣服像塑料 | 只写了光泽，没写织物纹理 | 加 visible weave texture、fine silk threads，光泽改成 soft sheen 而不是 glossy |
| 刺绣糊成一片 | 没写尺度和疏密 | 写清花的大小、立体程度、在哪里最密、往哪里渐疏 |
| 纱不透、像白布 | 没写透光 | 加 light glowing through sheer silk、subsurface scattering，背景给逆光 |
| 布料僵硬 | 第 4 层缺失 | 加风、加 organic folds；修身衣服把动态挪到配件上 |
| 旗袍被画成汉服 | 留了大袖、hanfu、巨大披帛 | 删掉旧服装词，披帛那句先删掉试一次 |
| 质感好了但脸跑了 | 服装描述太长压过身份锁定 | 身份锁定句放最前；MJ 提高 `--ow`；Seedream 删减人物外貌描写，只靠母图 |
| 颜色发脏 | 颜色名太泛或太多 | 色板限 3 到 5 个带材质感的颜色 |

---

## 交付

1. 先用两三句话说清这件衣服的质感靠哪几层撑起来，缺了哪层
2. 给完整提示词，每个模型一个代码块，可直接复制
3. 说明用法：传哪张母图、比例、关键参数
4. 写一两条最可能翻车的地方和改法
5. 存进 `~/图文创作/02-提示词库/`，文件内用 `【名称】（备注）` 分段，工作台能直接读到
6. 回复用中文，不用 emoji

完整示例（汉服高定改旗袍，Seedream 版和 Midjourney 版）见 `references/case-qipao.md`。
