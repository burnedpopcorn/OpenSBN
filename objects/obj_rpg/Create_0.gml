x = 0;
y = obj_gameFrame.defaultheight;
ystart = obj_gameFrame.defaultheight;
xstart = 0;

if (!variable_global_exists("rpgStats"))
    global.rpgStats = ds_map_create();

statOne = ds_map_create();
statMax = ds_map_create();
var defaultStats = [["movespeed", 0.25, 3], ["swimming", 0.35, 3], ["jump", 0.35, 3], ["groundpound", 1, 3], ["attack", 0.25, 4], ["defense", 0.25, 9]];
levelup = 0;
visible = false;

for (var i = 0; i < array_length(defaultStats); i++)
{
    ds_map_set(statOne, array_get(array_get(defaultStats, i), 0), defaultStats[i][1]);
    ds_map_set(global.rpgStats, array_get(array_get(defaultStats, i), 0), defaultStats[i][1]);
    ds_map_set(statMax, array_get(array_get(defaultStats, i), 0), defaultStats[i][2]);
}

playerStat = function(argument0, argument1) constructor
{
    static addExp = function(argument0)
    {
        xp += argument0;
        
        while (xp > exp_curve[level - 1] && level < 100)
        {
            level++;
            show_debug_message(concat("LEVEL UP! ", name, ": ", level, "(", xp, ")"));
            
            with (obj_rpg)
            {
                if (visible)
                    levelup++;
            }
        }
    };
    
    name = argument0;
    xp = 0;
    level = 1;
    exp_curve = argument1;
};

defaultExpCurve = [];

for (var i = 1; i < 101; i++)
{
    var p = i / 0.55;
    var ep = 1.5384615384615383;
    var v = power(p, ep);
    defaultExpCurve[i - 1] = floor(v);
}

playerStats = 
{
    movespeed: new playerStat("movespeed", defaultExpCurve),
    swimming: new playerStat("swimming", defaultExpCurve),
    jump: new playerStat("jump", defaultExpCurve),
    groundpound: new playerStat("groundpound", defaultExpCurve),
    attack: new playerStat("attack", defaultExpCurve),
    defense: new playerStat("defense", defaultExpCurve)
};
ini_open_from_string(obj_savesystem.ini_str);
var statNames = struct_get_names(playerStats);

for (var i = 0; i < array_length(statNames); i++)
{
    var val = ini_read_real("RPG", statNames[i], 0);
    show_debug_message(concat("reading values for ", statNames[i], ": ", val));
    var st = struct_get(playerStats, statNames[i]);
    st.addExp(val);
    show_debug_message(concat(st.name, ", ", st.xp, ", ", st.level));
}

ini_close();
stillBuffer = 60;
stillx = 0;
stilly = 0;
showGUI = false;
visible = true;
alarm[0] = 60;
