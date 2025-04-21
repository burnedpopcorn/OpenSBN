if (player == 1)
{
    if (got && obj_player1.state != states.gottreasure)
        instance_destroy();
}

if (player == 2)
{
    if (got && obj_player2.state != states.gottreasure)
        instance_destroy();
}

if (player == 0)
    y = Wave(ystart - 5, ystart + 5, 2, 2);

if (player == 0 && place_meeting(x, y, obj_player1))
{
    var num = instance_place_list(x, y, obj_player1, global.instancelist, false);
    
    for (var i = 0; i < num; i++)
    {
        var _player = ds_list_find_value(global.instancelist, i);
        
        with (_player)
        {
            if (state != states.gotoplayer)
            {
                treasure_x = x;
                treasure_y = y;
                treasure_room = room;
                global.combotime = 60;
                ds_list_add(global.saveroom, other.id);
                global.treasure = 1;
                hsp = 0;
                vsp = 0;
                
                if (!other.got)
                {
                    other.alarm[0] = 150;
                    state = states.gottreasure;
                    global.collect += 3000;
                    
                    with (instance_create(other.x + 16, other.y, obj_smallnumber))
                        number = string(3000);
                    
                    event_play_oneshot("event:/SFX/misc/foundtreasure");
                }
                
                other.got = 1;
                other.x = x + (51 * xscale);
                other.y = y - 70;
                other.effectid = instance_create(other.x, other.y, obj_treasureeffect);
                other.vsp = 0;
                obj_tv.showtext = 1;
                scr_queueToolTipPrompt("You Bo unlock teh treasure!");
                obj_tv.alarm[0] = 200;
                other.player = (object_index == obj_player1) ? 1 : 2;
            }
        }
    }
    
    ds_list_clear(global.instancelist);
}
