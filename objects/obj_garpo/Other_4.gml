absent = false;
image_alpha = 0;
x = obj_player1.x;
y = obj_player1.y;

if (instance_exists(obj_treasure) || global.inSecret || room == rank_room)
{
    absent = true;
    x = -300;
    y = -300;
}

if (room == rank_room)
{
    visible = false;
    instance_destroy();
}
else if (!global.panic)
{
    instance_destroy(self, false);
}
