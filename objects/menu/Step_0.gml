if(_menu==0){
	if(_mode==0){
		if(Input_IsPressed(INPUT.DOWN)){
			if(_choice=0){
				_choice=1;
				event_user(2);
			}else if(_choice=1){
				_choice=2
				event_user(2);
			}
		}else if(Input_IsPressed(INPUT.UP)){
			if(_choice=2){
				_choice=1
				event_user(2);
			}else if(_choice=1){
				_choice=0
				event_user(2);
			}
		}else if(Input_IsPressed(INPUT.CONFIRM)){
			if(_choice==0){
				_menu=1;
				event_user(0);
			}else if(_choice==1){
				room_goto(room_settings)
			}else if(_choice==2){
				room_goto(room_credits)
			}
		}
	}else{
		if(Input_IsPressed(INPUT.LEFT)){
			if(_choice==1){
				_choice=0;
				event_user(2);
			}else if(_choice==3){
				_choice=2;
				event_user(2);
			}else if(_choice==4){
				_choice=2;
				event_user(2);
			}
		}else if(Input_IsPressed(INPUT.RIGHT)){
			if(_choice==0){
				_choice=1;
				event_user(2);
			}else if(_choice==2){
				_choice=3;
				event_user(2);
			}else if(_choice==4){
				_choice=3;
				event_user(2);
			}
		}else if(Input_IsPressed(INPUT.DOWN)){
			if(_choice==0){
				_choice=2;
				event_user(2);
			}else if(_choice==1){
				_choice=3;
				event_user(2);
			}else if(_choice==2||_choice=3){
				_choice=4
				event_user(2);
				}
		}else if(Input_IsPressed(INPUT.UP)){
			if(_choice==2){
				_choice=0;
				event_user(2);
			}else if(_choice==3){
				_choice=1;
				event_user(2);
			}else if(_choice==4){
				_choice=2;
				event_user(2);
			}
		}else if(Input_IsPressed(INPUT.CONFIRM)){
			if(_choice==0&&file_exists(Flag_GetSavePath(FLAG_TYPE.INFO))){
				Player_Load(Flag_GetSaveSlot());
				audio_stop_all()
				var target=Flag_Get(FLAG_TYPE.STATIC,FLAG_STATIC.ROOM,-1);
				room_goto(asset_get_index(target))
			}else if(_choice==1&&Flag_GetSaveSlot()>=0&&Flag_GetSaveSlot()<=9){
				_menu=1;
				_naming_name=Flag_Get(FLAG_TYPE.INFO,FLAG_INFO.NAME,"");
				//_confirm_title=Lang_GetString("menu.confirm.title.reset");
				event_user(0);
			}else if(_choice==2){
				room_goto(room_settings)
			}else if(_choice==3){
				room_goto(room_credits)
			}else if(_choice==4){
				room_goto(room_save_options)
			}
		}
	}
}else if(_menu==1){
	if(_choice_naming==0){
		if(Input_IsPressed(INPUT.RIGHT)){
			if(_choice_naming_letter<61){
				_choice_naming_letter+=1;
				event_user(3);
			}
		}else if(Input_IsPressed(INPUT.LEFT)){
			if(_choice_naming_letter>0){
				_choice_naming_letter-=1;
				event_user(3);
			}
		}else if(Input_IsPressed(INPUT.UP)){
			if(_choice_naming_letter>=0&&_choice_naming_letter<=1){
				_choice_naming=1;
				_choice_naming_command=0;
			}else if(_choice_naming_letter>=2&&_choice_naming_letter<=4){
				_choice_naming=1;
				_choice_naming_command=1;
			}else if(_choice_naming_letter>=5&&_choice_naming_letter<=6){
				_choice_naming=1;
				_choice_naming_command=2;
			}else if(_choice_naming_letter>=26&&_choice_naming_letter<=30){
				_choice_naming_letter-=5;
			}else if(_choice_naming_letter>=31&&_choice_naming_letter<=32){
				_choice_naming_letter-=12;
			}else if(_choice_naming_letter>=52&&_choice_naming_letter<=56){
				_choice_naming_letter-=5;
			}else if(_choice_naming_letter>=57&&_choice_naming_letter<=58){
				_choice_naming_letter-=12;
			}else{
				_choice_naming_letter-=7;
			}
			event_user(3);
		}else if(Input_IsPressed(INPUT.DOWN)){
			if(_choice_naming_letter>=21&&_choice_naming_letter<=25){
				_choice_naming_letter+=5;
			}else if(_choice_naming_letter>=19&&_choice_naming_letter<=20){
				_choice_naming_letter+=12;
			}else if(_choice_naming_letter>=45&&_choice_naming_letter<=46){
				_choice_naming_letter+=12;
			}else if(_choice_naming_letter>=47&&_choice_naming_letter<=51){
				_choice_naming_letter+=5;
			}else if(_choice_naming_letter>=59&&_choice_naming_letter<=60){
				_choice_naming=1;
				_choice_naming_command=0;
			}else if(_choice_naming_letter=61||_choice_naming_letter=55){
				_choice_naming=1;
				_choice_naming_command=1;
			}else if(_choice_naming_letter>=56&&_choice_naming_letter<=58){
				_choice_naming=1;
				_choice_naming_command=2;
			}else{
				_choice_naming_letter+=7;
			}
			event_user(3);
		}else if(Input_IsPressed(INPUT.CONFIRM)){
			if(string_length(_naming_name)<6){
				var inst=_inst_naming_letters._list_inst[|_choice_naming_letter];
				_naming_name+=inst.text;
			}
		}else if(Input_IsPressed(INPUT.CANCEL)){
			if(string_length(_naming_name)>0){
				_naming_name=string_delete(_naming_name,string_length(_naming_name),1);
			}
		}
	}else{
		if(Input_IsPressed(INPUT.RIGHT)){
			if(_choice_naming_command<2){
				_choice_naming_command+=1;
				event_user(3);
			}
		}else if(Input_IsPressed(INPUT.LEFT)){
			if(_choice_naming_command>0){
				_choice_naming_command-=1;
				event_user(3);
			}
		}else if(Input_IsPressed(INPUT.UP)){
			if(_choice_naming_command==0){
				_choice_naming=0;
				_choice_naming_letter=59;
			}else if(_choice_naming_command==1){
				_choice_naming=0;
				_choice_naming_letter=61;
			}else if(_choice_naming_command==2){
				_choice_naming=0;
				_choice_naming_letter=57;
			}
			event_user(3);
		}else if(Input_IsPressed(INPUT.DOWN)){
			if(_choice_naming_command==0){
				_choice_naming=0;
				_choice_naming_letter=0;
			}else if(_choice_naming_command==1){
				_choice_naming=0;
				_choice_naming_letter=2;
			}else if(_choice_naming_command==2){
				_choice_naming=0;
				_choice_naming_letter=5;
			}
			event_user(3);
		}else if(Input_IsPressed(INPUT.CONFIRM)){
			if(_choice_naming_command==0){
				_menu=0;
				event_user(0);
			}
			if(_choice_naming_command==1){
				if(string_length(_naming_name)>0){
					_naming_name=string_delete(_naming_name,string_length(_naming_name),1);
				}
			}
			if(_choice_naming_command==2){
					event_user(4);
					_menu=2;
					event_user(0);
			}
		}else if(Input_IsPressed(INPUT.CANCEL)){
			if(string_length(_naming_name)>0){
				_naming_name=string_delete(_naming_name,string_length(_naming_name),1);
			}
		}
	}
	//if(string_length(_naming_name)<6){
	//alarm[1]=1
	//alarm[2]=1
	//}
	//if(string_length(_naming_name)>0){
		//if(keyboard_check_pressed(vk_backspace)){
	//_naming_name=string_delete(_naming_name,string_length(_naming_name),1)}
	//}
	//if(keyboard_check_pressed(vk_enter)){
		//event_user(4)
		//_menu=2;
		//event_user(0)
	//}
	//if(keyboard_check_pressed(vk_escape)){
		//_menu=0;
		//event_user(0)
	//}
	//if(string_length(_naming_name)>6){
	//_naming_name=string_delete(_naming_name,string_length(_naming_name),1)
	//}
	}else if(_menu==2){
	if(Input_IsPressed(INPUT.LEFT)){
		if(_choice_confirm>0){
			_choice_confirm=0;
			event_user(5);
		}
	}else if(Input_IsPressed(INPUT.RIGHT)){
		if(_choice_confirm<1&&_confirm_valid){
			_choice_confirm=1;
			event_user(5);
		}
	}else if(Input_IsPressed(INPUT.CONFIRM)){
		if(_choice_confirm==0){
			_menu=(_mode==0 ? 1 : 0);
			event_user(0);
		}else{
			_menu=3;
			event_user(0);
		}
	}
}

if(_menu==2||_menu==3){
	if(_confirm_name_update){
		_confirm_name_offset_x=random_range(-1,1);
		_confirm_name_offset_y=random_range(-1,1);
		_confirm_name_angle=random_range(-1,1);
	}
	_confirm_name_update=!_confirm_name_update;
}

if(string_lower(_naming_name)="gaster"){
game_restart()}

if(IsEng()){
window_set_caption(GAME_NAME+" - Menu")
}else if(IsChs()){
window_set_caption(GAME_NAME+" - 菜单")
}