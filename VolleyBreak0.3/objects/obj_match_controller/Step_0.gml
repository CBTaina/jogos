switch (match_state) {

    case MATCH_STATE.WAITING_SERVE:
        if (keyboard_check_pressed(vk_space)) {
            match_state = MATCH_STATE.RECEIVE;
            timer = timer_max;
            status_message = "Saque Adversário! Escolha o Passe:";
            
            // Lança a bola para a posição do Passador com arco de altura 40
            ball_ref.launch_to(80, 180, 40, 0.03);
        }
        break;

    case MATCH_STATE.RECEIVE:
        timer--;
        
        // Ação 1: Passe Normal (Seta Esquerda ou 1)
        if (keyboard_check_pressed(vk_left) || keyboard_check_pressed(ord("1"))) {
            execute_pass("Passe Normal efetuado!", 0, 160, 175, 30, MATCH_STATE.SET);
        }
        // Ação 2: Passe de Precisão (Seta Cima ou 2 - Usa Stamina)
        else if (keyboard_check_pressed(vk_up) || keyboard_check_pressed(ord("2"))) {
            if (player_passador.use_stamina(15)) {
                execute_pass("Passe Perfeito! (Habilidade)", 0, 160, 175, 20, MATCH_STATE.SET);
            } else {
                status_message = "Passador sem Stamina!";
            }
        }
        // Ação 3: Passe Direto Rápido (Seta Direita ou 3)
        else if (keyboard_check_pressed(vk_right) || keyboard_check_pressed(ord("3"))) {
            execute_pass("Passe Direto para Ataque Surpresa!", 0, 215, 170, 45, MATCH_STATE.ATTACK);
        }

        if (timer <= 0) {
            score_point(false, "ERRO! Recepção fora do tempo.");
        }
        break;

    case MATCH_STATE.SET:
        timer--;
        
        // Ação 1: Levantamento Alto
        if (keyboard_check_pressed(vk_left) || keyboard_check_pressed(ord("1"))) {
            execute_pass("Levantamento Alto perfeito!", 0, 215, 170, 35, MATCH_STATE.ATTACK);
        }
        // Ação 2: Chutada Rápida (Seta Cima)
        else if (keyboard_check_pressed(vk_up) || keyboard_check_pressed(ord("2"))) {
            if (player_levantador.use_stamina(15)) {
                timer_max = 50; // Diminui o tempo de reação do ataque!
                execute_pass("Levantamento Chutado Veloz!", 0, 215, 170, 15, MATCH_STATE.ATTACK);
            } else {
                status_message = "Levantador sem Stamina!";
            }
        }
        // Ação 3: Backset (Seta Direita)
        else if (keyboard_check_pressed(vk_right) || keyboard_check_pressed(ord("3"))) {
            execute_pass("Backset de Costas!", 0, 210, 170, 25, MATCH_STATE.ATTACK);
        }

        if (timer <= 0) {
            score_point(false, "ERRO! Bola caiu no levantamento.");
        }
        break;

    case MATCH_STATE.ATTACK:
        timer--;
        
        // Ação 1: Corte Diagonal
        if (keyboard_check_pressed(vk_left) || keyboard_check_pressed(ord("1"))) {
            ball_ref.launch_to(400, 200, 20, 0.06);
            score_point(true, "PONTO! Corte diagonal cravado!");
        }
        // Ação 2: Largada
        else if (keyboard_check_pressed(vk_up) || keyboard_check_pressed(ord("2"))) {
            ball_ref.launch_to(280, 195, 30, 0.04);
            score_point(true, "PONTO! Largada sutil por cima do bloqueio!");
        }
        // Ação 3: Super Corte Explosivo
        else if (keyboard_check_pressed(vk_right) || keyboard_check_pressed(ord("3"))) {
            if (player_atacante.use_stamina(25)) {
                ball_ref.launch_to(420, 205, 15, 0.08);
                score_point(true, "PONTO SPECTACULAR! Super Corte Explosivo!");
            } else {
                status_message = "Atacante sem Stamina!";
            }
        }

        if (timer <= 0) {
            score_point(false, "BLOQUEADO! Demora na tomada de decisão.");
        }
        break;

    case MATCH_STATE.POINT_SCORED:
        if (keyboard_check_pressed(ord("R")) || keyboard_check_pressed(vk_space)) {
            match_state = MATCH_STATE.WAITING_SERVE;
            timer_max = 90;
            timer = timer_max;
            status_message = "Pressione [ESPAÇO] para o próximo saque.";
            ball_ref.launch_to(360, 120, 0, 0.1);
        }
        break;
}

// --- FUNÇÕES AUXILIARES LOCAIS ---
function execute_pass(_msg, _stamina_cost, _tx, _ty, _arc, _next_state) {
    status_message = _msg;
    ball_ref.launch_to(_tx, _ty, _arc, 0.05);
    match_state = _next_state;
    timer = timer_max;
}

function score_point(_is_home_point, _msg) {
    if (_is_home_point) score_home++;
    else score_away++;
    
    status_message = _msg;
    match_state = MATCH_STATE.POINT_SCORED;
}