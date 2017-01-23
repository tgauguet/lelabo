jQuery(function($) {
  $('#payment-form').submit(function(event) {
    var $form = $(this);

    $form.find('button').prop('disabled', false);

    Stripe.card.createToken($form, stripeResponseHandler);

    return false;
  });
});

var errorMessages = {
  incorrect_number: "Le numéro de la carte est incorrect.",
  invalid_number: "Le numéro de la carte n’est pas un numéro de carte valide.",
  invalid_expiry_month: "Le mois d’expiration de la carte n’est pas valide.",
  invalid_expiry_year: "L’année d’expiration de la carte n’est pas valide.",
  invalid_cvc: "Le code de sécurité de la carte n’est pas valide.",
  expired_card: "La carte a expiré.",
  incorrect_cvc: "Le code de sécurité de la carte est incorrect.",
  incorrect_zip: "La validation du code postal de la carte a échoué.",
  card_declined: "La carte a été refusée.",
  missing: "Aucun client associé à cette carte.",
  processing_error: "Une erreur est survenue lors du contrôle de la carte.",
  rate_limit:  "Une erreur est survenue en raison d'un trop grand nombre de requêtes vers le serveur. Veuillez nous contacter si vous rencontrez cette erreur systématiquement."
};


function stripeResponseHandler(status, response) {
  var $form = $('#payment-form');

  if (( response.error && response.error.type == 'card_error' ) || ( document.forms["fform"]["card-nb"].value === "")){
    $( '.errors' ).text( errorMessages[ response.error.code ] );
  }
  else {
    // response contains id and card, which contains additional card details
    var token = response.id;
    // Insert the token into the form so it gets submitted to the server
    $form.append($('<input type="hidden" name="stripeToken" />').val(token));
    // and submit
    $form.get(0).submit();
  }
};

// add space when entering credit card number
jQuery(function($) {
  $('[data-numeric]').payment('restrictNumeric');
  $('.cc-number').payment('formatCardNumber');
  $.fn.toggleInputError = function(erred) {
    this.parent('.form-group').toggleClass('has-error', erred);
    return this;
  };
});
