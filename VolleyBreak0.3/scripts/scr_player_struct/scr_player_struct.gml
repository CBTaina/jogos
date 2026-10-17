/// @function PlayerData(_id, _name, _role, _power, _precision, _stamina)
/// @description Estrutura base dos atletas da equipe escolar.
function PlayerData(_id, _name, _role, _power, _precision, _stamina) constructor {
    id_name        = _id;
    display_name   = _name;
    role           = _role;        // "Passador", "Levantador", "Atacante"
    power_stat     = _power;
    precision_stat = _precision;
    max_stamina    = _stamina;
    stamina        = _stamina;
    skin_index     = "default";
    
    // Função para recuperar stamina entre pontos
    static recover_stamina = function(_amount) {
        stamina = clamp(stamina + _amount, 0, max_stamina);
    };
    
    // Função para gastar stamina
    static use_stamina = function(_amount) {
        if (stamina >= _amount) {
            stamina -= _amount;
            return true;
        }
        return false;
    };
}