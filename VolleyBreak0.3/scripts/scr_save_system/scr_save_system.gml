#macro SAVE_FILE_NAME "volley_break_save.dat"

function create_default_save_data() {
    return {
        player_name: "Jogador",
        player_level: 1,
        player_xp: 0,
        coins: 100,
        
        // Sistema de Medalhas do Modo Temporada
        medals_bronze: 0,
        medals_silver: 0,
        medals_gold: 0,
        
        // Progresso do Modo Temporada
        // Tier 0: Bairro | 1: Municipal | 2: Estadual | 3: Regional | 4: Nacional | 5: Mundial | 6: Olimpíada
        season_tier: 0, 
        season_trophies: 0,
        sponsor_reputation: 100, // Afeta a renda de moedas por derrota/vitória
        
        // Coleção e Time
        chapter_unlocked: 1,
        team_roster: ["renan", "kaio", "leo"], // Personagens ativos (mínimo 6 para Temporada)
        unlocked_characters: ["renan", "kaio", "leo"],
        unlocked_skins: ["default"]
    };
}

function save_file_exists() {
    return file_exists(SAVE_FILE_NAME);
}

function save_game_data(_data_struct) {
    var _json_string = json_stringify(_data_struct);
    var _file = file_text_open_write(SAVE_FILE_NAME);
    file_text_write_string(_file, _json_string);
    file_text_close(_file);
    global.player_save = _data_struct;
}

function load_game_data() {
    if (save_file_exists()) {
        var _file = file_text_open_read(SAVE_FILE_NAME);
        var _json_string = file_text_read_string(_file);
        file_text_close(_file);
        global.player_save = json_parse(_json_string);
    } else {
        global.player_save = create_default_save_data();
    }
}

function delete_save_data() {
    if (file_exists(SAVE_FILE_NAME)) {
        file_delete(SAVE_FILE_NAME);
    }
    global.player_save = create_default_save_data();
    save_game_data(global.player_save);
}