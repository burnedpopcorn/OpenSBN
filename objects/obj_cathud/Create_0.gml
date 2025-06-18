with (obj_cathud)
{
    if (id != other.id)
        instance_destroy();
}

depth = -5000;
snd_blink = "event:/SFX/special/blink";
snd_blunk = "event:/SFX/special/blunk";
snd_meow = "event:/SFX/special/meow";
purrsnd = [];
maxcats = 5;

for (var i = 0; i < maxcats; i++)
    purrsnd[i] = fmod_createEventInstance("event:/SFX/special/purr");

edgecount = sprite_get_number(spr_cathud_edges) / 2;
show = true;
cats = [];

cat = function(argument0, argument1, argument2, argument3, argument4, argument5 = UnknownEnum.Value_0, argument6 = UnknownEnum.Value_0) constructor
{
    x = argument3;
    y = argument4;
    catSprite = argument1;
    catID = argument2;
    index = 0;
    beenPet = false;
    catNo = argument0;
    position = argument5;
    type = argument6;
    rot = 0;
    blinkTimer = irandom_range(100, 1200);
    blinking = false;
    purrBuffer = irandom_range(500, 2400);
    purring = false;
    meowBuffer = irandom_range(300, 1600);
    meowing = false;
    xscale = 1;
    yscale = 1;
    
    step = function()
    {
        blink();
        purr();
        meow();
        
        if (!beenPet)
            pet();
    };
    
    blink = function()
    {
        var xrotadj = camera_get_view_x(view_camera[0]);
        var yrotadj = camera_get_view_y(view_camera[0]);
        
        if (rot == 0 || rot == 180)
            yrotadj += ((rot == 0) ? -100 : 100);
        else
            xrotadj += ((rot == 90) ? -100 : 100);
        
        if (blinkTimer > 0)
            blinkTimer--;
        
        if (blinkTimer <= 0)
        {
            if (!blinking)
            {
                event_play_oneshot(obj_cathud.snd_blink, xrotadj + x, yrotadj + y);
                index = 1;
                blinking = true;
                blinkTimer = irandom_range(30, 90);
            }
            else
            {
                event_play_oneshot(obj_cathud.snd_blunk, xrotadj + x, yrotadj + y);
                index = 0;
                blinking = false;
                blinkTimer = irandom_range(600, 1200);
            }
        }
    };
    
    pet = function()
    {
        var mx = mouse_x - camera_get_view_x(view_camera[0]);
        var my = mouse_y - camera_get_view_y(view_camera[0]);
        
        if (point_in_rectangle(mx, my, x - 100, y - 200, x + 100, y))
        {
            purrBuffer = 0;
            beenPet = true;
            mail_trigger(mailtriggers.petcat);
        }
    };
    
    purr = function()
    {
        if (meowing)
        {
            purrBuffer = irandom_range(1200, 2400);
            exit;
        }
        
        var xrotadj = camera_get_view_x(view_camera[0]);
        var yrotadj = camera_get_view_y(view_camera[0]);
        
        if (rot == 0 || rot == 180)
            yrotadj += ((rot == 0) ? -100 : 100);
        else
            xrotadj += ((rot == 90) ? -100 : 100);
        
        if (purrBuffer > 0)
            purrBuffer--;
        
        if (!purring && purrBuffer <= 0)
        {
            purring = true;
            purrBuffer = irandom_range(600, 900);
        }
        else if (purring && purrBuffer <= 0)
        {
            purring = false;
            xscale = 1;
            yscale = 1;
            purrBuffer = irandom_range(1200, 2400);
        }
        
        var ev = obj_cathud.purrsnd[catNo];
        
        if (purring)
        {
            if (!event_isplaying(ev))
            {
                fmod_event_play(ev);
            }
            else
            {
                yscale = 1 + (0.1 * sin(current_time / 200));
                xscale = 1 - (0.2 * sin(current_time / 200));
            }
            
            event_quick3D(ev, x + xrotadj, y + yrotadj);
        }
        else if (event_isplaying(ev))
        {
            fmod_event_stop(ev, true);
        }
    };
    
    meow = function()
    {
        if (purring)
        {
            meowBuffer = irandom_range(600, 1600);
            exit;
        }
        
        var xrotadj = camera_get_view_x(view_camera[0]);
        var yrotadj = camera_get_view_y(view_camera[0]);
        
        if (rot == 0 || rot == 180)
            yrotadj += ((rot == 0) ? -100 : 100);
        else
            xrotadj += ((rot == 90) ? -100 : 100);
        
        if (meowBuffer > 0)
            meowBuffer--;
        
        if (!meowing && meowBuffer <= 0)
        {
            meowing = true;
            meowBuffer = 100;
            event_play_oneshot(obj_cathud.snd_meow, x + xrotadj, y + yrotadj);
        }
        
        if (meowing)
        {
            yscale = 1 + (0.1 * sin(current_time / 2000));
            xscale = 1 - (0.2 * sin(current_time / 2000));
            
            if (meowBuffer <= 0)
            {
                meowing = false;
                meowBuffer = irandom_range(600, 1600);
                xscale = 1;
                yscale = 1;
            }
        }
    };
    
    draw = function(argument0)
    {
        var correctedind = index + (2 * catID);
        draw_sprite_ext(catSprite, correctedind, x, y, xscale, yscale, rot, c_white, argument0);
    };
};

event_perform(ev_other, ev_room_start);
