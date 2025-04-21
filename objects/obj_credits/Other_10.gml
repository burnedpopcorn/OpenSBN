function eatThrows(argument0)
{
    var i = array_length(obj_credits.thrownArr) - 1;
    
    while (i > -1)
    {
        var food = obj_credits.thrownArr[i];
        
        if (food.splat || food.image_xscale > 1.5)
        {
        }
        else
        {
            var xx = xstart - sprite_get_xoffset(sprite_index);
            var yy = ystart - sprite_get_yoffset(sprite_index);
            
            for (var m = 0; m < array_length(argument0); m++)
            {
                var mouth_x = argument0[m][0];
                var mouth_y = argument0[m][1];
                var mouth_size = argument0[m][2];
                
                if (point_distance(xx + mouth_x, yy + mouth_y, food.xstart, food.ystart) < (mouth_size + 16))
                {
                    food.splat = true;
                    food.image_alpha = 0;
                    event_play_oneshot("event:/SFX/special/eat", mouth_x, mouth_y);
                }
            }
        }
        
        i--;
    }
}

addCredit(-1, spr_title_center, function()
{
    if (obj_credits.credTime <= -0.994)
    {
        image_xscale = 10;
        image_yscale = 10;
        image_angle = 360;
        image_blend = c_black;
        x = chance(50) ? -100 : (obj_gameFrame.defaultwidth + 100);
        y = chance(50) ? -100 : (obj_gameFrame.defaultheight + 100);
    }
    else
    {
        var spd = 45;
        
        if (obj_credits.hurryUp)
            spd /= 4;
        
        image_xscale = approach(image_xscale, 1, 10 / spd);
        image_yscale = approach(image_yscale, 1, 10 / spd);
        image_angle = approach(image_angle, 0, 360 / spd);
        x = approach(x, xstart, (xstart + 100) / spd);
        y = approach(y, ystart, (ystart + 100) / spd);
        
        if (image_xscale < 5)
        {
            var v = color_get_value(image_blend);
            v = approach(v, 255, 255 / spd);
            image_blend = make_color_hsv(0, 0, floor(v));
        }
    }
});
addCredit(0, spr_credits_DESERTTEAM);
addCredit(1, spr_credits_Lilac, eatThrows).arg_arr = [[147, 228, 40], [262, 156, 40], [41, 253, 25]];
addCredit(2, spr_credits_AwfulNasty, eatThrows).arg_arr = [[122, 179, 20]];
addCredit(3, spr_credits_mrunown);
addCredit(4, spr_credits_unim_yakkoballs, eatThrows).arg_arr = [[163, 253, 5]];
addCredit(5, spr_credits_Vi, eatThrows).arg_arr = [[92, 107, 20]];
addCredit(6, spr_credits_froskii, eatThrows).arg_arr = [[155, 249, 30], [171, 327, 15]];
addCredit(7, spr_credits_mongo);
addCredit(8, spr_credits_Mudkid, eatThrows).arg_arr = [[116, 225, 20]];
addCredit(9, spr_credits_drooly, eatThrows).arg_arr = [[205, 284, 80]];
addCredit(10, spr_credits_yabcab, eatThrows).arg_arr = [[98, 200, 30]];
addCredit(11, spr_credits_glub, eatThrows).arg_arr = [[158, 246, 30]];
addCredit(12, spr_credits_indigo, eatThrows).arg_arr = [[132, 267, 20], [245, 188, 10], [34, 180, 10], [47, 338, 10], [285, 374, 10]];
addCredit(13, spr_credits_madjinjo, eatThrows).arg_arr = [[129, 189, 30]];
addCredit(14, spr_credits_n64nicole, eatThrows).arg_arr = [[128, 321, 30]];
addCredit(15, spr_credits_osp, eatThrows).arg_arr = [[201, 180, 18]];
addCredit(16, spr_credits_joe_griddle_guy, eatThrows).arg_arr = [[171, 236, 50], [258, 156, 10], [280, 241, 10], [229, 382, 20]];
addCredit(17, spr_credits_Emmet, eatThrows).arg_arr = [[174, 252, 30]];
addCredit(18, spr_credits_dajumpjump, eatThrows).arg_arr = [[149, 251, 40]];
addCredit(19, spr_credits_bondorak, eatThrows).arg_arr = [[93, 195, 30]];
addCredit(20, spr_credits_eggy, eatThrows).arg_arr = [[102, 175, 20]];
addCredit(21, spr_credits_netley, eatThrows).arg_arr = [[140, 317, 20]];
addCredit(22, spr_credits_miaCDI, eatThrows).arg_arr = [[180, 303, 30], [41, 171, 15], [297, 376, 15]];
addCredit(23, spr_credits_ufra, eatThrows).arg_arr = [[142, 273, 30], [41, 171, 15], [297, 376, 15]];
addCredit(24, spr_credits_u4mhh);
addCredit(25, spr_credits_karinkarin);
addCredit(26, spr_credits_mickeyQTIP, eatThrows).arg_arr = [[158, 265, 20]];
addCredit(27, spr_credits_baph, eatThrows).arg_arr = [[150, 273, 30]];
addCredit(28, spr_credits_teegeedee, eatThrows).arg_arr = [[158, 265, 20]];
addCredit(29, spr_credits_additional_help);
addCredit(30, spr_credits_fmod, eatThrows).arg_arr = [[241, 76, 30], [206, 138, 10], [226, 138, 10]];
addCredit(31, spr_credits_PT, eatThrows).arg_arr = [[158, 92, 30], [234, 66, 10]];
addCredit(32, spr_title_center, function()
{
    if (image_alpha >= 0.2)
    {
        if (!obj_credits.completed)
            obj_credits.completed = true;
        
        with (obj_music)
            fmod_event_setParameter(music.music_inst, "state", 1, false);
        
        image_blend = make_color_hsv(abs(255 * sin(current_time / 2000)), 255, 255);
        image_alpha = 0.2 + abs(0.8 * sin(current_time / 1000));
        image_angle += 1;
        
        if (image_angle > 360)
            image_angle = 0;
    }
});
