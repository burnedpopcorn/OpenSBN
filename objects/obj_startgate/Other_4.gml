switch (targetRoom)
{
    case midway_1:
    case water_1:
        world = 1;
        break;
    
    case forest_1:
    case minigolf_1:
        world = 2;
        break;
        world = 3;
        break;
        world = 4;
        break;
        world = 5;
        break;
}

ini_open_from_string(obj_savesystem.ini_str);
highscore = ini_read_real("Highscore", string(level), 0);
secret_count = ini_read_string("Secret", string(level), 0);
toppin[0] = ini_read_real("Toppin", string(level) + "1", 0);
toppin[1] = ini_read_real("Toppin", string(level) + "2", 0);
toppin[2] = ini_read_real("Toppin", string(level) + "3", 0);
toppin[3] = ini_read_real("Toppin", string(level) + "4", 0);
toppin[4] = ini_read_real("Toppin", string(level) + "5", 0);
rank = ini_read_string("Ranks", string(level), "d");
ini_close();
var _toppinspr = [[spr_toppinshroom, spr_toppinshroom_run, spr_toppinshroom_taunt, -75], [spr_toppincheese, spr_toppincheese_run, spr_toppincheese_taunt, -35], [spr_toppintomato, spr_toppintomato_run, spr_toppintomato_taunt, 0], [spr_toppinsausage, spr_toppinsausage_run, spr_toppinsausage_taunt, 35], [spr_toppinpineapple, spr_toppinpineapple_run, spr_toppinpineapple_taunt, 75]];

for (var i = 0; i < array_length(_toppinspr); i++)
{
    var b = _toppinspr[i];
    
    if (toppin[i])
    {
        with (instance_create(x + b[3], y + 100, obj_toppinprop))
        {
            tauntspr = b[2];
            movespr = b[1];
            idlespr = b[0];
            
            if (place_meeting(x, y, obj_platform))
                y -= 2;
        }
    }
}

if (object_index == obj_startgate && level != "exit" && level != "tutorial")
{
    for (var i = 1; i <= 3; i++)
    {
        var b = 1;
        
        if (i > secret_count)
            b = 0;
        
        with (instance_create(x, y - (sprite_height / 2), obj_startgate_secreteye))
        {
            last_current_time = current_time + (600000 * i * 2);
            timer = last_current_time;
            trace(other.level, " secret eye ", i, timer);
            time_x += (i - 1);
            time_y += ((i - 1) * 2);
            
            if (b)
                sprite_index = spr_gatesecreteyeopen;
            else
                sprite_index = spr_gatesecreteyeclosed;
        }
    }
}

switch (level)
{
    case "entrance":
        msg = "ENTRANCE";
        break;
    
    case "medieval":
        msg = "PIZZASCAPE";
        break;
    
    case "chateau":
        msg = "PIZZASCARE";
        break;
    
    case "ruin":
        msg = "TEH ANCIENT CHEESE";
        break;
    
    case "dungeon":
        msg = "BLOODSAUCE DUNGEON";
        break;
    
    case "floorroom":
        msg = "OREGANO DESERT";
        break;
    
    case "graveyard":
        msg = "THE WASTEYARD";
        break;
    
    case "farm":
        msg = "FUN FARM";
        break;
    
    case "ufo":
        msg = "SPACE PINBALL";
        break;
    
    case "strongcold":
        msg = "STRONGCOLD";
        break;
    
    case "forest":
        msg = "GNOME FOREST";
        break;
    
    case "beach":
        msg = "PINEAPPLE BEACH";
        break;
    
    case "dragonlair":
        msg = "DRAGON LAIR";
        break;
    
    case "snickchallenge":
        msg = "SNICK CHALLENGE";
        break;
}
