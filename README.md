# ffutils
Some ffmpeg helpers I made for myself.

## Extract closed captions from video file

```
Usage:
  ffutils extract-cc VIDEO [OPTIONS]
  ffutils extract-cc --help | -h

Options:
  --help, -h
    Show this help

  --output, -o OUTPUT
    Target filename (default: .srt file named after video file, saved in current
    directory)

Arguments:
  VIDEO
    Video file

Examples:
  ffutils extract-cc video_file.mp4
  ffutils extract-cc /path/video_file.mp4 -o /path2/suds.srt
```

## Bash completions
Add this to your `.bashrc` file:
``` 
eval "$(ffutils completions)"
```
