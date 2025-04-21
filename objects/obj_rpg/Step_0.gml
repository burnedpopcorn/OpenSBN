if (!global.option_secret_rpg || room == rm_mainmenu)
{
    instance_destroy();
    exit;
}

if (!instance_exists(obj_player1))
    exit;

var player = obj_player1;

if (player.x == stillx && player.y == stilly)
{
    if (stillBuffer > 0)
        stillBuffer--;
    else
        showGUI = true;
}
else
{
    stillx = player.x;
    stilly = player.y;
    showGUI = false;
    stillBuffer = 60;
}
