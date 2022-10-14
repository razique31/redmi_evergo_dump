#!/system/bin/sh
function enable_playback()
{
	printf "打开听筒通路++\n"
	tinymix 'ADDA_DL_CH1 DL1_CH1' '1'
	tinymix 'ADDA_DL_CH2 DL1_CH2' '1'
	tinymix 'RCV_AMP_MODE' 'RECIEVER_MODE'
	tinymix 'DAC In Mux' 'Normal Path'
	tinymix 'RCV Mux' 'Voice Playback'
	tinymix 'Ext_Reciver_Amp Switch' '1'
	tinymix 'SpkrRight Sia81xx Power' 'On'
	tinymix 'SpkrRight Sia81xx Audio Scene' 'Receiver'
}
function disable_playback
{
	printf "关闭播放通路++\n"
	tinymix 'ADDA_DL_CH1 DL1_CH1' '0'
	tinymix 'ADDA_DL_CH2 DL1_CH2' '0'
	tinymix 'RCV Mux' 'Open'
	tinymix 'Ext_Reciver_Amp Switch' '0'
	tinymix 'SpkrRight Sia81xx Power' 'Off'
}
enable_playback
printf "start playing\n"
tinyplay /vendor/etc/ultrasound.wav
disable_playback
