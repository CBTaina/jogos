// --- ALTERNAR TELA CHEIA / JANELA (GLOBAL) ---
// Funciona com F11 ou ALT + ENTER a qualquer momento do jogo
var _alt_enter = (keyboard_check(vk_alt) && keyboard_check_pressed(vk_enter));
var _f11       = keyboard_check_pressed(vk_f11);

if (_f11 || _alt_enter) {
    var _is_full = window_get_fullscreen();
    
    // Alterna o modo de janela
    window_set_fullscreen(!_is_full);
    
    // Se voltar para modo janela, garante o tamanho e centralização bonitos
    if (_is_full) {
        window_set_size(1280, 720); // Resolução confortável de janela
        window_center();
    } else {
        window_set_size(1920, 1080);
    }
}