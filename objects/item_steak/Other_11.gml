if(IsEng()){
	Dialog_Add("* if you see this, that meant &  you are a dirty hacker&  or some bug appeared.")
}else if(IsChs()){
	Dialog_Add("* 如果你看到这个, &  说明你是个肮脏的黑客, &  或者说是出bug了。")
}
Dialog_Start();
instance_destroy();