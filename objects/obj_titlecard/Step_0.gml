if (!fadein)
{
    fadealpha = approach(fadealpha, 1, 0.1);
    
    if (fadealpha >= 1)
    {
        fadein = 1;
        start = true;
        music = 0;
        alarm[1] = 1;
    }
}
else
{
    fadealpha = approach(fadealpha, 0, 0.1);
    
    if (fadealpha <= 0 && !music && title_music != -4)
    {
        music = 1;
        event_play_oneshot(title_music);
    }
}
