if (image_alpha == 1)
{
    if (obj_player1.character == "V")
        global.playerhealth = clamp(global.playerhealth + 10, 0, 100);
    
    global.heattime = 60;
    
    with (obj_camera)
        healthshaketime = 60;
    
    instance_destroy();
    global.combotime = 60;
    var val = heat_calculate(100);
    
    if (other.object_index == obj_player1)
        global.collect += val;
    else
        global.collectN += val;
    
    create_collect(x, y, sprite_index, val);
    
    with (instance_create(x + 16, y, obj_smallnumber))
        number = string(val);
    
    tv_do_expression(spr_tv_exprcollect);
}
