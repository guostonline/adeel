import 'package:get/get.dart';
import 'package:ship_me/Logics/Demande.dart';

Demande _controller = Get.put(Demande());

String fromTrueFalseToFr(bool tf) {
  if (tf) return "Oui";
  return "Non";
}

String sendByCategory(String category) {
  switch (category) {
    case 'Adeel Déménagement':
      return adeelDemenagement;
      break;
    case "Livraison Express des Colis":
      return livraisonExpress;
      break;
    case "Transport de Marchandises":
      return transportDeMarchandise;
      break;

    default:
      return null;
  }
}

String adeelDemenagement =
    """<h1>Nom : ${_controller.userName.value}</h1>\n <h2>Email : ${_controller.userEmail.value}</h2>\n 
                    <p>Téléphone : ${_controller.userTelephone.value} </p>\n
                  ----------------------------------------------------------------------------------------------------
                   <p> Categorie : ${_controller.categorie.value}.</p> \n
                  ----------------------------------------------------------------------------------------------------
                   <p> Ville de départ : ${_controller.localite.value} ----------> ${_controller.destination.value} </p>\n
                   <p> Date de : ${_controller.dateDesLe.value} ----------> ${_controller.dateJusqua.value}</p>
                   ---------------------------------------------------------------------------------------------------
                   <p> Nombre de salons : ${_controller.numberSalon.value}.</p>\n
                   <p> Chargement-Déchargement : ${fromTrueFalseToFr(_controller.chargeDecharge.value)} </p>\n
                   <p> Montage-Démontage : ${fromTrueFalseToFr(_controller.montageDementage.value)} </p>\n
                   <p> Besoin d'emballage : ${fromTrueFalseToFr(_controller.besoinEmbalage.value)} </p>\n
                  -----------------------------------------------------------------------------------------------------
                   <p> Besoin de facture : ${fromTrueFalseToFr(_controller.avecFacture.value)} </p>\n
                    """;
String livraisonExpress =
    """<h1>Nom : ${_controller.userName.value}</h1>\n <h2>Email : ${_controller.userEmail.value}</h2>\n 
                    <p>Téléphone : ${_controller.userTelephone.value} </p>\n
                  ----------------------------------------------------------------------------------------------------
                   <p> Categorie : ${_controller.categorie.value}.</p> \n
                  ----------------------------------------------------------------------------------------------------
                   <p> Ville de départ : ${_controller.localite.value} ----------> ${_controller.destination.value} </p>\n
                   <p> Date de : ${_controller.dateDesLe.value} ----------> ${_controller.dateJusqua.value}</p>
                   ---------------------------------------------------------------------------------------------------
                   <p> Nombre de produits : ${_controller.numberOfProduit.value.toString()}  Total Poids : ${_controller.totalweight.value.toString()} Kg </p>\n
                  -----------------------------------------------------------------------------------------------------
                   <p> Besoin de facture : ${fromTrueFalseToFr(_controller.avecFacture.value)} </p>\n
                    """;
String transportDeMarchandise =
    """<h1>Nom : ${_controller.userName.value}</h1>\n <h2>Email : ${_controller.userEmail.value}</h2>\n 
                    <p>Téléphone : ${_controller.userTelephone.value} </p>\n
                  ----------------------------------------------------------------------------------------------------
                   <p> Categorie : ${_controller.categorie.value}.</p> \n
                  ----------------------------------------------------------------------------------------------------
                   <p> Ville de départ : ${_controller.localite.value} ----------> ${_controller.destination.value} </p>\n
                   <p> Date de : ${_controller.dateDesLe.value} ----------> ${_controller.dateJusqua.value}</p>
                   ---------------------------------------------------------------------------------------------------
                  <p> Nombre de produits : ${_controller.numberOfProduit.value}. Total Poids : ${_controller.totalweight.value}. </p>\n

                   <p> Chargement-Déchargement : ${fromTrueFalseToFr(_controller.chargeDecharge.value)} </p>\n
                  -----------------------------------------------------------------------------------------------------
                   <p> Besoin de facture : ${fromTrueFalseToFr(_controller.avecFacture.value)} </p>\n
                    """;

String test = _controller.numberOfProduit.value.toString();
