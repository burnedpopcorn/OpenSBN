with (other)
{
    if (vsp < 0)
    {
        repeat (2)
            create_debris(x, y + 43, spr_cheesechunk);
        
        vsp *= 0.5;
        event_play_oneshot("event:/SFX/bo/jump", x, y);
    }
    
    if (state == states.climbwall)
        state = grounded ? states.normal : states.jump;
    
    if (hsp != 0 && (floor(image_index) % 4) == 0)
    {
        create_debris(x, y + 43, spr_cheesechunk);
        
        if (!other.stepped)
        {
            other.stepped = 1;
            other.alarm[0] = 8;
        }
    }
}
