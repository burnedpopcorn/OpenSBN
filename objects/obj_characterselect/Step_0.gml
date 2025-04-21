image_speed = 0.35;

if ((input_check_pressed("right") || -obj_player2.input_check_pressed("left")) && selected == 0 && ready == 0)
    selected += 1;

if ((-input_check_pressed("left") || obj_player2.input_check_pressed("right")) && selected == 1 && ready == 0)
    selected -= 1;

if (input_check_pressed("jump") && selected == 0 && obj_peppinoselect.sprite_index != spr_peppinoselected)
{
    ready = 1;
    obj_peppinoselect.sprite_index = spr_peppinoselected;
    obj_peppinoselect.image_index = 0;
    
    with (obj_player1)
    {
        character = "P";
        ispeppino = 1;
        scr_characterspr();
    }
    
    with (obj_player2)
    {
        character = "P";
        ispeppino = 0;
        scr_characterspr();
        
        if (global.coop == true)
        {
            obj_noiseselect.sprite_index = spr_noiseselected;
            obj_noiseselect.image_index = 0;
        }
    }
    
    alarm[0] = 100;
}

if (input_check_pressed("jump") && selected == 1 && obj_noiseselect.sprite_index != spr_noiseselected)
{
    ready = 1;
    obj_noiseselect.sprite_index = spr_noiseselected;
    obj_noiseselect.image_index = 0;
    
    with (obj_player1)
    {
        character = "P";
        ispeppino = 0;
        scr_characterspr();
    }
    
    with (obj_player2)
    {
        character = "P";
        ispeppino = 1;
        scr_characterspr();
        
        if (global.coop == true)
        {
            obj_peppinoselect.sprite_index = spr_peppinoselected;
            obj_peppinoselect.image_index = 0;
        }
    }
    
    alarm[0] = 100;
}
