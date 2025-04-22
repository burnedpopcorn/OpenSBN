if (instance_exists(baddieID) && baddieID.invtime == 0 && baddieID.rattime <= 0 && baddieID.state != enemystates.grabbed && baddieID.state != enemystates.hit && !baddieID.invincible && baddieID.instantkillable)
{
    instance_destroy(baddieID);
    instance_destroy();
}
