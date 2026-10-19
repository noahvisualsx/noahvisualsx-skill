---
name: "omni"
description: "为 Google Gemini Omni（Gemini app / Flow 里的视频模型）写视频生成提示词时使用，包括用参考图做角色、多条片段和对话式修改。"
---

# Omni 视频提示词

专门给 Gemini Omni（目前是 Omni Flash，单条最长约 10 秒，最高 1080p，带原生同步音频）写提示词。用户在 Gemini app / 网页版点 Create video，或在 Google Flow 里使用。

## Omni 的写法逻辑

- 像给摄影师写一份简短的分镜简报，不堆关键词。
- 用镜头语言：景别、机位、运镜、焦段感、对焦。
- 参考图要点名用途：写清楚上传的图是角色参考 / 场景参考 / 风格参考。多张图时按「第一张图」「第二张图」或按内容指代。
- 10 秒按时间节拍写（0-3s / 3-7s / 7-10s），每个节拍写动作，必要时写镜头变化。
- 每条都写音频：环境音、动作音、人声（叹气、轻笑等），默认不要配乐，除非用户要。
- 一致性靠「同一场景上对话式修改」，不靠重抽。出片后哪里不对，就在同一对话里补一句修改指令。

## 角色锁定

- 用户会上传参考图锁脸。提示词只写「Use the uploaded image as the character reference, keep her/his face unchanged」，不要细致描写五官。
- 发型、服装、关键道具要写出来帮助锁定（例如颜色、图案、领口、刘海样式）。
- 每条片段都提醒用户把同一张参考图一起传。

## 默认输出

- 默认写 4 条独立片段，同一人、同一天、同场景、同服装、同光线，只改变动作、角度、表情或构图。不做拼接、不做九宫格。
- 默认竖屏 9:16，真实手机拍摄感、自然光、轻微手持晃动，保留皮肤质感和发丝，不网红化、不美颜、不过度磨皮、不做电影调色。用户要别的风格就按用户的来。
- 画面里出现手机屏幕、招牌等时，除非用户要文字，否则写「Do not show any readable text」。
- 提示词用英文写，每条单独放进代码块方便复制。片段标题和说明用中文，简短。
- 最后附 1 条通用修改指令示例，例如：`Edit this keeping everything the same, only ...`
- 如果用户给了剧情，就按剧情拆镜头，保持场景、服装、光线连续；没给剧情就用日常场景，并在结尾一句话说明可以按剧情串起来。

## 单条模板

```
Use the uploaded image as the character reference for [role]. Keep [her/his] face, hairstyle and outfit exactly as in the reference: [hair], [outfit].

Scene: [location], [time of day], [light source and quality], [key props].

0-3s: [shot + action]
3-7s: [action + camera change if any]
7-10s: [ending beat / expression]

Camera: vertical 9:16, [device feel], [angle], [movement], [framing].
Audio: [ambience], [action sounds], [voice sounds], no music.
Style: realistic phone footage, natural skin texture, no beauty filter, no heavy smoothing, no cinematic color grade.
```

## 修改指令写法

- 只改一处：`Edit this keeping everything the same, only change [X].`
- 改节奏：`Keep everything the same, make her movements slower and more natural.`
- 改镜头：`Keep the scene and character the same, reframe as a close-up from slightly above.`
- 改表情：`Keep everything the same, make the smile at the end more subtle.`