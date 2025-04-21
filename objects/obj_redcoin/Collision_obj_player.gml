if (room == rm_blank)
    exit;

if (other.state != states.gotoplayer)
{
    fmod_event_setParameter(redsnd, "state2", global.redcoins, true);
    event_quick3D(redsnd, other.x, other.y);
    
    if (obj_player1.character == "V")
        global.playerhealth = clamp(global.playerhealth + 1, 0, 100);
    
    global.heattime += 10;
    global.heattime = clamp(global.heattime, 0, 60);
    global.combotime += 10;
    global.combotime = clamp(global.combotime, 0, 60);
    
    with (obj_camera)
        healthshaketime = 30;
    
    var val = heat_calculate(10);
    
    if (other.object_index == obj_player1)
        global.collect += val;
    else
        global.collectN += val;
    
    create_collect(x, y, sprite_index, val);
    
    with (instance_create(x + 16, y, obj_smallnumber))
    {
        color = c_red;
        number = string(global.redcoins + 1);
    }
    
    var last = true;
    
    with (obj_redcoin)
    {
        if (id != other.id)
            last = false;
    }
    
    if (last)
    {
        global.redcoin = 0;
        fmod_event_setParameter(redsnd, "state", 1, true);
        
        with (instance_create(x, y, obj_objspawner))
        {
            content_arr = [obj_bigcollect, obj_bigcollect, obj_bigcollect];
            
            func = function()
            {
                x = obj_player1.x;
                y = obj_player1.y;
            };
        }
    }
    
    fmod_event_play(redsnd);
    global.redcoins++;
    global.redcoincount++;
    mail_trigger(UnknownEnum.Value_12);
    instance_destroy();
}
