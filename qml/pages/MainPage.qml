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

    SilicaFlickable {
        anchors.fill: parent
        PullDownMenu {
            MenuItem {
                text: qsTr("Ok")
                onClicked: query()
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
                        text: qsTr("Verbs")
                        property variant words: {
                            'tāmā‘a': 'manger',
                        }
                    }
                    MenuItem {
                        text: qsTr("Vocabulary")
                        property variant words: {
                            'te ‘ohipa': 'le travail',
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
                            '‘ata‘ata': 'sourire',
                            'fārerei': '(se) rencontrer',
                            '‘oa‘oa': 'joie',
                            'māniania': 'bruyant',
                            'pūai': 'fort',
                            'rahi': 'grand (beaucoup)',
                            'iti': 'peu',
                            'pinepine': 'souvent',
                            'pō': 'nuit',
                            'taiete': 'société',
                            'te miti': 'la mer',
                            'te reva': 'le ciel',
                            'te tamari‘i': 'les enfants',
                            'te ma‘a': 'la nourriture',
                            'te pape': "l'eau",
                            'te vai': "l'eau",
                        }
                    }
                    MenuItem {
                        text: qsTr("Expressions #1")
                        property variant words: {
                            'Haere mai !': 'Viens !',
                            'Haere marū !': 'Va doucement !',
                            'Ha‘aviti !': 'Presse toi !',
                            'Hērū !': 'Attends !',
                            'Fiu !': 'Ras le bol !',
                            'Fa‘aitoito !': 'Courage !',
                            'Māniania !': 'Taisez vous !',
                            'Māmū !': 'Taisez vous !',
                            'E mea māniania !': "C'est bruyant !",
                            'E mea navenave !': "C'est agréable !",
                            'E mea ha‘amā !': 'Ça fait longtemps !',
                            'Eiaha e ha‘amā !': "N'ai pas honte !",
                            'E mea maita‘i !': "C'est bien !",
                            'E mea ‘ino !': "C'est mauvais !",
                            'E mea tano !': "C'est juste/vrai !",
                            'E mea hape !': "C'est faux !",
                            'E mea nehenehe !': "C'est magnifique !",
                            'E mea ha‘iri‘iri !': "C'est laid !",
                            'E mea no‘ano‘a !': 'Ça sent bon !',
                            'E mea ne‘on‘eo !': 'Ça pue !',
                            'E mea monamona !': 'Ça a bon goût !',
                            'E mea ‘ava‘ava !': 'Ça a mauvais goût !',
                            'E parau mau !': "C'est vrai !",
                            'E parau ha‘avare !': "C'est un mensonge !",
                            'A parau !': 'Parle !',
                            'Eiaha e parau !': 'Ne parle pas !',
                            'A fa‘aro‘o !': 'Écoute !',
                            'Eiaha e fa‘aro‘o !': "N'écoute pas !",
                            'A pāpa‘i !': 'Écris !',
                            'Eiaha e pāpa‘i !': "N'écris pas !",
                            'A inu !': 'Bois !',
                            'Eiaha e inu !': 'Ne bois pas !',
                        }
                    }
                    MenuItem {
                        text: qsTr("Vocabulary #2")
                        property variant words: {
                            'pūai': 'fort',
                            'manino': 'calme',
                            'mata‘i': 'beau (pour le temps)',
                            'tāpo‘ipo‘i': 'nuageux',
                            '‘ohie': 'facile',
                            'fifi': 'difficile',
                            'pa‘ari': 'dur',
                            'māniania': 'bruyant',
                            'ha‘uti': 'turbulent',
                            'va‘eva‘e': 'chaud',
                            'to‘eto‘e': 'froid',
                            'au': 'aimer (une chose)',
                            'monamona': 'savoureux',
                            'nehenehe': 'belle (pour une personne)',
                            '‘ata‘ata': 'souriant',
                            'tāere': 'lent',
                            'tere': 'marcher / fonctionner',
                            'pereo‘o': 'voiture',
                        }
                    }
                    MenuItem {
                        text: qsTr("Phrases #1")
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
                    MenuItem {
                        text: qsTr("Expressions #2")
                        property variant words: {
                            'Tāpiri mai !': 'Approche !',
                            'Fa‘aātea atu !': 'Dégage !',
                            'Ha‘amata !': 'Commence !',
                            'Fa‘aoti !': 'Termine !',
                            'Fa‘aea !': 'Arrête !',
                            'Tāmauā !': 'Continue !',
                            'Ua oti !': "C'est finit !",
                            'Ua hora !': "C'est l'heure !",
                            'Hupehupe !': 'Fainéant !',
                            'E mea itoito ‘oe !': 'Tu es courageux !',
                            'Ua po‘ipo‘i !': 'Il fait jour (6h-10h) !',
                            'Ua avatea !': 'Il est midi (10h-14h) !',
                            'Ua ahiahi !': "C'est le soir (17h-18h) !",
                            'Ua pō !': 'Il fait nuit !',
                            'E mea rū !': "C'est urgent !",
                            'E mea rū te ‘ohipa !': 'Le travail est urgent !',
                            'E mea tāere !': "C'est lent !",
                            'E mea tāere ‘oe !': 'Tu est lent !',
                            'E mea vitiviti !': "C'est rapide !",
                            'E mea vitiviti te pereo‘o !': 'La voiture est rapide !',
                            'E mea ‘ohie roa !': "C'est très facile !",
                            'E mea ‘ohie ri‘i !': "C'est un peu facile !",
                            'E mea fifi roa !': "C'est très difficile !",
                            'E mea fifi ri‘i !': "C'est un peu difficile !",
                            'E mea ‘arearea roa !': "C'est rigolo !",
                            'E mea pe‘ape‘a roa !': "C'est très inquiétant !",
                            'Ua hope te au !': "C'est excellent !",
                            'Ua monamona !': "C'est savoureux !",
                            'Aita atu ai te mā‘a !': 'Le repas est excellent !',
                            'Aita atu ai e mā‘a !': "Il n'y a plus rien à manger !",
                            'Ua ‘ite au !': 'Je sais !',
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
        }
    }
}
