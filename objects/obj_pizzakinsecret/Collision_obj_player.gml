if (room == rm_blank)
    exit;

if (obj_player1.state != states.hurt && global.secretfollow == 0)
{
    global.heattime = 60;
    global.style += 10;
    ds_list_add(global.saveroom, id);
    global.secretfollow = 1;
    panic = 0;
}
