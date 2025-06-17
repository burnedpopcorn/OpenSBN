enum menuselected
{
	bofallingcutscene = 0,
	selectsave = 1,
	deletesave = 2,
	loadsave = 3,
	endgame = 4,
}

saveFile = function(argument0) constructor
{
    index = argument0;
    ini_path = string("saveData{0}.ini", argument0);
    percentage = 0;
    cleared = 0;
    stickers = [];
    minutes = 0;
    seconds = 0;
    secrets = 0;
    bobbydead = 0;
    playonce = false;
    spr_hover = obj_mainmenu.idleArr[argument0];
    spr_choose = obj_mainmenu.chooseArr[argument0];
    image_alpha = 0;
    
    readValues = function()
    {
        ini_open(string("saves/{0}", ini_path));
        percentage = ini_read_real("Game", "percent", 0);
        minutes = ini_read_real("Game", "minutes", 0);
        seconds = ini_read_real("Game", "seconds", 0);
        secrets = ini_read_real("Game", "secrets", 0);
        bobbydead = ini_read_real("Game", "bobbyX", -100) != -100;
        allmail = ini_read_real("Game", "allmail", 0) > 0;
        cleared = ini_read_real("Game", "cleared", 0) > 0;
        ini_close();
        
        if (index == 1)
            playonce = true;
        
        if (!cleared)
            exit;
        
        if (!bobbydead)
        {
            var sticker_bobby = new obj_mainmenu.saveSticker(self, spr_saveSticker_bobby, 0, 0, 0);
            array_push(stickers, sticker_bobby);
        }
        
        if (allmail)
        {
            var sticker_mail = new obj_mainmenu.saveSticker(self, spr_saveSticker_mail, 0, 45, -210);
            array_push(stickers, sticker_mail);
        }
    };
    
    step = function()
    {
        if (obj_mainmenu.selected != index)
        {
            image_alpha = approach(image_alpha, 0, 0.1);
            exit;
        }
        
        image_alpha = approach(image_alpha, 1, 0.2);
        
        with (obj_mainmenu)
        {
            var acc = floor(abs(displayPer - other.percentage) / 10) + 1;
            displayPer = approach(displayPer, other.percentage, acc);
            
            if (state == menuselected.loadsave)
            {
                if (sprite_index != other.spr_choose)
                {
                    sprite_index = other.spr_choose;
                    image_index = 0;
                }
            }
            else if (sprite_index != other.spr_hover)
            {
                sprite_index = other.spr_hover;
                image_index = 0;
            }
            
            if (sprite_index == other.spr_hover && other.playonce && floor(image_index) == (image_number - 1))
                image_speed = 0;
            else
                image_speed = 0.35;
        }
    };
    
    draw = function()
    {
        if (cleared)
        {
            for (var s = 0; s < array_length(stickers); s++)
                stickers[s].draw(obj_gameFrame.defaultwidth - 256, obj_gameFrame.defaultheight - 64);
        }
    };
};

saveSticker = function(argument0, argument1, argument2, argument3, argument4) constructor
{
    sprite_index = argument1;
    image_index = argument2;
    x = argument3;
    y = argument4;
    parent = argument0;
    
    draw = function(argument0, argument1)
    {
        draw_sprite_ext(sprite_index, image_index, x + argument0, y + argument1, 1, 1, 0, c_white, parent.image_alpha);
    };
};

deleteSave = function(argument0)
{
    var path = saves[argument0].ini_path;
    saves[argument0] = new saveFile(argument0);
    file_delete(string("saves/{0}", path));
    saves[argument0].readValues();
};

image_speed = 0;
endFadeAlpha = 0;
loading = false;
introSoundBuffer = 0;
state = menuselected.bofallingcutscene;
selected = 0;
select2 = 0;
moveBuffer = 10;
deleteBuffer = 180;
deleteTime = 180;
introArr = [spr_mainmenu_intro0, spr_mainmenu_intro1];
idleArr = [spr_mainmenu_intro1, spr_mainmenu_look1, spr_mainmenu_look2, spr_mainmenu_look3];
chooseArr = [spr_mainmenu_intro0, spr_mainmenu_choose1, spr_mainmenu_choose2, spr_mainmenu_choose3];
saves = [new saveFile(0)];

for (var s = 1; s < 4; s++)
{
    var f = new saveFile(s);
    f.readValues();
    show_debug_message(string("READ SAVE FILE {0}", s));
    array_push(saves, f);
}

displayPer = 0;
altDisplayIndex = 0;
alarm[0] = 30;
