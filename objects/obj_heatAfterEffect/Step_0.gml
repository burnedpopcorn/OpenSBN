if (room == rank_room)
    visible = false;

var player_hsp = playerID.x - playerID.xprevious;
var player_vsp = playerID.y - playerID.yprevious;
x += (vSpeed + player_hsp);
y += ((Hspeed + player_vsp) - 1);
