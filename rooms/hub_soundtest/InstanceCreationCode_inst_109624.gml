secret = true;
targetRoom = hub_world1;
depth = 0;
var p = ds_list_find_index(global.saveroom, id);

if (p != -1)
    ds_list_delete(global.saveroom, p);
