if (state != enemystates.grabbed && other.state != states.handstandjump && state != enemystates.stun && (state == UnknownEnum.Value_143 || state == enemystates.walk))
    scr_hurtplayer(other);
