// Garantia de dados carregados
load_game_data();

// Seleção de Botões do Menu
selected_index = 0; // 0 = História, 1 = Temporada, 2 = Loja
hover_index = -1;

// Nomes e descrições das ligas do Modo Temporada
tier_names = [
    "Campeonato de Bairro",
    "Torneio Municipal",
    "Campeonato Estadual",
    "Liga Regional",
    "Nacional de Vôlei",
    "Mundial de Clubes",
    "Olimpíadas de Vôlei"
];

// Modal de Aviso (Caso tente entrar na Temporada sem 6 personagens)
show_lock_modal = false;
lock_message = "";

// Animação de brilho visual
glow_timer = 0;