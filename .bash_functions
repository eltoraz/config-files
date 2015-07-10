# function/alias to get a thumbnail from a video with avconv
# 3 args, respectively: input video, time offset (in seconds), output file
_thumbnail() {
    avconv -i $1 -f image2 -ss $2 -vframes 1 $3
}
alias thumb=_thumbnail

# function/alias to transcode a video to CRF 14 H.264/AAC MP4 (esp. helpful with large FRAPS files)
# 2 args: input video, output name
_transcode() {
    VIDEO_CODEC='libx264'
    PRESET='medium'
    CRF='14'
    AUDIO_CODEC='aac -strict experimental'
    avconv -i $1 -c:v $VIDEO_CODEC -preset $PRESET -crf $CRF -c:a $AUDIO_CODEC $2
}
alias transcode=_transcode

_batch_transcode() {
    for vid in *.avi
    do
        vidmp4=`echo $vid | sed -e 's/avi/mp4/g'`
        _transcode $vid $vidmp4
    done
}
alias batch_transcode=_batch_transcode

# extract audio from a bunch of videos
# match input sampling frequency, channels
# 2 args: input video, output file
_extract_audio() {
    AUDIO_CODEC='libmp3lame'
    BITRATE='192k'
    avconv -i "$1" -vn -c:a $AUDIO_CODEC -ab $BITRATE "$2"
}
alias extract_audio=_extract_audio

_batch_extract_audio() {
    EXT_REGEX='.\.(mp4|webm)$'
    LOGFILE='batch_extract_audio.log'
    
    if [[ ! -f $output ]]; then
        touch $LOGFILE
    fi

    for file in *.*
    do
        if [[ $file =~ $EXT_REGEX ]]; then
            output=`echo $file | sed -e 's/\(mp4\|webm\)/mp3/g'`
            if [[ ! -f $output ]]; then
                _extract_audio "$file" "$output"
            else
                echo "warning: skipping $file since output $output already exists" >> $LOGFILE
            fi
        fi
    done
}
alias batch_extract_audio=_batch_extract_audio

_livestreamer() {
    ~/.local/bin/livestreamer twitch.tv/$1 best
}
alias livestreamer=_livestreamer
