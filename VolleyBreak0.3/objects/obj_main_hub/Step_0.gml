glow_timer += 0.05;

// --- SE O MODAL DE AVISO ESTIVER ATIVO ---
if (show_lock_modal) {
    if (keyboard_check_pressed(vk_enter) || keyboard_check_pressed(vk_space) || mouse_check_button_pressed(mb_left)) {
        show_lock_modal = false;
    }
    exit;
}

// --- NAVEGAÇÃO DE MENU (TECLADO / WASD) ---
if (keyboard_check_pressed(vk_left) || keyboard_check_pressed(ord("A"))) {
    selected_index = (selected_index - 1 + 3) % 3;
}
if (keyboard_check_pressed(vk_right) || keyboard_check_pressed(ord("D"))) {
    selected_index = (selected_index + 1) % 3;
}

// --- DETECÇÃO DE HOVER E CLIQUE DO MOUSE NA GUI (480x270) ---
var _mx = device_mouse_x_to_gui(0);
var _my = device_mouse_y_to_gui(0);

var _btn_w = 130, _btn_h = 135, _start_x = 25, _btn_y = 55;
var _mouse_clicked_button = false;

for (var i = 0; i < 3; i++) {
    var _bx = _start_x + (i * 150);
    if (_mx >= _bx && _mx <= _bx + _btn_w && _my >= _btn_y && _my <= _btn_y + _btn_h) {
        selected_index = i; // Seleciona o botão sobre o qual o mouse está
        
        if (mouse_check_button_pressed(mb_left)) {
            _mouse_clicked_button = true;
        }
    }
}

// --- CONFIRMAÇÃO DE SELEÇÃO ---
var _select = keyboard_check_pressed(vk_enter) || keyboard_check_pressed(vk_space) || _mouse_clicked_button;

if (_select) {
    switch (selected_index) {
        
        case 0: // HISTÓRIA
            // Se a sala existir, vai para ela. Senão cria um aviso no console.
            if (room_exists(rm_story_select)) {
                room_goto(rm_story_select);
            } else {
                show_debug_message("ERRO: A room 'rm_story_select' ainda nao foi criada!");
            }
            break;

        case 1: // TEMPORADA
            var _unlocked_count = array_length(global.player_save.unlocked_characters);
            if (_unlocked_count >= 6) {
                show_debug_message("Acessando Modo Temporada...");
            } else {
                show_lock_modal = true;
                lock_message = "MODO BLOQUEADO!\n\nVoce precisa de pelo menos 6 Atletas\ndesbloqueados para montar um time completo.\nAtuais: " + string(_unlocked_count) + "/6";
            }
            break;

        case 2: // LOJA
            show_debug_message("Acessando Loja...");
            break;
    }
}