with (obj_comboend)
{
    for (var i = 0; i < comboscore; i += comboscore)
        create_collect(obj_player1.x + irandom_range(-60, 60), (obj_player1.y - 100) + irandom_range(-60, 60), choose(spr_shroomcollect, spr_tomatocollect, spr_cheesecollect, spr_sausagecollect, spr_pineapplecollect));
    
    comboscore = 0;
    instance_destroy();
}

with (instance_create(x, y, obj_comboend))
{
    combo = global.savedcombo;
    comboscore = global.comboscore;
    combominus = round(comboscore / 50);
    beyond = floor(combo / 5) >= (sprite_get_number(spr_comboend_title1) / 2);
    var s = floor(combo / 5) % (sprite_get_number(spr_comboend_title1) / 2);
    
    if (room != timesuproom && room != rank_room)
    {
        fmod_event_play(global.comboendsnd);
        fmod_event_setParameter(global.comboendsnd, "state2", beyond, true);
        fmod_event_setParameter(global.comboendsnd, "state", s, true);
    }
}

global.comboscore = 0;
global.savedcombo = 0;
