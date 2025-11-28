var statNames = struct_get_names(playerStats);
var maxxed = true;

for (var i = 0; i < array_length(statNames); i++)
{
    var nm = statNames[i];
    var st = struct_get(playerStats, nm);
    
    if (st.level < 100)
        maxxed = false;
    else if (nm == "defense")
        mail_trigger(mailtriggers.maxdefense);
    
    var pmax = statMax[? nm];
    var pmin = statOne[? nm];
    var n = (st.level - 1) * (pmax - pmin);
    var v = (n / 99) + pmin;
    global.rpgStats[? nm] = v;
}

if (maxxed)
    mail_trigger(mailtriggers.maxlevel);
