//Dialog_Add("* The Engine won't make you drop&  it.");
if(IsEng()){
	Dialog_Add("* Yuhang ran away.")
}else if(IsChs()){
	Dialog_Add("* 你宇航大跌陶艺了。")
}
Dialog_Start();

Item_Remove(_item_slot);
audio_play_sound(snd_item_swallow,0,false);

instance_destroy();