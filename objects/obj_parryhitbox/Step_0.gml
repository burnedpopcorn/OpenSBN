var my_player = obj_player1.id;

if (player_id == 2)
    my_player = obj_player2.id;

if (my_player.state != states.handstandjump && my_player.flash == 0 && my_player.state != states.Parry)
    instance_destroy();

image_xscale = my_player.xscale;
x = my_player.x;
y = my_player.y;
