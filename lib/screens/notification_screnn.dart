import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:getwidget/components/list_tile/gf_list_tile.dart';

import '../widgets/my_flutter_app_icons.dart';



class NotificationScren extends StatefulWidget {
  const NotificationScren({super.key});

  @override
  State<NotificationScren> createState() => _NotificationScrenState();
}

class _NotificationScrenState extends State<NotificationScren> {
  @override
  Widget build(BuildContext context) {

    var blueViolet = Color(0xff5a55cd);


    return Scaffold(
      backgroundColor: const Color(0xffeff3fe),
      body: Column(
        children: [
          Expanded(
            child: Stack(children: [
              Container(
                margin: EdgeInsets.only(top: 0),
                padding: EdgeInsets.only(top: 25),
                height: MediaQuery.of(context).size.height,
                decoration: const BoxDecoration(
                  color: Color(0xff5a55cd),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(top: 5.0),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            icon: const Icon(
                              Icons.arrow_back_ios,
                              color: Color(0xffeff3fe),
                            ),
                          ),
                          const Text(
                            "Notifications",
                            style: TextStyle(
                              color: Color(0xffeff3fe),
                              fontSize: 20,
                            ),
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.more_vert,
                              color: Color(0xffeff3fe),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
               Positioned(
                top: 75,
                bottom: 50,
                left: 0,
                right: 0,
                child: Material(
                  elevation: 5,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(45),
                    topRight: Radius.circular(45),
                    bottomLeft: Radius.circular(45),
                    bottomRight: Radius.circular(45),
                  ),
                  child:   ListView.builder(
                    padding: EdgeInsets.only(bottom: 20, right: 10),
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemCount: 100,
                    itemBuilder: (BuildContext context, int index) {
                      return Slidable(
                        // Specify a key if the Slidable is dismissible.
                        key: UniqueKey(), // Ajouter une clé unique pour le Slidable

                        // The start action pane is the one at the left or the top side.
                        startActionPane: ActionPane(
                          motion: const ScrollMotion(),

                          dismissible: DismissiblePane(onDismissed: () {}),

                          children: [
                            SlidableAction(
                              padding: EdgeInsets.only(top: 18.0),
                              onPressed: (BuildContext context) async {
                                // Action à effectuer lorsque la première action est tapée
                                await showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      backgroundColor: Colors.yellow.withOpacity(0.8),
                                      title: const Text("Confirmation"),
                                      content: const Text(
                                          "Êtes-vous sur le point de rendre ce message nouveau, voulez-vous continuer ?"),
                                      actions: <Widget>[
                                        // Bouton pour annuler la suppression
                                        TextButton(
                                          onPressed: () {
                                            // Action à effectuer lorsque l'utilisateur annule la suppression
                                            // Fermer la boîte de dialogue avec la valeur false
                                            Navigator.of(context).pop(false);
                                          },
                                          child: const Text("Annuler"),
                                        ),
                                        // Bouton pour confirmer la suppression
                                        TextButton(
                                          onPressed: () async {
                                            // Confirmer la suppression

                                            // Fermer la boîte de dialogue avec la valeur true
                                            Navigator.of(context).pop(true);
                                          },
                                          child: const Text("Supprimer"),
                                        ),
                                      ],
                                    );
                                  },
                                );
                              },
                              backgroundColor: Color(0xFF0a84ff),
                              foregroundColor: Colors.white,
                              icon: CupertinoIcons.chat_bubble_fill,
                              label: '',
                            ),
                          ],
                        ),
                        endActionPane: ActionPane(
                          // A motion is a widget used to control how the pane animates.
                          motion: const ScrollMotion(),

                          // A pane can dismiss the Slidable.
                          dismissible: DismissiblePane(
                            onDismissed: () {
                              // Action à effectuer lorsque l'élément est glissé
                            },
                          ),

                          // All actions are defined in the children parameter.
                          children: [
                            // Première action
                            SlidableAction(
                              padding: EdgeInsets.only(top: 18.0),
                              onPressed: (BuildContext context) async {
                                // Action à effectuer lorsque la première action est tapée
                                await showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      backgroundColor: Colors.yellow.withOpacity(0.8),
                                      title: const Text("Confirmation"),
                                      content: const Text(
                                          "Êtes-vous sûr de vouloir déactiver la notification ?"),
                                      actions: <Widget>[
                                        // Bouton pour annuler la suppression
                                        TextButton(
                                          onPressed: () {
                                            // Action à effectuer lorsque l'utilisateur annule la suppression
                                            // Fermer la boîte de dialogue avec la valeur false
                                            Navigator.of(context).pop(false);
                                          },
                                          child: const Text("Annuler"),
                                        ),
                                        // Bouton pour confirmer la suppression
                                        TextButton(
                                          onPressed: () async {
                                            // Confirmer la suppression

                                            // Fermer la boîte de dialogue avec la valeur true
                                            Navigator.of(context).pop(true);
                                          },
                                          child: const Text("Supprimer"),
                                        ),
                                      ],
                                    );
                                  },
                                );
                              },
                              backgroundColor: Colors.amber,
                              foregroundColor: Colors.white,
                              icon: Icons.notifications_off,
                              label: '',
                            ),

                            // Deuxième action
                            SlidableAction(
                              padding: EdgeInsets.only(top: 10.0),
                              onPressed: (BuildContext context) async {
                                // Action à effectuer lorsque la deuxième action est tapée
                                await showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      backgroundColor: Colors.yellow.withOpacity(0.8),
                                      title: const Text("Confirmation"),
                                      content: const Text(
                                          "Êtes-vous sûr de vouloir supprimer cet élément ?"),
                                      actions: <Widget>[
                                        TextButton(
                                          onPressed: () => Navigator.of(context)
                                              .pop(false), // Annuler la suppression
                                          child: const Text("Annuler"),
                                        ),
                                        TextButton(
                                          onPressed: () {},
                                          child: const Text("Supprimer"),
                                        ),
                                      ],
                                    );
                                  },
                                );
                              },
                              backgroundColor: Color(0xFFff4439),
                              foregroundColor: Colors.white,
                              icon: CupertinoIcons.delete,
                              label: '',
                            ),
                          ],
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(top: 2.0, left: 8, bottom: 5),
                          child: Container(
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                border:
                                Border.all(color: blueViolet.withOpacity(0.3)),
                              ),
                              child: Container(
                                height: 75,
                                child: Center(
                                  child: ListTile(
                                    title: const Text(
                                      maxLines: 1,
                                      "Nouvelle Notification",
                                    ),
                                    subtitle: Text(
                                      "Contenu de cette notification contenu de cette notification Contenu de contenu de cette notificationcette notificatio",
                                      maxLines: 2,
                                      style: TextStyle(
                                          overflow: TextOverflow.ellipsis
                                      ),
                                    ),
                                    trailing: IconButton(
                                      onPressed: () {},
                                      icon: Icon(
                                        Icons.arrow_forward_ios_rounded,
                                        size: 30,
                                        color: Colors.yellow.withOpacity(0.7),
                                      ),
                                    ),
                                  ),
                                ),
                              )

                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ]),
          ),
        ],
      ),
    );

  }
}
