if (room == rm_blank)
    exit;

if (ds_list_find_index(global.baddieroom, id) == -1 && (!elite || elitehit <= 0))
{
    if (!global.prank_enemykilled)
    {
        global.prank_enemykilled = 1;
        trace("P Rank started!");
    }
    
    if (variable_instance_exists(self, "marinated"))
    {
        global.marinatecount++;
        trace("Marinate Count: ", global.marinatecount);
        mail_trigger(UnknownEnum.Value_5);
    }
    
    instance_create(x, y, obj_slapstar);
    instance_create(x, y, obj_slapstar);
    instance_create(x, y, obj_slapstar);
    instance_create(x, y, obj_baddiegibs);
    instance_create(x, y, obj_baddiegibs);
    instance_create(x, y, obj_baddiegibs);
    
    if (object_index != obj_peppinoclone && object_index != obj_twoliterdog && object_index != obj_clamchor && object_index != obj_bobby)
    {
        with (instance_create(x, y, obj_baddieDead))
        {
            sprite_index = other.spr_dead;
            spr_palette = other.spr_palette;
            paletteselect = other.paletteselect;
            usepalette = other.usepalette;
        }
    }
    else if (object_index == obj_peppinoclone)
    {
        with (instance_create(x, y, obj_explosioneffect))
        {
            image_speed = 0.35;
            depth = other.depth;
            sprite_index = spr_pepclone_death;
            image_xscale = other.image_xscale;
        }
    }
    else if (object_index == obj_clamchor)
    {
        var i = 0;
        
        repeat (sprite_get_number(spr_clam_debris))
        {
            with (create_debris(x, y, spr_clam_debris))
            {
                image_index = i;
                vsp = -irandom_range(10, 14);
            }
            
            i++;
        }
    }
    else if (object_index == obj_twoliterdog)
    {
        with (instance_create(x, y, obj_twoliterball, 
        {
            explodeInstant: explodeInstant,
            image_xscale: -image_xscale
        }))
        {
            if (other.thrown)
            {
                movespeed = 20;
                var _destructibleArr = [obj_destructibles, obj_ratblock, obj_metalblock];
                var _hsp = sign(movespeed * image_xscale);
                
                for (var i = 0; i < array_length(_destructibleArr); i++)
                {
                    var _ob = _destructibleArr[i];
                    
                    with (instance_place(x + _hsp, y, _ob))
                    {
                        instance_destroy();
                        other.explodeInstant = false;
                        other.collide_buffer = 8;
                    }
                }
            }
            
            if (explodeInstant)
                instance_destroy();
        }
    }
    else if (object_index == obj_bobby)
    {
        instance_create(x, y, obj_bobbycorpse, 
        {
            sprite_index: spr_bobby_corpsefresh,
            image_xscale: image_xscale,
            image_yscale: image_yscale
        });
    }
    
    if (object_index == obj_tank)
    {
        repeat (3)
        {
            with (instance_create(x, y, obj_baddieDead))
                sprite_index = other.spr_content_dead;
        }
    }
}

if (ds_list_find_index(global.baddieroom, id) == -1 && important == 0)
{
    trace(string("Destroying important enemy, elite: {0}, elitehit: {1}", elite, elitehit));
    
    if (!elite || elitehit <= 0)
    {
        with (obj_player1)
            supercharge += 1;
    }
    
    if (!elite || elitehit <= 0)
    {
        var combototal = 10 + floor(global.combo * 0.5);
        trace(string("Adding comboscore: {0}", combototal));
        global.collect += combototal;
        global.comboscore += combototal;
        global.combo += 1;
        global.combotime = 60;
    }
    
    if (object_index == obj_bobby)
        event_play_oneshot("event:/SFX/misc/bellcollectbig", x, y);
    else
        event_play_oneshot("event:/SFX/enemies/kill", x, y);
    
    repeat (3)
    {
        with (create_debris(x, y, spr_slapstar))
        {
            hsp = random_range(-5, 5);
            vsp = random_range(-10, 10);
        }
    }
    
    instance_create(x, y, obj_bangeffect);
    
    with (obj_camera)
    {
        shake_mag = 3;
        shake_mag_acc = 3 / room_speed;
    }
    
    ds_list_add(global.baddieroom, id);
    
    if (escape && object_index != obj_bobby)
        ds_list_add(global.escaperoom, id);
}
else if (ds_list_find_index(global.baddieroom, id) == -1 && important == 1)
{
    trace("destroy unimportant");
    event_play_oneshot("event:/SFX/enemies/kill", x, y);
    
    with (obj_camera)
    {
        shake_mag = 3;
        shake_mag_acc = 3 / room_speed;
    }
    
    ds_list_add(global.baddieroom, id);
}
