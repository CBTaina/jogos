blink_timer += 0.05;
blink_alpha = abs(sin(blink_timer));

switch (current_state) {

    // 1. TELA DE INÍCIO PISCANTE
    case TITLE_STATE.PRESS_ANY_KEY:
        if (keyboard_check_pressed(vk_anykey) || mouse_check_button_pressed(mb_any)) {
            current_state = TITLE_STATE.MAIN_MENU;
            menu_index = 0;
        }
        break;

    // 2. MENU PRINCIPAL
    case TITLE_STATE.MAIN_MENU:
        var _total_opts = array_length(menu_options);

        // Navegação com Teclado
        if (keyboard_check_pressed(vk_up) || keyboard_check_pressed(ord("W"))) {
            menu_index = (menu_index - 1 + _total_opts) % _total_opts;
        }
        if (keyboard_check_pressed(vk_down) || keyboard_check_pressed(ord("S"))) {
            menu_index = (menu_index + 1) % _total_opts;
        }

        // Navegação com Mouse/Touch
        var _mx = device_mouse_x_to_gui(0);
        var _my = device_mouse_y_to_gui(0);
        var _box_x = 140, _start_y = 120;

        for (var i = 0; i < _total_opts; i++) {
            var _opt_y = _start_y + (i * 30);
            if (_mx >= _box_x && _mx <= _box_x + 200 && _my >= _opt_y && _my <= _opt_y + 25) {
                menu_index = i;
            }
        }

        // Confirmação (Enter, Espaço ou Clique)
        var _select = keyboard_check_pressed(vk_enter) || keyboard_check_pressed(vk_space) || mouse_check_button_pressed(mb_left);

        // --- DENTRO DO CASE TITLE_STATE.MAIN_MENU ---
		if (_select) {
			var _selected = menu_options[menu_index];

			if (_selected == "CONTINUAR") {
				load_game_data();
				room_goto(rm_main_hub); // <--- ALTERADO: Agora vai direto para o Hub Principal!
			}
			else if (_selected == "COMENÇAR A JOGAR") {
				keyboard_string = "";
				player_nickname = "";
				current_state = TITLE_STATE.INPUT_NAME;
			}
			else if (_selected == "NOVO JOGO") {
				current_state = TITLE_STATE.CONFIRM_NEW_GAME;
				confirm_index = 1;
			}
			else if (_selected == "SAIR") {
				game_end();
			}
		}
        break;

    // 3. CONFIRMAÇÃO DE NOVO JOGO
    case TITLE_STATE.CONFIRM_NEW_GAME:
        if (keyboard_check_pressed(vk_left) || keyboard_check_pressed(ord("A")) ||
            keyboard_check_pressed(vk_right) || keyboard_check_pressed(ord("D"))) {
            confirm_index = (confirm_index == 0) ? 1 : 0;
        }

        var _confirm_select = keyboard_check_pressed(vk_enter) || keyboard_check_pressed(vk_space);

        if (mouse_check_button_pressed(mb_left)) {
            var _mx = device_mouse_x_to_gui(0);
            var _my = device_mouse_y_to_gui(0);
            if (_my >= 160 && _my <= 185) {
                if (_mx >= 130 && _mx <= 220) { confirm_index = 0; _confirm_select = true; }
                if (_mx >= 260 && _mx <= 350) { confirm_index = 1; _confirm_select = true; }
            }
        }

        if (_confirm_select) {
            if (confirm_index == 0) {
                // SIM
                keyboard_string = "";
                player_nickname = "";
                current_state = TITLE_STATE.INPUT_NAME;
            } else {
                // NÃO
                current_state = TITLE_STATE.MAIN_MENU;
            }
        }
        break;

    // 4. CAMPO DE DIGITAÇÃO DE NICKNAME
    case TITLE_STATE.INPUT_NAME:
        // Atualiza a string digitada via teclado físico
        if (string_length(keyboard_string) <= 25) {
            player_nickname = keyboard_string;
        } else {
            keyboard_string = string_copy(keyboard_string, 1, 25);
            player_nickname = keyboard_string;
        }

        // Navegação no teclado virtual
        if (keyboard_check_pressed(vk_left))  vk_grid_x = (vk_grid_x - 1 + 10) % 10;
        if (keyboard_check_pressed(vk_right)) vk_grid_x = (vk_grid_x + 1) % 10;
        if (keyboard_check_pressed(vk_up))    vk_grid_y = (vk_grid_y - 1 + 3) % 3;
        if (keyboard_check_pressed(vk_down))  vk_grid_y = (vk_grid_y + 1) % 3;

        var _clicked_char = "";

        // Clique de mouse no teclado virtual
        if (mouse_check_button_pressed(mb_left)) {
            var _mx = device_mouse_x_to_gui(0);
            var _my = device_mouse_y_to_gui(0);

            for (var _r = 0; _r < 3; _r++) {
                for (var _c = 0; _c < 10; _c++) {
                    var _kx = 90 + (_c * 30);
                    var _ky = 110 + (_r * 26);
                    if (_mx >= _kx && _mx <= _kx + 28 && _my >= _ky && _my <= _ky + 24) {
                        vk_grid_x = _c;
                        vk_grid_y = _r;
                        _clicked_char = vk_layout[_r][_c];
                    }
                }
            }

            // Clique no botão Continuar
            if (_mx >= 160 && _mx <= 320 && _my >= 200 && _my <= 225) {
                _clicked_char = "SUBMIT";
            }
        }

        // Interação por tecla Espaço
        if (keyboard_check_pressed(vk_space) && !keyboard_check(vk_control)) {
            _clicked_char = vk_layout[vk_grid_y][vk_grid_x];
        }

        // Trata os caracteres selecionados
        if (_clicked_char != "") {
            if (_clicked_char == "<") {
                if (string_length(player_nickname) > 0) {
                    player_nickname = string_copy(player_nickname, 1, string_length(player_nickname) - 1);
                    keyboard_string = player_nickname;
                }
            } 
            else if (_clicked_char == "OK" || _clicked_char == "SUBMIT") {
                if (string_length(player_nickname) >= 3 && string_length(player_nickname) <= 25) {
                    delete_save_data();
                    global.player_save.player_name = player_nickname;
                    save_game_data(global.player_save);
                    room_goto(rm_match);
                }
            } 
            else {
                if (string_length(player_nickname) < 25) {
                    player_nickname += _clicked_char;
                    keyboard_string = player_nickname;
                }
            }
        }

        // Confirmar via tecla Enter
        if (keyboard_check_pressed(vk_enter)) {
            if (string_length(player_nickname) >= 3 && string_length(player_nickname) <= 25) {
                delete_save_data();
                global.player_save.player_name = player_nickname;
                save_game_data(global.player_save);
                // Nos momentos onde o jogador clica em CONTINUAR ou finaliza a criação de perfil:
				room_goto(rm_main_hub);
            }
        }
        break;
}