///@desc Init
audio_stop_all()
global.kr=0
Player_SetKR(0)
_hp=1
_hpmax=1
audio_stop_all()
global.shield=true
global.shield_useable=true
Battle_SetEnemyAtk(1)
Battle_SetPlayerTempInv(60)
Battle_SetEnemyActionNumber(_enemy_slot,3);
if(IsEng()){
Battle_SetEnemyName(_enemy_slot,"Enemy Name");
Battle_SetEnemyActionName(_enemy_slot,0,"Check")
Battle_SetEnemyActionName(_enemy_slot,1,"Pray")
Battle_SetEnemyActionName(_enemy_slot,2,"Heal")
Battle_SetEnemyActionInfo(_enemy_slot,0,"Check enemy data")
Battle_SetEnemyActionInfo(_enemy_slot,1,"Clear Karma")
Battle_SetEnemyActionInfo(_enemy_slot,2,"{color `lime`}+Full HP")
}else if(IsChs()){
Battle_SetEnemyName(_enemy_slot,"{font 0}敌人名称");
Battle_SetEnemyActionName(_enemy_slot,0,"{font 0}检查")
Battle_SetEnemyActionName(_enemy_slot,1,"{font 0}祈祷")
Battle_SetEnemyActionName(_enemy_slot,2,"{font 0}治疗")
Battle_SetEnemyActionInfo(_enemy_slot,0,"{font 0}查看敌人数据")
Battle_SetEnemyActionInfo(_enemy_slot,1,"{font 0}清除{font 1}Karma")
Battle_SetEnemyActionInfo(_enemy_slot,2,"{color `lime`}+{font 0}满{font 1}HP")
}


ab=instance_create_depth(0,0,0,battle_bg)
ab.image_blend=$E16941
ab.image_yscale=3
ba=instance_create_depth(0,room_height,0,battle_bg)
ba.image_blend=c_orange
ba.image_yscale=-3

aba=instance_create_depth(0,room_height,0,battle_bg)
aba.image_blend=c_aqua
aba.image_angle=90
aba.image_yscale=3
bab=instance_create_depth(room_width,0,0,battle_bg)
bab.image_blend=c_red
bab.image_angle=-90
bab.image_yscale=3