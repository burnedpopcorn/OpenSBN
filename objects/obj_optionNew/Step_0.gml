var m = menuarr[menu];
var bgArr = 
[
	[MENUS.mainmenu], 
	[MENUS.audio], 
	[MENUS.video], 
	[MENUS.game], 
	[
		MENUS.controls, 
		MENUS.keyboard, 
		MENUS.gamepad, 
		MENUS.deadzones
	], 
	[MENUS.secret]
];

for (var i = 0; i < array_length(bgArr); i++)
{
    var target = 1;
    
    if (!array_contains(bgArr[i], menu))
        target = 0;
    
    for (var j = 0; j < array_length(bgArr[i]); j++)
    {
        var mn = menuarr[bgArr[i][j]];
        mn.alpha = approach(mn.alpha, target, (target == 1) ? 0.1 : 0.05);
    }
}

bg_x--;
bg_y--;
var move = input_check_pressed("down") - input_check_pressed("up");
var move2 = input_check_pressed("right") - input_check_pressed("left");
var key_confirm = input_check_pressed("jump");
var key_back = input_check_pressed("slap") || keyboard_check_pressed(vk_escape);

if (backbuffer > 0)
{
    backbuffer--;
    key_back = false;
    key_confirm = false;
}

if (move != 0)
    slidebuffer = 0;

moveslide = input_check("right") - input_check("left");
var sel = selected;
selected += move;
selected = clamp(selected, 0, array_length(m.options) - 1);
var option = m.options[selected];

if (sel != selected)
{
    event_play_oneshot("event:/SFX/ui/pauseselect");
    
    if (option.type == menutype.slider)
        slidevalue = option.value;
    
    if (m.options[sel].type == menutype.slider)
        m.options[sel].silence();
}

switch (option.type)
{
    case menutype.press:
    case menutype.redirect:
        if (key_confirm)
        {
            option.onPress();
            event_play_oneshot("event:/SFX/ui/optionselect");
        }
        
        break;
    
    case menutype.toggle:
        if (key_confirm || move2 != 0)
        {
            option.onPress();
            event_play_oneshot("event:/SFX/ui/optionselect");
        }
        
        break;
    
    case menutype.multiple:
        if (move2 != 0)
        {
            option.onPress(move2);
            event_play_oneshot("event:/SFX/ui/optionselect");
        }
        
        break;
    
    case menutype.slider:
        if (moveslide != 0 && slidebuffer <= 0 && (option.value + moveslide) != 101 && (option.value + moveslide) != -1)
        {
            slidebuffer = 1;
            option.onChange(moveslide);
            
            if (menu == MENUS.audio)
                set_option_params();
        }
        else if (moveslide == 0 && slidevalue != option.value)
        {
            option.doSet();
            slidevalue = option.value;
        }
        else
        {
            option.moving = false;
            option.silence();
        }
        
        break;
}

if (slidebuffer > 0)
    slidebuffer--;

if (key_back && !instance_exists(obj_option_keyconfig))
{
    event_play_oneshot("event:/SFX/ui/back");
    
    if (menu == MENUS.mainmenu)
    {
        if (room == rm_mainmenu)
        {
            with (obj_pauseNew)
                state = pausestates.unpause;
        }
        
        instance_destroy();
    }
    else
    {
        for (var i = 0; i < array_length(m.options); i++)
        {
            var b = m.options[i];
            
            if (b.type == menutype.slider)
                b.silence();
        }
        
        m.options[0].onPress();
    }
}

if (keyboard_string != "")
{
    keystring += string_lower(keyboard_string);
    keyboard_string = "";
}

if (string_ends_with(keystring, "awesome"))
{
    event_play_oneshot("event:/SFX/special/magicharp");
    menuprev = menu;
    menu = MENUS.secret;
    selected = 0;
    keystring = "";
}
