np_update();
var cs = 0;

with (obj_comboend)
    cs += comboscore;

with (obj_particlesystem)
{
    for (var i = 0; i < ds_list_size(global.collect_list); i++)
        cs += ds_list_find_value(global.collect_list, i).value;
}

var sc = global.collect - global.comboscore - cs;
var str = concat("Score: ", sc);

if (global.combo > 0)
    str = concat(str, " | ", global.combo, " Com-Bo!");

state = str;
var ranks = ["f_rank", "r_rank", "o_rank", "a_rank", "t_rank", "u_rank"];
var rnk = 0;

if (global.collect >= global.srank && scr_is_p_rank())
    rnk = 5;
else if (global.collect >= global.srank)
    rnk = 4;
else if (global.collect >= global.arank)
    rnk = 3;
else if (global.collect >= global.brank)
    rnk = 2;
else if (global.collect >= global.crank)
    rnk = 1;

smallimage = ranks[rnk];
details = global.gameframe_caption_text ?? "";
