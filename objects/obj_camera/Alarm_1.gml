var _score = global.collect;
var cs = 0;

with (obj_comboend)
    cs += comboscore;

with (obj_particlesystem)
{
    for (var i = 0; i < ds_list_size(global.collect_list); i++)
        cs += ds_list_find_value(global.collect_list, i).value;
}

var sc = _score - global.comboscore - cs;

if (global.panic == true || global.snickchallenge == 1)
{
    global.seconds -= 1;
    
    if (!global.inSecret)
    {
        if (sc >= 5)
        {
            global.collect -= 5;
            
            if (!instance_exists(obj_granny))
            {
                with (instance_create(190, 65, obj_negativenumber))
                    number = "-5";
            }
        }
        
        if (instance_exists(obj_player2))
        {
            if (global.collectN >= 5)
                global.collectN -= 5;
        }
    }
    
    if (global.seconds < 0)
    {
        global.seconds = 59;
        global.minutes -= 1;
    }
}

if (global.timedgate == 1 || global.miniboss == true)
{
    global.seconds -= 1;
    
    if (global.seconds < 0)
    {
        global.seconds = 59;
        global.minutes -= 1;
    }
}

if (global.minutes < 0)
{
    global.seconds = 0;
    global.minutes = 0;
}

alarm[1] = 60;
