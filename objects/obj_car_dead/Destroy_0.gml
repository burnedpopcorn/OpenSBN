instance_create(x + 32, y + 16, obj_player1explosion);
instance_create(x - 32, y - 8, obj_player1explosion);

with (instance_create(x, y, obj_pizzaslice))
{
    depth = other.depth - 1;
    vsp = -8;
    hsp = 2;
}
