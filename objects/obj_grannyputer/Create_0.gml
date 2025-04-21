levelarray = array_create(0);
show = false;
text_xscale = (camera_get_view_width(view_camera[0]) - 64) / sprite_get_width(spr_grannyputerbubble);
text_yscale = 2;
text_y = -(sprite_get_height(spr_grannyputerbubble) * text_yscale) + 8;
text_sprite_height = sprite_get_height(spr_grannyputerbubble);
text_xpad = 0;
text_state = states.titlescreen;
text_ystart = 16;
text_vsp = 0;
text_wave_x = 0;
text_wave_y = 0;
tex_x = 0;
surfclip = -4;
surffinal = -4;
depth = 0;
wave_timer = 0;
level_xpad = 16;

addlevel = function(argument0, argument1, argument2 = true, argument3 = true, argument4 = true, argument5 = true)
{
    var q = 
    {
        level: argument0,
        icon: argument1,
        secrets: argument2,
        secretcount: 0,
        toppins: argument3,
        toppinarr: [0, 0, 0, 0, 0],
        toppinsecret: false,
        treasure: argument4,
        gottreasure: false,
        rank: argument5,
        gotrank: -4
    };
    ini_open_from_string(obj_savesystem.ini_str);
    
    if (q.secrets)
        q.secretcount = ini_read_real("Secret", argument0, 0);
    
    if (q.toppins)
    {
        for (var i = 0; i < array_length(q.toppinarr); i++)
            q.toppinarr[i] = ini_read_real("Toppin", concat(argument0, i + 1), 0);
        
        q.toppinsecret = ini_read_real("Toppin", concat(argument0, "S"), 0);
    }
    
    if (q.treasure)
        q.gottreasure = ini_read_real("Treasure", argument0, 0);
    
    if (q.rank)
        q.gotrank = ini_read_string("Ranks", argument0, "none");
    
    ini_close();
    array_push(levelarray, q);
    trace(q);
    return q;
};
