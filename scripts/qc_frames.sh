#!/usr/bin/env bash
# 下载（如需）并对自拍短视频抽帧，供人工/Read 质检。
# 用法:
#   bash qc_frames.sh <视频URL或本地mp4路径> <工作目录> [时间点,逗号分隔]
# 示例:
#   bash qc_frames.sh https://host/v.mp4 /tmp/proj 1,5,9,13,17,19
set -euo pipefail

SRC="${1:-}"
WORK="${2:-}"
TIMES="${3:-1,4,7,10,13,16,19}"

if [[ -z "$SRC" || -z "$WORK" ]]; then
  echo "用法: bash qc_frames.sh <视频URL或本地路径> <工作目录> [时间点,逗号分隔]" >&2
  exit 1
fi
command -v ffmpeg >/dev/null || { echo "未找到 ffmpeg" >&2; exit 1; }
command -v ffprobe >/dev/null || { echo "未找到 ffprobe" >&2; exit 1; }

mkdir -p "$WORK/frames"
VIDEO="$WORK/qc_video.mp4"

if [[ "$SRC" =~ ^https?:// ]]; then
  echo ">> 下载视频: $SRC"
  curl -sL "$SRC" -o "$VIDEO"
else
  VIDEO="$SRC"
fi

if [[ ! -s "$VIDEO" ]]; then
  echo "视频文件为空或不存在: $VIDEO" >&2
  exit 1
fi

echo ">> 元信息:"
ffprobe -v error \
  -show_entries format=duration,bit_rate \
  -show_entries stream=codec_type,codec_name,width,height \
  -of default=noprint_wrappers=1 "$VIDEO"

echo ">> 抽帧:"
IFS=',' read -ra TLIST <<< "$TIMES"
for t in "${TLIST[@]}"; do
  out="$WORK/frames/f_${t}.jpg"
  ffmpeg -v error -ss "$t" -i "$VIDEO" -frames:v 1 -q:v 3 "$out" -y
  echo "$out"
done

echo ">> 完成，共 ${#TLIST[@]} 帧，位于 $WORK/frames"
