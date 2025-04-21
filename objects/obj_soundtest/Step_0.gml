var mu = musicArr[position];

if (pos_playing != position)
{
    var mu_old = musicArr[pos_playing];
    
    if (mu_old.playing)
        mu_old.stop();
    
    if (active)
        mu.play();
    
    pos_playing = position;
}

var spr = sprite_index;

if (mu.playing && !mu.is_paused)
{
    if (!event_isplaying(mu.event))
        fmod_event_play(mu.event);
    
    active = true;
    sprite_index = spr_soundtestguydance;
}
else
{
    if (mu.is_paused && fmod_event_getPause(mu.event) == false)
        fmod_event_setPause(mu.event, true);
    
    active = false;
    sprite_index = spr_escapeguy_left;
}

if (sprite_index != spr)
    image_index = 0;

bubbleindex += 0.1;

if (bubbleindex > 2)
    bubbleindex = frac(bubbleindex);
