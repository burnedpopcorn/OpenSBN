for (var i = 0; i < array_length(global.secret_layers); i++)
{
    var a = global.secret_layers[i];
    surface_free(a.surf);
}

global.secret_layers = [];
