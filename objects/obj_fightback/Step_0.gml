if (!instance_exists(pillar) || pillar == -4)
{
    instance_destroy();
    exit;
}

if (fight)
{
    if (!place_meeting(x, y, obj_player1) && pillar.sprite_index == spr_hungrypillar_fightback)
    {
        if (pillar.image_index >= (pillar.image_number - 1))
        {
            fight = false;
            punched = false;
            pillar.sprite_index = spr_hungrypillar;
            pillar.image_index = 0;
        }
    }
}
