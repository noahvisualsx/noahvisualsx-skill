# 人物参考图读取：IM 沙盒与权限处理

## 典型故障

用户从微信等 IM 拖入的图片，本地路径形如：

```
~/Library/Containers/com.tencent.xinWeChat/Data/Documents/xwechat_files/.../temp/RWTemp/...jpg
```

对该路径执行 `cp`、`Read`、`FileBatchUpload` 均可能返回：

```
Operation not permitted / FILE_ACCESS_DENIED
```

这是 macOS TCC 对 IM 容器目录的保护。即使调用过文件夹授权，命令行/读取通道仍可能被拦截。

## 处理步骤

1. 不要对同一沙盒路径反复重试，也不要靠改写命令绕过。
2. 用 `interaction.ask` 请用户二选一重新提供：
   - 在 IM 中打开图片，右键「存储图片 / 另存为」，保存到「下载」或「桌面」；
   - 或直接把原图再次拖入对话框，生成新副本。
3. 在受保护容器之外查找最新图片：

```bash
ls -lat ~/Downloads/*.jpg ~/Downloads/*.jpeg ~/Desktop/*.jpg ~/Desktop/*.jpeg 2>/dev/null | head
```

4. 把找到的图片复制到项目目录，再用 `Read` 打开：

```bash
cp "<找到的路径>" "<项目目录>/ref_girl.jpg"
```

5. 若复制仍报权限不足，如实说明是系统隐私权限拦截，等待用户进一步指示（例如在「系统设置 → 隐私与安全性 → 完全磁盘访问权限」中授权），不要降级或臆测人物外观。

## 底线

读不到真实参考图，就不得进入最终确认或生成，禁止凭文字想象人物五官与服装。
