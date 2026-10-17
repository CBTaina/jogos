/// @description Configura a escala de pixel art, resolução Full HD e Tela Cheia
function init_game_display() {
    var _base_w = 480;
    var _base_h = 270;
    
    // Liga a tela cheia
    window_set_fullscreen(true);
    
    // Define o tamanho da janela de renderização para Full HD (1920x1080)
    window_set_size(1920, 1080);
    
    // Redimensiona o Application Surface para Full HD
    surface_resize(application_surface, 1920, 1080);
    
    // Garante que a interface GUI fique travada na resolução interna
    display_set_gui_size(_base_w, _base_h);
    
    // Desativa a interpolação de textura para evitar pixels borrados (Crisp Pixel Art)
    gpu_set_texfilter(false);
}