// --- ESTADOS DO MENU INICIAL ---
enum TITLE_STATE {
    PRESS_ANY_KEY,
    MAIN_MENU,
    CONFIRM_NEW_GAME,
    INPUT_NAME
}

current_state = TITLE_STATE.PRESS_ANY_KEY;

// Carrega save de forma segura
load_game_data();
has_save = save_file_exists();

// Animação de brilho / piscar
blink_timer = 0;
blink_alpha = 1;

// Navegação do Menu Principal
menu_index = 0;
menu_options = has_save ? ["CONTINUAR", "NOVO JOGO", "SAIR"] : ["COMENÇAR A JOGAR", "SAIR"];

// Confirmação para apagar save
confirm_index = 1; // Padrão: 1 = NÃO

// Variáveis de perfil
player_nickname = "";
keyboard_string = "";

// Grid do Teclado Virtual (3 linhas x 10 colunas)
vk_layout = [
    ["Q","W","E","R","T","Y","U","I","O","P"],
    ["A","S","D","F","G","H","J","K","L","Ç"],
    ["Z","X","C","V","B","N","M","<"," ","OK"]
];
vk_grid_x = 0;
vk_grid_y = 0;