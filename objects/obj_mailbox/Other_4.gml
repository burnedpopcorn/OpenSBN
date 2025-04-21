mail_trigger(UnknownEnum.Value_0);
var num_unread = 0;

for (var i = 0; i < array_length(global.mailArr); i++)
{
    var letter = global.mailArr[i];
    
    if (letter.unlocked)
    {
        array_push(obtainedMail, letter);
        
        if (!letter.read && i != 0)
        {
            num_unread++;
            newmessage = true;
        }
    }
}

if (newmessage)
{
    if (num_unread > 1)
        fmod_event_setParameter(mailsnd, "state", 1);
    else
        fmod_event_setParameter(mailsnd, "state", 0);
    
    fmod_event_play(mailsnd);
}
