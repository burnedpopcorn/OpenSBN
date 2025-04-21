if (room == rm_blank)
    exit;

var targetplayer = global.coop ? instance_nearest(x, y, obj_player1) : obj_player1;
var scare_check = targetplayer.state == states.chainsawbump || targetplayer.state == states.mach3 || targetplayer.state == states.rideweenie || targetplayer.state == states.rocket || targetplayer.state == states.tacklecharge || targetplayer.state == states.knightpepslopes || (targetplayer.state == states.grab && targetplayer.swingdingdash <= 0 && targetplayer.sprite_index == targetplayer.spr_swingding);

if (!(sprite_index == spr_hungrypillar_fightback))
{
    sprite_index = spr_hungrypillar;
    
    if (collision_rectangle(x - 400, y - 60, x + 400, y + 60, targetplayer, false, false) && (targetplayer.x - x) == -sign(image_xscale) && scare_check)
        sprite_index = spr_hungrypillar_angry;
}
