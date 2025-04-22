if (playerid.object_index == obj_vigilanteboss && place_meeting(x, y, obj_player1))
{
    playerid.state = enemystates.walk;
    playerid.walkstate = enemystates.walk;
    playerid.movespeed = 0;
}
