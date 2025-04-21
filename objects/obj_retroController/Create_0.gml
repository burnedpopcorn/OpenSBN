activated = false;
activeRoom = false;
depth = -10000;
scanblock_y = 0;
textures = texturegroup_get_textures("plumbergroup");

for (var i = 0; i < array_length(textures); i++)
{
    if (!texture_is_ready(textures[i]))
        texture_prefetch(textures[i]);
}
