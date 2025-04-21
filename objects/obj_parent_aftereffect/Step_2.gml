if (frozen && !global.freezeframe)
{
    for (var i = 0; i < 3; i++)
    {
        if (alarm_get(i) > 0)
            alarm_set(i, -1);
    }
}
