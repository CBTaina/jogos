var _node = story_nodes[current_node];
var _full_text = _node.text;
var _has_choices = (array_length(_node.choices) > 0);

// --- 1. MÁQUINA DE DIGITAÇÃO DE TEXTO ---
if (text_progress < string_length(_full_text)) {
    text_progress += text_speed;
    
    // Se o jogador clicar durante a digitação, completa a frase imediatamente
    if (keyboard_check_pressed(vk_space) || keyboard_check_pressed(vk_enter) || mouse_check_button_pressed(mb_left)) {
        text_progress = string_length(_full_text);
    }
    exit;
}

// --- 2. SE HOUVER ESCOLHAS (SISTEMA AMOR DOCE) ---
if (_has_choices) {
    is_waiting_choice = true;
    var _num_c = array_length(_node.choices);

    // Navegação entre opções
    if (keyboard_check_pressed(vk_up) || keyboard_check_pressed(ord("W"))) {
        choice_index = (choice_index - 1 + _num_c) % _num_c;
    }
    if (keyboard_check_pressed(vk_down) || keyboard_check_pressed(ord("S"))) {
        choice_index = (choice_index + 1) % _num_c;
    }

    // Clique com Mouse/Touch
    var _mx = device_mouse_x_to_gui(0);
    var _my = device_mouse_y_to_gui(0);
    for (var i = 0; i < _num_c; i++) {
        var _cy = 90 + (i * 35);
        if (_mx >= 100 && _mx <= 380 && _my >= _cy && _my <= _cy + 28) {
            choice_index = i;
        }
    }

    // Confirmação da escolha
    var _select = keyboard_check_pressed(vk_space) || keyboard_check_pressed(vk_enter) || mouse_check_button_pressed(mb_left);

    if (_select) {
        // Salva a escolha no Save Oficial
        if (current_node == 3) { // Escolha do Líbero
            var _c = global.player_save.cap1_candidates;
            global.player_save.selected_libero = (choice_index == 0) ? _c.libero_1 : _c.libero_2;
            save_game_data(global.player_save);
        }
        else if (current_node == 5) { // Escolha do Atacante
            var _c = global.player_save.cap1_candidates;
            global.player_save.selected_ponteiro = (choice_index == 0) ? _c.ponteiro_1 : _c.ponteiro_2;
            
            // Adiciona os escolhidos ao time ativo
            global.player_save.team_roster = ["takeshi", global.player_save.selected_libero, global.player_save.selected_ponteiro];
            save_game_data(global.player_save);
        }

        // Avança na história
        is_waiting_choice = false;
        choice_index = 0;
        current_node++;
        text_progress = 0;
    }
} 

// --- 3. SE FOR FALA NORMAL ---
else {
    var _advance = keyboard_check_pressed(vk_space) || keyboard_check_pressed(vk_enter) || mouse_check_button_pressed(mb_left);

    if (_advance) {
        if (current_node < array_length(story_nodes) - 1) {
            current_node++;
            text_progress = 0;
        } else {
            // FIM DO DIÁLOGO: Retorna ao Hub Principal
            room_goto(rm_main_hub);
        }
    }
}