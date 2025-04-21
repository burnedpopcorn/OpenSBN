targetRoom = hub_soundtest;
var p = ds_list_find_index(global.saveroom, id);

if (p != -1)
    ds_list_delete(global.saveroom, p);

ini_open_from_string(obj_savesystem.ini_str);
var l = ["midway", "fish"];
var scount = 0;
var smax = 3 * array_length(l);

for (var i = 0; i < array_length(l); i++)
{
    var lv = l[i];
    scount += ini_read_real("Secret", lv, 0);
}

ini_close();

if (scount < smax)
    instance_destroy();
