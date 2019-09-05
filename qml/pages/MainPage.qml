import QtQuick 2.0
import Sailfish.Silica 1.0

import "../prototypes.js" as ArrayPrototype

Page {
    id: root
    allowedOrientations: Orientation.All

    function query() {
        var words = collection.currentItem.words.sample(wordCount.value)
        if (toggle.checked)
            words = words.swap()

        var keys = Object.keys(words)
        var values = []
        keys.forEach(function(e) {
            values.push({ 'word': words[e], 'translation': e })
        })

        var subject = keys.sample()

        if (pageStack.currentPage === root) {
            pageStack.push("SelectTranslation.qml", { subject: subject, words: values, rootWindow: root} , PageStackAction.Animated)
        } else {
            pageStack.replace("SelectTranslation.qml", { subject: subject, words: values, rootWindow: root} , PageStackAction.Animated)
        }
    }

    Column {
        width: parent.width

        PageHeader {
            title: "Reo Tahiti"
        }

        TextSwitch {
            id: toggle
            text: qsTr("Translate from French to Tahitian")
            description: qsTr("Display a word in French and multiple Tahitian words to choose from instead of the oposite.")
        }

        ComboBox {
            id: collection
            width: parent.width
            label: qsTr("Collection")

            menu: ContextMenu {
                MenuItem {
                    text: qsTr("Colors")
                    property variant words: {
                        '‘uo‘uo': 'blanc',
                        're‘are‘a': 'jaune',
                        '‘ute‘ute': 'rouge',
                        '‘ere‘ere': 'noir',
                        'rehu': 'gris',
                        'ninamu': 'bleu',
                        'matie': 'vert',
                    }
                }
                MenuItem {
                    text: qsTr("Digits")
                    property variant words: {
                        'aore': 'zéro',
                        'hō‘e': 'un',
                        'piti': 'deux',
                        'toru': 'trois',
                        'maha': 'quatre',
                        'pae': 'cinq',
                        'ono': 'six',
                        'hitu': 'sept',
                        'va‘u': 'huit',
                        'iva': 'neuf',
                    }
                }
                MenuItem {
                    text: qsTr("Fruits")
                    property variant words: {
                        'mei‘a': 'banane',
                        'pea': 'poire',
                        '‘anani': 'orange',
                        '‘apara': 'pomme',
                        'painapo': 'ananas',
                        'tāporo': 'citron',
                    }
                }
                MenuItem {
                    text: qsTr("Vocabulary")
                    property variant words: {
                        '‘ohipa': 'travail',
                        'manureva': 'avion',
                        'ha‘api‘ira‘a': 'leçon',
                        'no‘ano‘a': 'parfumé',
                        'nehenehe': 'beau',
                        'pūtē': 'poche',
                        'puta': 'livre',
                        'ta‘ata': 'personne, gens',
                        'para': 'mûr',
                        'pu‘u': 'vert (pas mûr)',
                        'mahana': 'jour',
                        'itoito': 'courage',
                        'nāmū': 'se taire',
                        'taere': 'lent',
                        '‘amu': 'manger',
                        'inu': 'boire',
                        '‘ite': 'savoir',
                        'taote': 'médecin',
                        'pi‘i': 'enseigner',
                        'mata': 'œil',
                        '‘ata‘ata': 'sourir',
                        'fārerei': '(se) rencontrer',
                        '‘oa‘oa': 'joie',
                        'māniania': 'bruyant',
                        'pūai': 'fort',
                        'rahi': 'grand (beaucoup)',
                        'iti': 'peu',
                    }
                }
                MenuItem {
                    text: qsTr("Expressions")
                    property variant words: {
                        '‘Ia ora na !': 'Bonjour !',
                        'Pārahi !': 'Au revoir !',
                        'Nana !': 'Au revoir !',
                        'E aha te huru ?': 'Comment ça va ?',
                        'Mea maita‘i ‘oe ?': 'Tu vas bien ?',
                        'Mea maita‘i !': 'Bien !',
                        'Mea maita‘i roa !': 'Très bien !',
                        'Mea maita‘i noa !': 'Toujours bien !',
                        'Mea maita‘i ri‘i !': 'Ça va un peu !',
                        'Te huru ā te huru !': 'Toujours pareil !',
                        'Aita e pe‘ape‘a !': 'Pas de souci !',
                        'Eiaha e ha‘ape‘ape‘a !': "Ne t'inquiète pas !",
                        'Māuruuru !': 'Merci !',
                        'Māuruuru maita‘i !': 'Merci bien !',
                        'Māuruuru roa !': 'Merci beaucoup !',
                        '‘Ia maita‘i ‘oe i teie mahana !': 'Bonne journée !',
                        '‘Ia maita‘i ‘oe i teie pō !': 'Bonne nuit !',
                        '‘Ia maita‘i tō ‘oe tere !': 'Bon voyage !',
                        '‘Ia ‘oa‘oa ‘oe i tō‘oe ‘oro‘a !': 'Heureuse fête !',
                        '‘Ia ‘oa‘oa ‘oe i te Noera !': 'Joyeux Noël',
                        '‘Ia ‘oa‘oa ‘oe i te matahiti apī !': 'Bonne et heureuse année !',
                        '‘Ia ‘oa‘oa ‘oe i teie mahana !': 'Passe une bonne journée !',
                    }
                }
            }
        }

        Label {
            x: Theme.horizontalPageMargin
            text: qsTr("Display items")
        }

        Slider {
            id: wordCount
            minimumValue: 2
            maximumValue: 10
            value: 4
            width: parent.width
            valueText: value
            stepSize: 1
        }

        Button {
            text: qsTr("Ok")

            onClicked: query()
            preferredWidth: Theme.buttonWidthMedium
            anchors.horizontalCenter: parent.horizontalCenter
        }
    }
}
