//--> Change your language here :
var config_language = 'en';

$(function () {
    switch (config_language) {
        case 'fr':
            $('#tr_suspect').html('NOM');
            $('#tr_wantedFor').html('RECHERCHÉS POUR');
            $('#tr_form').text('FORMULAIRE');
            $("#tr_fName").attr("type", "Prénom : ");
            $("#tr_lName").attr("type", "Nom : ");
            $("#tr_reason").attr("type", "Raison : ");
            $("#tr_idtarget").attr("type", "ID : ");

            $("#tr_fNameHolder").attr("placeholder", "Veuillez saisir le prénom de la personne...");
            $("#tr_lNameHolder").attr("placeholder", "Veuillez saisir le nom de la personne...");
            $("#tr_reasonHolder").attr("placeholder", "Veuillez saisir une raison...");
            $("#tr_targetHolder").attr("placeholder", "Veuillez saisir l'id du joueur concernant...");

            $('#tr_validate').html('Valider');
        break;

        case 'en':
            $('#tr_suspect').text('NAME');
            $('#tr_wantedFor').html('WANTED FOR');
            $('#tr_form').text('FORM');
            $("#tr_fName").attr("type", "First name : ");
            $("#tr_lName").attr("type", "Last name : ");
            $("#tr_reason").attr("type", "Reason : ");
            $("#tr_idtarget").attr("type", "ID : ");

            $("#tr_fNameHolder").attr("placeholder", "Type the first name here ...");
            $("#tr_lNameHolder").attr("placeholder", "Type the last name here ...");
            $("#tr_lNameHolder").attr("placeholder", "Type the last name here ...");
            $("#tr_reasonHolder").attr("placeholder", "Type the reason here ...");
            $("#tr_targetHolder").attr("placeholder", "Type the id of the target here ...");

            $('#tr_validate').html('Validate');
        break;
    };
})