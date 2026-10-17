// --- MÁQUINA DE ESTADOS E TEMPO ---
match_state = MATCH_STATE.WAITING_SERVE;
timer_max   = 90; // ~1.5 segundos a 60 FPS
timer       = timer_max;

// --- DADOS DA PARTIDA ---
score_home = 0;
score_away = 0;
status_message = "Pressione [ESPAÇO] para autorizar o saque!";

// --- ESCALAÇÕES E TRIO EM QUADRA ---
player_passador  = new PlayerData("p1", "Renan", "Passador", 60, 85, 100);
player_levantador = new PlayerData("p2", "Kaio", "Levantador", 50, 90, 100);
player_atacante  = new PlayerData("p3", "Léo", "Atacante", 90, 70, 100);

// Instancia a bola no jogo
ball_ref = instance_create_layer(360, 120, "Instances", obj_ball);