var statNames = struct_get_names(playerStats);
var maxxed = true;

for (var i = 0; i < array_length(statNames); i++)
{
    var nm = statNames[i];
    var st = struct_get(playerStats, nm);
    
    if (st.level < 100)
        maxxed = false;
    else if (nm == "defense")
        mail_trigger(UnknownEnum.Value_18);
    
    var pmax = ds_map_find_value(statMax, nm);
    var pmin = ds_map_find_value(statOne, nm);
    var n = (st.level - 1) * (pmax - pmin);
    var v = (n / 99) + pmin;
    ds_map_set(global.rpgStats, nm, v);
}

if (maxxed)
    mail_trigger(UnknownEnum.Value_19);
