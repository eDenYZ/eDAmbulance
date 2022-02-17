local second = 1000
local minute = 60 * second

EarlyRespawnTimer          = 8 * minute  -- Temp de mort si les ambulancier sont pas venu

ConfigWebhookRendezVousAmbulance = "TONWEBHOOK" -- Metez le webhook de votre salon disocrd configure pour le job ems 

Config = {

	Locale                     = 'fr',

	RespawnPoint = { coords = vector3(352.79, -561.57, 28.79), heading = 162.79 }, -- L'endroit ou tu respawn apers la mort

	EarlyRespawnFine           = false, 
    EarlyRespawnFineAmount     = 5000, 

	RemoveWeaponsAfterRPDeath  = false, -- Supprime les arme sur sois 
    RemoveCashAfterRPDeath     = false, -- Supprime l'argent cash et sale sur sois 
    RemoveItemsAfterRPDeath    = false, -- Supprime tout les item sur sois 

    BleedoutTimer              = 10 * minute, -- Temp de l'effet quand tu respawn 

	ReviveReward               = 150,  -- Price du revive
    AntiCombatLog              = true, -- enable anti-combat logging?

    MarkerType = 22, -- Pour voir les différents type de marker: https://docs.fivem.net/docs/game-references/markers/
    MarkerSizeLargeur = 0.3, -- Largeur du marker
    MarkerSizeEpaisseur = 0.3, -- Épaisseur du marker
    MarkerSizeHauteur = 0.3, -- Hauteur du marker
    MarkerDistance = 6.0, -- Distane de visibiliter du marker (1.0 = 1 mètre)
    MarkerColorR = 69, -- Voir pour les couleurs RGB: https://www.google.com/search?q=html+color+picker&rlz=1C1GCEA_enFR965FR965&oq=html+color+&aqs=chrome.2.69i59j0i131i433i512j0i512l5j69i60.3367j0j7&sourceid=chrome&ie=UTF-8
    MarkerColorG = 112, -- Voir pour les couleurs RGB: https://www.google.com/search?q=html+color+picker&rlz=1C1GCEA_enFR965FR965&oq=html+color+&aqs=chrome.2.69i59j0i131i433i512j0i512l5j69i60.3367j0j7&sourceid=chrome&ie=UTF-8
    MarkerColorB = 246, -- Voir pour les couleurs RGB: https://www.google.com/search?q=html+color+picker&rlz=1C1GCEA_enFR965FR965&oq=html+color+&aqs=chrome.2.69i59j0i131i433i512j0i512l5j69i60.3367j0j7&sourceid=chrome&ie=UTF-8
    MarkerOpacite = 180, -- Opacité du marker (min: 0, max: 255)
    MarkerSaute = true, -- Si le marker saute (true = oui, false = non)
    MarkerTourne = true, -- Si le marker tourne (true = oui, false = non)

    TextCoffre = "Appuyez sur ~b~[E] ~s~pour accèder au ~b~coffre ~s~!",  -- Text Menu coffre
    TextPharmacie = "Appuyez sur ~b~[E] ~s~pour accèder a la ~b~pharmacie ~s~!",  -- Text Menu Pharamcie
    TextVestaire = "Appuyez sur ~b~[E] ~s~pour pour accèder au ~b~vestaire ~s~!", -- Text Menu Vestaire
    TextBoss = "Appuyez sur ~b~[E] ~s~pour pour accèder au ~b~action patron ~s~!",  -- Text Menu Boss
    TextGarageVehicule = "Appuyez sur ~b~[E] ~s~pour accèder au ~b~garage ~s~!",  -- Text Garage Voiture
	TextGarageHeli = "Appuyez sur ~b~[E] ~s~pour accèder au ~b~garage ~s~!",  -- Text Garage Hélico
	TextAscenseur = "Appuyez sur ~b~[E] ~s~pour accèder à ~b~l'étage ~s~!",  -- Text Ascenseur
    TextAccueil = "Appuyez sur ~b~[E] ~s~pour parler a la secrétaire ~s~!",  -- Text Ascenseur
	

AmbuVehiculesAmbulance = { 
	{buttoname = "Petite Ambulance", rightlabel = "→→", spawnname = "ambulance22", spawnzone = vector3(-454.36, -340.15, 34.36), headingspawn = 347.36}, -- Garage Voiture
	{buttoname = "Moyenne Ambulance", rightlabel = "→→", spawnname = "emsnspeedo", spawnzone = vector3(-454.36, -340.15, 34.36), headingspawn = 347.36}, -- Garage Voiture
	{buttoname = "Grande Ambulance", rightlabel = "→→", spawnname = "ambulance3", spawnzone = vector3(-454.36, -340.15, 34.36), headingspawn = 347.36}, -- Garage Voiture
},

AmbuHelicoAmbulance = { 
	{buttonameheli = "Hélicoptère", rightlabel = "→→", spawnnameheli = "supervolito", spawnzoneheli = vector3(-456.17, -291.46, 78.17), headingspawnheli = 22.00}, -- Garage Hélico
},


Pharmacie = {
    {Nom = "Medikit", Item = "medikit"}, -- Item Pour la Pharmacie
    {Nom = "Bandage", Item = "bandage"}, -- Item Pour la Pharmacie
},

Ascenseur = {
	vector3(-436.11, -360.62, 34.95), -- Etage 0 [Accueil]
	vector3(-493.61, -327.43, 42.31), -- Etage 1 [Direction]
    vector3(-439.77, -335.78, 78.3), -- Etage 2 [Héliport] 
},

Position = {
	    Boss = {vector3(-498.26, -315.48, 42.32)}, -- Menu boss 
	    Coffre = {vector3(-436.85, -318.45, 34.91)}, -- Menu coffre 
        Pharmacie = {vector3(-489.14, -340.32, 42.32)}, -- Menu Pharmacie 
        Vestaire = {vector3(-438.82, -308.67, 34.91)}, -- Menu Vestaire 
        Accueil = {vector3(-435.85, -325.87, 34.91)}, -- Menu Pour Accueil 
        GarageVehicule = {vector3(-454.36, -340.15, 34.36)}, -- Menu Garage Vehicule
	    GarageHeli = {vector3(-456.17, -291.46, 78.17)}, -- Menu Garage Helico
    }
}

AmbuCloak = {
	clothes = {
        specials = {
            [0] = {
                label = "Tenue Civil",
                minimum_grade = 0,
                variations = {male = {}, female = {}},
                onEquip = function()
                    ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin) TriggerEvent('skinchanger:loadSkin', skin) end)
                    SetPedArmour(PlayerPedId(), 0)
                end
            },
            [1] = {
                minimum_grade = 3,
                label = "Tenue de Directeur",
                variations = {
                male = {
                    tshirt_1 = 46,  tshirt_2 = 0,
                    torso_1 = 29,   torso_2 = 5,
                    decals_1 = 0,   decals_2 = 0,
                    arms = 6,
                    pants_1 = 8,   pants_2 = 14,
                    shoes_1 = 8,   shoes_2 = 0,
                    helmet_1 = -1,  helmet_2 = 0,
                    chain_1 = 34,    chain_2 = 2,
                    ears_1 = 0,     ears_2 = 0
                },
                female = {
                    tshirt_1 = 36,  tshirt_2 = 1,
                    torso_1 = 48,   torso_2 = 0,
                    decals_1 = 0,   decals_2 = 0,
                    arms = 44,
                    pants_1 = 34,   pants_2 = 0,
                    shoes_1 = 27,   shoes_2 = 0,
                    helmet_1 = 45,  helmet_2 = 0,
                    chain_1 = 0,    chain_2 = 0,
                    ears_1 = 2,     ears_2 = 0
                }
            },
            onEquip = function()  
            end
            }
        },
        grades = {
            -- @label = Le nom affiché de la tenue de grade
            -- @male = Les composants skinchanger pour les hommes
            -- @female = Les composants skinchanger pour les femmes
            [0] = {
                label = "Tenue d'Ambulancier",
                minimum_grade = 0,
                variations = {
                male = {
                    bags_1 = 0, bags_2 = 0,
                    tshirt_1 = 129, tshirt_2 = 0,
                    torso_1 = 75, torso_2 = 6,
                    arms = 86,
                    pants_1 = 33, pants_2 = 0,
                    shoes_1 = 25, shoes_2 = 0,
                    mask_1 = 0, mask_2 = 0,
                    bproof_1 = 14, bproof_2 = 0,
                    helmet_1 = -1, helmet_2 = 0,
                    chain_1 = 0, chain_2 = 0,
                    decals_1 = 0, decals_2 = 0,
                },
                female = {
                    bags_1 = 0, bags_2 = 0,
                    tshirt_1 = 129, tshirt_2 = 0,
                    torso_1 = 75, torso_2 = 6,
                    arms = 86,
                    pants_1 = 33, pants_2 = 0,
                    shoes_1 = 25, shoes_2 = 0,
                    mask_1 = 0, mask_2 = 0,
                    bproof_1 = 14, bproof_2 = 0,
                    helmet_1 = -1, helmet_2 = 0,
                    chain_1 = 0, chain_2 = 0,
                    decals_1 = 0, decals_2 = 0
                }
            },
            onEquip = function()
            end
        },
            [1] = {
                minimum_grade = 0,
                label = "Tenue Médecin",
                variations = {
                male = {
                    tshirt_1 = 59,  tshirt_2 = 1,
                    torso_1 = 55,   torso_2 = 0,
                    decals_1 = 0,   decals_2 = 0,
                    arms = 41,
                    pants_1 = 25,   pants_2 = 0,
                    shoes_1 = 25,   shoes_2 = 0,
                    helmet_1 = 46,  helmet_2 = 0,
                    chain_1 = 0,    chain_2 = 0,
                    ears_1 = 2,     ears_2 = 0
                },
                female = {
                    tshirt_1 = 36,  tshirt_2 = 1,
                    torso_1 = 48,   torso_2 = 0,
                    decals_1 = 0,   decals_2 = 0,
                    arms = 44,
                    pants_1 = 34,   pants_2 = 0,
                    shoes_1 = 27,   shoes_2 = 0,
                    helmet_1 = 45,  helmet_2 = 0,
                    chain_1 = 0,    chain_2 = 0,
                    ears_1 = 2,     ears_2 = 0
                }
            },
            onEquip = function()
                
            end
        },
    }
    }
}
