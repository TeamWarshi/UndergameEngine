draw_sprite_ext(spr_pixel,0,450,246,80,20,0,c_red,1)
draw_sprite_ext(spr_pixel,0,450,246,80*world.volume,20,0,c_yellow,1)

/*if(IsChs()){
draw_set_font(font_chs)
draw_set_color(c_orange)
draw_text_transformed(70,109,"提示: 当前语言可能会导致在低配置设备上出现卡顿现象",1,1,0)
}*/

draw_set_font(font_dialog)
if(choice!=5){
draw_set_color(c_white)
}else if(choice=5){
draw_set_color(c_yellow)}
draw_text_transformed(540,238.3,string(round(world.volume*100))+"%",2,2,0)