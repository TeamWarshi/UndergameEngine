if(temp1=0){
audio_play_sound(bgm_gameover,0,1)
temp1=1}
if(image_alpha<1){
image_alpha+=0.01
alarm[6]=1}else{
alarm[6]=-1
if(IsEng()){
a=instance_create_depth(200,320,depth-1,text_typer)
a.text="{color `white`}{speed 5}{font 1}{scale 2}{voice 1}Stay determined...&&  {choice 0} Retry          {choice 1} Give Up{instant false}{choice `CHOICE`}{pause}{choice_retry}{end}"}
if(IsChs()){
a=instance_create_depth(220,320,depth-1,text_typer)
a.text="{color `white`}{speed 5}{font 0}{scale 2}{speed 8}{voice 1}保持你的决心...&& {choice 0}重试     {choice 1}放弃{instant false}{choice `CHOICE`}{pause}{choice_retry}{end}"}
}