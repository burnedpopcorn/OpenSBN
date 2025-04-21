if (room == rm_blank)
    exit;

if (obj_player1.state == states.knightpep || (obj_player1.state == states.chainsaw && (obj_player1.tauntstoredstate == states.knightpep || obj_player1.tauntstoredstate == states.knightpepslopes)) || obj_player1.state == states.knightpepattack || obj_player1.state == states.knightpepslopes || obj_player1.state == states.knightpepbump)
    sprite_index = spr_swordstonetaken;
else
    sprite_index = spr_swordstone;

if (sprite_index == spr_swordstone && !instance_exists(ID))
{
    with (instance_create(x, y - 20, obj_grabmarker))
        other.ID = id;
}
else if (sprite_index == spr_swordstonetaken && instance_exists(ID))
{
    instance_destroy(ID);
}
