for (var i = 0; i < array_length(textures); i++)
{
    if (texture_is_ready(textures[i]))
        texture_flush(textures[i]);
}
