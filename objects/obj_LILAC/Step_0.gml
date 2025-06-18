if (distance_to_object(obj_player1) <= 350)
{
    global.speakerbox[(global.leveltosave == "midway") ? 0 : 1] = true;
    mail_trigger(mailtriggers.visitLILAC);
    instance_destroy();
}
else if (global.level_minutes > timer)
{
    instance_destroy();
}
