//Dialog_Add("* You won't be able to drop it.");
if(IsEng()){
	Dialog_Add("{font 0}* You throw Cake away.")
}else if(IsChs()){
	Dialog_Add("{font 0}* {font 0}你扔掉了蛋糕。")
}
Dialog_Start();

Item_Remove(_item_slot);
audio_play_sound(snd_item_swallow,0,false);

instance_destroy();