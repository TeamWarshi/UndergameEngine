choice=0
temp=0

title=instance_create_depth(140,100,0,text_typer)
keyboard=instance_create_depth(170,220,0,text_typer)
controller_n=instance_create_depth(170,255,0,text_typer)
controller_x=instance_create_depth(170,290,0,text_typer)
if(IsEng()){
prefix="{instant true}{scale 2}{font 1}"
title.text=prefix+"Controller was detected.&Which playing method do you prefer?"
keyboard.text=prefix+"{color `yellow`}Keyboard"
controller_n.text=prefix+"Controller (Nintendo Standard)"
controller_x.text=prefix+"Controller (Xbox Standard)"}
if(IsChs()){
prefix="{instant true}{scale 2}{font 0}"
title.text=prefix+"已检测到控制器。&你想使用哪种方式游玩?"
keyboard.text=prefix+"{color `yellow`}键盘"
controller_n.text=prefix+"手柄 (Nintendo标准)"
controller_x.text=prefix+"手柄 (Xbox标准)"}