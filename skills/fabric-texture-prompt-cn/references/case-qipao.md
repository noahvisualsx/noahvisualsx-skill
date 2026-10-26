# 案例：汉服高定改旗袍

来源：@liluocheng13 的 X 帖子（https://x.com/liluocheng13/status/2114562925524664380），ChatGPT 生成的青花汉服仙女图。用户觉得衣服质感特别好，要求换成旗袍，再出 Midjourney 版。

## 原提示词的质感拆解

- 面料本体：multiple layers of translucent ivory silk, richly embroidered blue brocade
- 层次：半透明象牙丝绸罩在刺绣蓝锦缎上
- 立体工艺：thousands of intricate three-dimensional embroidered peonies … sculptural floral appliqués, elaborate metallic embroidery
- 动态：almost weightless, billowing dramatically in the wind, sculptural curves and intricate organic folds（这是质感最关键的一层）
- 光：realistic textile reflections, delicate rim lighting, subtle volumetric illumination
- 色板：sapphire blue, porcelain white, antique ivory, muted powder blue, champagne gold

缺的一层：面料本体没写光泽，所以改写时补了 heavy liquid silk satin with a soft pearly sheen、light-catching gold threads、subsurface scattering。

## 改成旗袍时做了什么

1. 加版型词：high mandarin collar, champagne gold frog buttons, fitted silhouette, ankle-length, modest side slit at the calf
2. 动态挪到配件：衣服修身不飘，改成一条多层透明欧根纱加蓝锦缎的大披帛去飘
3. 删干净旧词：hanfu、enormous flowing sleeves
4. 刺绣写疏密：densest at the collar, shoulders and hem, fading toward the waist
5. 发型改 1930s Shanghai low chignon，花冠改头饰
6. 脸部描写换成身份锁定句，用母图出脸
7. 删 Rendered in the aesthetic of Midjourney V8.2，对其他模型无效
8. 负面词加 no high thigh slit, no revealing outfit

## Seedream / ChatGPT 版

```
Use the woman in the reference image as the only character. Keep her face shape, bone structure, facial proportions, eyes, nose, lips, skin tone and age exactly the same. Do not change her identity, do not beautify or retouch her face.

An extraordinary masterpiece of Chinese fantasy fine art: this young Chinese woman standing gracefully among blooming cherry blossom trees and flying white cranes.

A breathtaking low-angle cinematic composition, full-body portrait, dramatic upward perspective, a monumental flowing silk shawl and long qipao train sweeping across the entire frame.

Luminous porcelain skin with realistic natural texture, soft crimson lips, subtle peach-red eyeshadow, and a serene, melancholic, aristocratic expression.

Her dark hair is arranged in an elegant low chignon in the 1930s Shanghai style, adorned with a three-dimensional floral hairpiece made of ivory blossoms, sapphire-blue silk flowers, intricate golden filigree, delicate silver ornaments, and long dangling pearl tassels.

She wears an extraordinarily luxurious haute couture qipao in deep sapphire blue, antique ivory, porcelain white, and champagne gold. A high mandarin collar, hand-knotted frog buttons in champagne gold, a fitted silhouette that follows her natural figure, ankle-length hem with a modest side slit at the calf, and a long flowing train.

The qipao is made of heavy liquid silk satin with a soft pearly sheen, covered with thousands of intricate three-dimensional embroidered peonies, delicate ivory blossoms, blue silk flowers, golden botanical ornaments, sculptural floral appliqués, and elaborate metallic embroidery with light-catching gold threads. The embroidery is densest at the collar, shoulders and hem, fading gently toward the waist.

Draped over her arms is an enormous shawl made of multiple layers of translucent ivory silk organza and richly embroidered blue brocade, with cascading ribbons extending across the entire composition.

The sheer silk appears almost weightless, billowing dramatically in the wind, creating magnificent sculptural curves and intricate organic folds, while the qipao itself stays fitted and elegant, with realistic satin highlights and fine fabric tension lines along the body.

Both hands are raised gracefully in front of her chest and face, performing an elegant traditional Chinese dance gesture.

Both hands clearly visible, exactly five anatomically correct fingers on each hand, ten delicate slender fingers in total, naturally separated fingers, elegant feminine hand proportions, realistic knuckles, correct thumb placement, graceful wrists, anatomically accurate joints, natural finger curvature, no overlapping or fused fingers.

Surrounding her are magnificent ancient flowering trees covered with countless delicate ivory-white blossoms. Several elegant white cranes with black-tipped wings and subtle crimson crowns fly gracefully through the scene, their wings dramatically extended. Thousands of tiny flower petals float through the atmosphere, illuminated by soft golden sunlight. A vast muted dusty-blue sky provides a sophisticated atmospheric background.

Extraordinary dynamic composition, powerful diagonal movement, dramatic fabric motion, elegant asymmetry, magnificent visual rhythm, breathtaking sense of scale.

Sophisticated color palette of sapphire blue, porcelain white, antique ivory, muted powder blue, champagne gold, and delicate warm skin tones.

Soft directional sunlight, luminous atmospheric depth, delicate rim lighting, subtle volumetric illumination, realistic textile reflections, soft subsurface scattering through the sheer silk, refined cinematic color grading.

A sophisticated fusion of 1930s Shanghai qipao elegance, contemporary haute couture photography, European Old Master painting, and Japanese fantasy illustration.

Extraordinary painterly details, intricate embroidery, realistic silk satin textures, delicate floral craftsmanship, natural human anatomy, subtle film grain, cinematic depth of field.

Extraordinarily refined painterly realism, breathtaking visual complexity, luxurious artistic craftsmanship, elegant cinematic lighting.

No plastic skin, no excessive beauty retouching, no deformed hands, no extra fingers, no fused fingers, no distorted anatomy, no high thigh slit, no revealing outfit, no text, no watermark.

ratio 9:16
```

## Midjourney 版

```
【MJ 青花丝绸旗袍 仙鹤全身 9:16】（母图放 Omni Reference）
haute couture fantasy fashion photograph, a young Chinese woman in an extraordinarily luxurious sapphire blue and antique ivory silk satin qipao, high mandarin collar, champagne gold frog buttons, ankle-length fitted silhouette with a long flowing train, the qipao covered in thousands of three-dimensional embroidered peonies, ivory blossoms, blue silk flowers and gold metallic thread embroidery catching the light, an enormous shawl of translucent ivory silk organza and embroidered blue brocade billowing weightlessly in the wind, sculptural curves and intricate organic folds sweeping across the frame, elegant 1930s Shanghai low chignon with a floral hairpiece of ivory blossoms, sapphire flowers, gold filigree and long pearl tassels, both hands raised in a graceful classical Chinese dance gesture, serene melancholic expression, standing among ancient blossoming trees, white red-crowned cranes flying with wings spread, thousands of petals drifting in soft golden sunlight, muted dusty blue sky, low-angle cinematic composition, strong diagonal movement, palette of sapphire blue, porcelain white, antique ivory, powder blue and champagne gold, realistic satin sheen and textile reflections, light glowing through sheer silk, delicate rim light, painterly realism, subtle film grain --ar 9:16 --style raw --stylize 400 --no text, watermark, high thigh slit, extra fingers

【MJ 青花丝绸旗袍 刺绣质感半身 4:5】（母图放 Omni Reference）
close-up fashion editorial portrait from the waist up, a young Chinese woman in a sapphire blue and antique ivory silk satin qipao, high mandarin collar with hand-knotted champagne gold frog buttons, dense three-dimensional embroidered peonies and tiny ivory blossoms rising off the fabric, raised gold metallic thread work glinting in the light, soft pearly sheen on heavy liquid silk, a sheer ivory organza shawl drifting across one shoulder in the wind with fine translucent folds, low chignon with pearl tassel hairpin, head slightly turned, calm aristocratic gaze, falling ivory petals, soft directional window light from the side, shallow depth of field, macro-level textile detail, realistic skin texture, muted powder blue background, painterly realism, subtle film grain --ar 4:5 --style raw --stylize 250 --no text, watermark

【MJ 参数说明】
母图：网页版把 01-母图-证件照.png 拖进输入框，放到 Omni Reference（全能参考）位置，权重 --ow 先用 100，脸不像就加到 200 到 300，衣服被母图的衣服带偏就降到 50。
--style raw：少一点 MJ 自带的油画滤镜，更像实拍；想要原帖那种更浓的绘画感就去掉。
--stylize：越高越有 MJ 的审美、越不听提示词，全身那条 400，质感特写那条 250。
--no：MJ 不吃长串的「禁止…」，负面词只能写在 --no 后面。
手指：MJ 新版本手已经很少出错，原帖那段数手指的话删掉了，出错就用 Vary Region 局部重画。
```
