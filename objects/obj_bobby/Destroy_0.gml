if (!global.bobbydead)
{
    global.bobbydead = true;
    global.bobby_x = x;
    global.bobby_y = y;
    mail_trigger(UnknownEnum.Value_7);
    quick_ini_write_real(undefined, "Game", "bobbyX", x);
    quick_ini_write_real(undefined, "Game", "bobbyY", y);
}

event_inherited();
