///@arg x,y,*angle,*type,*spawn_time,*wait_time,*xscale,*yscale,*aim_offset,*hoffset,*voffset,*obj,*spr,*prepare_sound,*shoot_sound
function Battle_GunShoot_Yuhang(){
var OBJ=battle_bullet_gun
if(argument_count>11){OBJ=argument[11]}
var inst=instance_create_depth(argument[0],argument[1],DEPTH_BATTLE.BULLET_OUTSIDE_HIGH,OBJ)
if(argument_count>2){inst.image_angle=argument[2]}
if(argument_count>3){inst.type=argument[3]}
if(argument_count>4){inst.spawn_time=argument[4]}
if(argument_count>5){inst.wait_time=argument[5]}
if(argument_count>6){inst.image_xscale=argument[6]}
if(argument_count>7){inst.image_yscale=argument[7]}
if(argument_count>8){inst.aim_offset=argument[8]}
if(argument_count>9){inst.hoffset=argument[9]}
if(argument_count>10){inst.voffset=argument[10]}
if(argument_count>12){inst.sprite_index=argument[12]}
if(argument_count>13){inst.prepare_snd=argument[13]}
if(argument_count>14){inst.shoot_snd=argument[14]}
if(instance_exists(battle_enemy_yuhang)){
battle_enemy_yuhang._body=8
var g=instance_create_depth(battle_enemy_yuhang.bodyx,battle_enemy_yuhang.bodyy,0,anim_gun_shoot)
g.wait=inst.spawn_time+inst.wait_time
}
if(instance_exists(battle_warma_turn4)){
battle_warma_turn4._body=8
var g=instance_create_depth(battle_warma_turn4.bodyx,battle_warma_turn4.bodyy,0,anim_gun_shoot)
g.wait=inst.spawn_time+inst.wait_time
}
return inst
}