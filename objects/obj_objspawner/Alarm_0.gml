if (array_length(content_arr) <= 0)
{
    instance_destroy();
    exit;
}

var a = array_pop(content_arr);

switch (a)
{
    case obj_collect:
        event_play_oneshot("event:/SFX/misc/collect", x, y);
        global.combotime += 10;
        global.combotime = clamp(global.combotime, 0, 60);
        var val = heat_calculate(10);
        global.collect += val;
        create_collect(x, y, choose(spr_shroomcollect, spr_tomatocollect, spr_cheesecollect, spr_sausagecollect, spr_pineapplecollect));
        
        with (instance_create(x + 16, y, obj_smallnumber))
            number = string(val);
        
        break;
    
    case obj_bigcollect:
        global.heattime = 60;
        event_play_oneshot("event:/SFX/misc/collectpizza", x, y);
        global.combotime = 60;
        var val = heat_calculate(100);
        global.collect += val;
        create_collect(x, y, choose(spr_pizzacollect1halloween, spr_pizzacollect2halloween, spr_pizzacollect3halloween, spr_pizzacollect4halloween, spr_pizzacollect5halloween), val);
        
        with (instance_create(x + 16, y, obj_smallnumber))
            number = string(val);
        
        if (array_length(content_arr) <= 0)
            tv_do_expression(spr_tv_exprcollect);
        
        break;
}

alarm[0] = count;
