// feather disable all
// feather ignore all
if (surface_exists(shellSurface)) {
    surface_free(shellSurface);
}
if (ds_exists(deferredQueue, ds_type_queue)) {
    ds_queue_destroy(deferredQueue);
}