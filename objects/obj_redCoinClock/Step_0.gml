if (lastActivated != (global.redcoin > 0))
{
    instance_create(playerID.x, playerID.y - 95, obj_genericpoofeffect);
    lastActivated = global.redcoin > 0;
}
