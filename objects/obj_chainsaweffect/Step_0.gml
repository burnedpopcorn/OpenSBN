image_xscale = obj_player1.xscale;

if (obj_player1.state == states.chainsaw)
{
    x = obj_player1.x;
    y = obj_player1.y;
}

if (obj_player1.state == states.chainsawpogo)
{
    x = obj_player1.x + (-obj_player1.image_xscale * 20);
    y = obj_player1.y + 30;
}

if (obj_player1.state != states.chainsaw && obj_player1.state != states.chainsawpogo)
    instance_destroy();

image_speed = 0.35;
