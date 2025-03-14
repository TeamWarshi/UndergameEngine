///@arg menu
///@arg call_event*
function Battle_SetMenu() {
	var MENU=argument[0];
	var CALL=true;
	if(argument_count>=2){
		CALL=argument[1];
	}

	battle._menu=MENU;
	Battle_SetDialog("",false,false);
	Battle_SetDialog("",false,true);
	
	////////////////////////////////////////
	//按钮
	if(MENU==BATTLE_MENU.BUTTON){
		Battle_SetDialog(Battle_GetMenuDialog());
	}
	
	////////////////////////////////////////
	//战斗/行动目标
	if(MENU==BATTLE_MENU.FIGHT_TARGET || MENU==BATTLE_MENU.ACT_TARGET){
		//越界归零
		if(Battle_GetMenuChoiceEnemy()>=Battle_GetEnemyNumber()){
			Battle_SetMenuChoiceEnemy(0,false);
		}
		
		var text="";
		var proc=0;
		//创建敌人列表文字
		repeat(3){
			var inst=Battle_GetEnemy(proc);
			if(instance_exists(inst)){
				a=instance_create_depth(0,0,0,battle_menu_fight_hp_bar)
				a.enemy_slot=proc
				a.hp=inst._hp
				a.hp_max=inst._hpmax
				if(Battle_IsEnemySpareable(proc)){
					text+="{color `yellow`}"
				}
				text+=Battle_GetEnemyName(proc)+"{color `white`}&";
			}
			proc+=1;
		}
		Battle_SetDialog(text,true);
	}

	if(MENU==BATTLE_MENU.FIGHT_AIM){
		Battle_SetMenuFightAnimTime(0);
		Battle_SetMenuFightDamageTime(0);
	
		var OBJ=Flag_Get(FLAG_TYPE.STATIC,FLAG_STATIC.BATTLE_MENU_FIGHT_OBJ);
		//var OBJ=battle_menu_fight_knife
		if(object_exists(OBJ)){
			if(OBJ==battle_menu_fight||Object_GetBaseParent(OBJ)==battle_menu_fight){
				instance_create_depth(0,0,0,OBJ);
				OBJ.image_yscale=OBJ.base_yscale*0.97
				OBJ.image_xscale=OBJ.base_xscale*1
				/*OBJ.image_xscale=0
				OBJ.image_yscale=OBJ._base_yscale*0.97
				OBJ.image_alpha=0
				Anim_Create(OBJ,"image_xscale",0,0,0,OBJ._base_xscale*1.05,15);
				Anim_Create(OBJ,"image_xscale",0,0,OBJ._base_xscale*1.05,-(OBJ._base_xscale*0.06),5,15);
				Anim_Create(OBJ,"image_alpha",0,0,0,1,10);*/
			}
		}
	}
	////////////////////////////////////////
	//行动内容
	if(MENU==BATTLE_MENU.ACT_ACTION){
		Battle_SetMenuChoiceAction(0,false);
		instance_create_depth(0,0,0,battle_menu_action_scrollbar);
	}

	//物品
	if(MENU==BATTLE_MENU.ITEM){
		Battle_SetMenuChoiceItem(0,false);
		if!(instance_exists(battle_menu_item_scrollbar)){
		instance_create_depth(0,0,0,battle_menu_item_scrollbar);}
	}
	if(MENU==BATTLE_MENU.ITEM_SECONDARY){
		Battle_SetMenuChoiceItem(Battle_GetMenuChoiceItem(),false);
		Battle_SetMenuChoiceItemSecondary(0,false);
		if!(instance_exists(battle_menu_item_scrollbar)){
		instance_create_depth(0,0,0,battle_menu_item_scrollbar);}
	}

	//仁慈
	if(MENU==BATTLE_MENU.MERCY){
		var text="";
		if(!Battle_IsMenuChoiceMercyOverride()){
			//越界归零
			if(Battle_GetMenuChoiceMercy()>Battle_IsMenuMercyFleeEnabled()){
				Battle_SetMenuChoiceMercy(0,false);
			}
		
			var proc=0;
			//仁慈菜单文字
			repeat(3){
				if(Battle_IsEnemySpareable(proc)){
					text+="{color `yellow`}";
					break;
				}
				proc+=1;
			}
			if(IsEng()){
			text+="* Spare"
			}else if(IsChs()){
			text+="* {font 0}饶恕"
			}
		
			//逃跑是否可用
			if(Battle_IsMenuMercyFleeEnabled()){
				text+="&{color `white`}";
			if(IsEng()){
			text+="* Flee"
			}else if(IsChs()){
			text+="* 逃跑"}
			}
		}else{
			if(Battle_GetMenuChoiceMercy()>=Battle_GetMenuChoiceMercyOverrideNumber()){
				Battle_SetMenuChoiceMercy(0,false);
			}
		
			var proc=0;
			repeat(Battle_GetMenuChoiceMercyOverrideNumber()){
				text+=Battle_GetMenuChoiceMercyOverrideName(proc);
				text+="&";
				proc+=1;
			}
		}
		Battle_SetDialog(text,true);
	}
	
	////////////////////////////////////////
	if(CALL){
		Battle_CallEnemyEvent(BATTLE_ENEMY_EVENT.MENU_SWITCH);
	}

	if(MENU==BATTLE_MENU.FIGHT_ANIM){
		if(instance_exists(battle_menu_fight)){
			with(battle_menu_fight){
				event_user(BATTLE_MENU_FIGHT_EVENT.ANIM);
			}
		}
	}

	if(MENU==BATTLE_MENU.FIGHT_DAMAGE){
		if(instance_exists(battle_menu_fight)){
			with(battle_menu_fight){
				event_user(BATTLE_MENU_FIGHT_EVENT.DAMAGE);
			}
		}
	}

	return true;


}
