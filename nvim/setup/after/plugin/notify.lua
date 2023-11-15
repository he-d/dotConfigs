local status_ok, notify = pcall(require, "notify")
if not status_ok then
    return
end

notify.setup{
    --options: fade_in_slide_out, fade, slide, static
    stages = 'static',
    background_colour = 'FloatShadow',
    timeout = 2500,
    minimum_width = 15,
}


