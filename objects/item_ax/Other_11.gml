//Dialog_Add("* TML&{sleep 20}* The creator of UTE.&{sleep 20}* Can make your HP max out.");
if(IsEng()){
	Dialog_Add("* AX233{sleep 15}&* Can recover 78 HP.")
}else if(IsChs()){
	Dialog_Add("* AX暗星233{sleep 15}&* 可以恢复78点HP。")
}
Dialog_Start();
event_inherited();