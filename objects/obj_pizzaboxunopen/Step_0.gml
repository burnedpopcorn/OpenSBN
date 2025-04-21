var roomname = string_letters(room_get_name(room));

if (place_meeting(x, y, obj_player1) && sprite_index == spr_pizzaboxunopen)
{
    global.combotime = 60;
    ds_list_add(global.saveroom, id);
    event_play_oneshot("event:/SFX/misc/collecttoppin");
    
    repeat (10)
    {
        with (instance_create_depth(x, y, -1, obj_debris))
        {
            sprite_index = spr_toppincagedebris;
            image_index = irandom_range(0, 3);
            vsp = random_range(-3, -7);
        }
    }
    
    if (content == obj_pizzakinshroom)
    {
        with (instance_create(x, y, obj_smallnumber))
            number = "1000";
        
        if (place_meeting(x, y, obj_player1))
            global.collect += 1000;
        else
            global.collectN += 1000;
        
        instance_create(x, y, obj_taunteffect);
        
        with (instance_create(x, y - 25, content))
        {
            if (roomname == "strongcold")
                sprite_index = spr_xmasshroomtoppin_intro;
            else
                sprite_index = spr_toppinshroom_intro;
        }
        
        if (global.toppintotal < 5)
            scr_queueToolTipPrompt(string("You are missing {0} Savouri!", 5 - global.toppintotal));
        
        if (global.toppintotal >= 5)
            scr_queueToolTipPrompt("You have found all Savouri!");
        
        obj_tv.showtext = 1;
        obj_tv.alarm[0] = 150;
        global.toppintotal += 1;
        global.shroomfollow = 1;
    }
    
    if (content == obj_pizzakincheese)
    {
        with (instance_create(x, y, obj_smallnumber))
            number = "1000";
        
        if (place_meeting(x, y, obj_player1))
            global.collect += 1000;
        else
            global.collectN += 1000;
        
        with (instance_create(x, y - 25, content))
        {
            if (roomname == "strongcold")
                sprite_index = spr_xmascheesetoppin_intro;
            else
                sprite_index = spr_toppincheese_intro;
        }
        
        instance_create(x, y, obj_taunteffect);
        
        if (global.toppintotal < 5)
            scr_queueToolTipPrompt(string("You are missing {0} Savouri!", 5 - global.toppintotal));
        
        if (global.toppintotal >= 5)
            scr_queueToolTipPrompt("You have found all Savouri!");
        
        obj_tv.showtext = 1;
        obj_tv.alarm[0] = 150;
        global.toppintotal += 1;
        global.cheesefollow = 1;
    }
    
    if (content == obj_pizzakintomato)
    {
        with (instance_create(x, y, obj_smallnumber))
            number = "1000";
        
        if (place_meeting(x, y, obj_player1))
            global.collect += 1000;
        else
            global.collectN += 1000;
        
        with (instance_create(x, y - 25, content))
        {
            if (roomname == "strongcold")
                sprite_index = spr_xmastomatotoppin_intro;
            else
                sprite_index = spr_toppintomato_intro;
        }
        
        instance_create(x, y, obj_taunteffect);
        
        if (global.toppintotal < 5)
            scr_queueToolTipPrompt(string("You are missing {0} Savouri!", 5 - global.toppintotal));
        
        if (global.toppintotal >= 5)
            scr_queueToolTipPrompt("You have found all Savouri!");
        
        obj_tv.showtext = 1;
        obj_tv.alarm[0] = 150;
        global.toppintotal += 1;
        global.tomatofollow = 1;
    }
    
    if (content == obj_pizzakinsausage)
    {
        with (instance_create(x, y, obj_smallnumber))
            number = "1000";
        
        if (place_meeting(x, y, obj_player1))
            global.collect += 1000;
        else
            global.collectN += 1000;
        
        with (instance_create(x, y - 25, content))
        {
            if (roomname == "strongcold")
                sprite_index = spr_xmassausagetoppin_intro;
            else
                sprite_index = spr_toppinsausage_intro;
        }
        
        instance_create(x, y, obj_taunteffect);
        
        if (global.toppintotal < 5)
            scr_queueToolTipPrompt(string("You are missing {0} Savouri!", 5 - global.toppintotal));
        
        if (global.toppintotal >= 5)
            scr_queueToolTipPrompt("You have found all Savouri!");
        
        obj_tv.showtext = 1;
        obj_tv.alarm[0] = 150;
        global.toppintotal += 1;
        global.sausagefollow = 1;
    }
    
    if (content == obj_pizzakinpineapple)
    {
        with (instance_create(x, y, obj_smallnumber))
            number = "1000";
        
        if (place_meeting(x, y, obj_player1))
            global.collect += 1000;
        else
            global.collectN += 1000;
        
        with (instance_create(x, y - 25, content))
        {
            if (roomname == "strongcold")
                sprite_index = spr_xmaspineappletoppin_intro;
            else
                sprite_index = spr_toppinpineapple_intro;
        }
        
        instance_create(x, y, obj_taunteffect);
        global.heattime = 60;
        global.style += 10;
        ds_list_add(global.saveroom, id);
        
        if (global.toppintotal < 5)
            scr_queueToolTipPrompt(string("You are missing {0} Savouri!", 5 - global.toppintotal));
        
        if (global.toppintotal >= 5)
            scr_queueToolTipPrompt("You have found all Savouri!");
        
        obj_tv.showtext = 1;
        obj_tv.alarm[0] = 150;
        global.toppintotal += 1;
        global.pineapplefollow = 1;
    }
    
    if (content == obj_pizzakinsecret)
    {
        with (instance_create(x, y, obj_smallnumber))
            number = "500";
        
        if (place_meeting(x, y, obj_player1))
            global.collect += 500;
        else
            global.collectN += 500;
        
        var isWater = string_letters(room_get_name(room)) == "water";
        var introspr = spr_toppin_animation_but_awesome_taunt;
        
        if (isWater)
            introspr = spr_toppin_fruisetta_taunt;
        
        scr_queueToolTipPrompt("You found a super secret Savouri!", -4);
        
        with (instance_create(x, y - 25, content))
        {
            sprite_index = introspr;
            area = isWater;
            event_user(0);
        }
        
        instance_create(x, y, obj_taunteffect);
        global.heattime = 60;
        global.style += 10;
        ds_list_add(global.saveroom, id);
        global.secretfollow = 1;
    }
    
    instance_destroy();
}

if (floor(image_index) == 20 && !event_isplaying(helpsnd) && content != obj_pizzakinsecret)
    fmod_event_play(helpsnd);
