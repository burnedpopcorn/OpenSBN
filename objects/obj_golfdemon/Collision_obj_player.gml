if (state != enemystates.grabbed && other.state != states.handstandjump && state != enemystates.stun && (state == enemystates.chase || state == enemystates.walk))
    scr_hurtplayer(other);
