///@desc Use
//Dialog_Add("* You ate TML.&{sleep 20}* Undertale Engine Forever!&{sleep 20}* Your HP is maxed out.");
if(IsEng()){
	Dialog_Add("* You want to eat Mayse.{sleep 20}&* He gave you a slap and ran&  away.{sleep 20}{clear}* You got a cat claw mark on your&  face.{pause}{clear}* You recovered 1+5+7+4+9 HP.")
}else if(IsChs()){
	Dialog_Add("* 你想吃掉Mayse。{sleep 20}&* Mayse给了你一巴掌然后跑走了。{sleep 20}&* 你脸上喜提猫爪痕。{pause}{clear}* 你恢复了1+5+7+4+9点HP。")
}
Dialog_Start();

Player_Heal(1+5+7+4+9);

Item_Remove(_item_slot);

audio_play_sound(snd_item_heal,0,false);

event_inherited();