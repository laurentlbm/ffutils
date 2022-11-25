video_file=${args[video]}
srt_file=${args[output]}

if [[ $video_file = *\'* ]] ; then
  abort "The video filename cannot contain single quotes, its breaks the ffmpeg filter somehow..."
fi

# No output file specified, output to a file in the current directory.
[[ $srt_file ]] || {
  filename=$(basename -- "${video_file}")
  srt_file="${filename%.*}.srt"
}

# Escape '[' and ']' because they are used in the `ffmpeg` filter syntax.
video_file="${video_file//\\/\\\\}"
video_file="${video_file//\[/\\[}"
video_file="${video_file//\]/\\]}"

say "extract-cc" "Extracting closed captions from video file."
ffmpeg -f lavfi -i "movie='${video_file}'[out0+subcc]" -map s "${srt_file}"

say "extract-cc" "Cleaning up subtitles (removing HTML and other tags)."
pysubs2 --clean "${srt_file}"
