if(_menu==1){
	if(!instance_exists(_inst_item)){
		_inst_item=instance_create_depth(188+6+38,52+6+22,0,text_typer);
		_inst_item.text=_prefix;
		
		var proc=0;
		repeat(Item_GetNumber()){
			_inst_item.text+=Item_GetName(Item_Get(proc))+"&";
			proc+=1;
		}
	}
	if(!instance_exists(_inst_item_use)){
		_inst_item_use=instance_create_depth(188+6+38,52+6+302,0,text_typer);
	}
	if(!instance_exists(_inst_item_info)){
		_inst_item_info=instance_create_depth(188+6+134,52+6+302,0,text_typer);
	}
	if(!instance_exists(_inst_item_drop)){
		_inst_item_drop=instance_create_depth(188+6+248,52+6+302,0,text_typer);
	}
	if(IsEng()){
		_inst_item_use.text=_prefix+"{font 1}USE"
		_inst_item_info.text=_prefix+"{font 1}INFO"
		_inst_item_drop.text=_prefix+"{font 1}DROP"
		}else if(IsChs()){
		_inst_item_use.text=_prefix+"{font 0}使用"
		_inst_item_info.text=_prefix+"{font 0}说明"
		_inst_item_drop.text=_prefix+"{font 0}丢弃"
		}
}else{
	if(_menu!=2){
		if(instance_exists(_inst_item)){
			instance_destroy(_inst_item);
		}
		if(instance_exists(_inst_item_use)){
			instance_destroy(_inst_item_use);
		}
		if(instance_exists(_inst_item_info)){
			instance_destroy(_inst_item_info);
		}
		if(instance_exists(_inst_item_drop)){
			instance_destroy(_inst_item_drop);
		}
	}
}

if(_menu==3){
	if(!instance_exists(_inst_stat_0)){
		_inst_stat_0=instance_create_depth(188+6+22,52+6+26,0,text_typer);
		var name=Flag_Get(FLAG_TYPE.STATIC,FLAG_STATIC.NAME);
		var lv=Flag_Get(FLAG_TYPE.STATIC,FLAG_STATIC.LV);
		var hp=Flag_Get(FLAG_TYPE.STATIC,FLAG_STATIC.HP);
		var hp_max=Flag_Get(FLAG_TYPE.STATIC,FLAG_STATIC.HP_MAX);
		var atk=Flag_Get(FLAG_TYPE.STATIC,FLAG_STATIC.ATK);
		var atk_item=Flag_Get(FLAG_TYPE.STATIC,FLAG_STATIC.ATK_ITEM);
		var def=Flag_Get(FLAG_TYPE.STATIC,FLAG_STATIC.DEF);
		var def_item=Flag_Get(FLAG_TYPE.STATIC,FLAG_STATIC.DEF_ITEM);
		var weapon=Item_GetName(Flag_Get(FLAG_TYPE.STATIC,FLAG_STATIC.ITEM_WEAPON));
		var armor=Item_GetName(Flag_Get(FLAG_TYPE.STATIC,FLAG_STATIC.ITEM_ARMOR));
		var gold=Flag_Get(FLAG_TYPE.STATIC,FLAG_STATIC.GOLD);
		if(IsEng()){
		_inst_stat_0.text=_prefix+"{define `NAME` `"+name+"`}{define `LV` "+string(lv)+"}{define `HP` "+string(hp)+"}{define `HP_MAX` "+string(hp_max)+"}{define `ATK` "+string(atk)+"}{define `ATK_ITEM` "+string(atk_item)+"}{define `DEF` "+string(def)+"}{define `DEF_ITEM` "+string(def_item)+"}{define `WEAPON` `"+(Item_IsValid(Item_GetWeapon()) ? "" : "NONE")+weapon+"`}{define `ARMOR` `"+(Item_IsValid(Item_GetArmor()) ? "" : "NONE")+armor+"`}{define `GOLD` "+string(gold)+"}"+"{font 1}\"{insert NAME}\"{space_y -1}&&{space_y 0}LV  {insert LV}&HP  {insert HP} / {insert HP_MAX}&&AT  {insert ATK} ({insert ATK_ITEM})&DF  {insert DEF} ({insert DEF_ITEM}){space_y -1}&&{space_y 0}WEAPON: {insert WEAPON}&ARMOR: {insert ARMOR}{space_y 4}&{space_y 0}GOLD: {insert GOLD}"
		}else if(IsChs()){
		_inst_stat_0.text=_prefix+"{define `NAME` `"+name+"`}{define `LV` "+string(lv)+"}{define `HP` "+string(hp)+"}{define `HP_MAX` "+string(hp_max)+"}{define `ATK` "+string(atk)+"}{define `ATK_ITEM` "+string(atk_item)+"}{define `DEF` "+string(def)+"}{define `DEF_ITEM` "+string(def_item)+"}{define `WEAPON` `"+(Item_IsValid(Item_GetWeapon()) ? "" : "无")+weapon+"`}{define `ARMOR` `"+(Item_IsValid(Item_GetArmor()) ? "" : "无")+armor+"`}{define `GOLD` "+string(gold)+"}"+"{font 0}\"{insert NAME}\"{space_y -1}&&{space_y 0}{font 0}LV {insert LV}&HP {insert HP}/{insert HP_MAX}&&{font 0}攻击:{font 0}{insert ATK}({insert ATK_ITEM})&{font 0}防御:{font 0}{insert DEF}({insert DEF_ITEM}){space_y -1}&&{space_y 0}{font 0}武器:{insert WEAPON}&{font 0}护甲:{insert ARMOR}{space_y 4}&{space_y 0}{font 0}金钱:{font 0}{insert GOLD}"
		}
	}
	if(!instance_exists(_inst_stat_1)){
		_inst_stat_1=instance_create_depth(188+6+190,52+6+182,0,text_typer);
		var xp=Flag_Get(FLAG_TYPE.STATIC,FLAG_STATIC.EXP);
		var lv=Flag_Get(FLAG_TYPE.STATIC,FLAG_STATIC.LV);
		var lv_xp=Player_GetLvExp(lv+1);
		var kills=Flag_Get(FLAG_TYPE.STATIC,FLAG_STATIC.KILLS);
		if(IsEng()){
		_inst_stat_1.text=_prefix+"{define `EXP` "+string(xp)+"}{define `EXP_NEXT` "+(lv_xp!=-1 ? string(lv_xp-xp) : "`N/A`")+"}"+"{font 1}EXP: {insert EXP}&NEXT: {insert EXP_NEXT}"+(kills>0 ? "{define `KILLS` "+string(kills)+"}"+"{font 1}{space_y -1}&&{space_y 0}&{space_y 4}&{space_y 0}KILLS: {insert KILLS}" : "");
		}else if(IsChs()){
		_inst_stat_1.text=_prefix+"{define `EXP` "+string(xp)+"}{define `EXP_NEXT` "+(lv_xp!=-1 ? string(lv_xp-xp) : "`N/A`")+"}"+"{font 0}EXP:{insert EXP}&{font 0}还差{font 0}:{insert EXP_NEXT}"+(kills>0 ? "{define `KILLS` "+string(kills)+"}"+"{space_y -1}&&{space_y 0}&{space_y 4}&{space_y 0}击杀{font 0}:{insert KILLS}" : "");
		}
	}
}else{
	if(instance_exists(_inst_stat_0)){
		instance_destroy(_inst_stat_0);
	}
	if(instance_exists(_inst_stat_1)){
		instance_destroy(_inst_stat_1);
	}
}

if(_menu==4){
	if(!instance_exists(_inst_phone)){
		_inst_phone=instance_create_depth(188+6+38,52+6+22,0,text_typer);
		_inst_phone.text=_prefix;
		
		var proc=0;
		repeat(Phone_GetNumber()){
			_inst_phone.text+=Phone_GetName(Phone_Get(proc))+"&";
			proc+=1;
		}
	}
}else{
	if(instance_exists(_inst_phone)){
		instance_destroy(_inst_phone);
	}
}