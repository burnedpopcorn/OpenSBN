if (!area)
{
    spr_intro = spr_null;
    spr_idle = spr_toppin_animation_but_awesome_idle;
    spr_run = spr_toppin_animation_but_awesome_walk;
    spr_panic = spr_toppin_animation_but_awesome_idle;
    spr_taunt = spr_toppin_animation_but_awesome_taunt;
    spr_supertaunt = spr_taunt;
}
else
{
    spr_intro = spr_null;
    spr_idle = spr_toppin_fruisetta_idle;
    spr_run = spr_toppin_fruisetta_walk;
    spr_panic = spr_toppin_fruisetta_idle;
    spr_taunt = spr_toppin_fruisetta_taunt;
    spr_swim = spr_noisettefish;
    spr_supertaunt = spr_taunt;
}
