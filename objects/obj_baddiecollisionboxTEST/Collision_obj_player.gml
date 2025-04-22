if (baddieID.state != enemystates.grabbed && baddieID.state != enemystates.pummel)
{
    var _playerinst = other.id;
    baddiecollisionbox_update(_playerinst);
}
