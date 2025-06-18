callsnd = fmod_createEventInstance("event:/SFX/special/luigicall");
ready = false;
fmod_event_play(callsnd);
alarm[0] = 1;
mail_trigger(mailtriggers.luigicall);
