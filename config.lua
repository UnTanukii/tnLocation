LocationBlip = {
    name="Location", 
    color=4, 
    sprite=225, 
    scale=0.7,  
    coords={ x = -1034.4777832031, y = -2732.7250976563, z = 19.2, h = 146.87368774414065},
}

Spawn = {
    coords={ x = -1029.6636962891, y = -2731.1237792969, z = 20.139265060425, h = 235.26544189453128},
    primaryColor={ R=255, G=192, B=203 },
    secondaryColor={ R=255, G=192, B=203 },
    MaxSpeed = false, --false or a number
    Plate = "LOCATION",
    TpPlayerInVehicle = false --true or false
}

Vehicles = {
    {name="Faggio", model="faggio", price=500},
    {name="Panto", model="panto", price=600},
    {name="Blista", model="blista", price=750},
}

Notification = {
    Char = "CHAR_PEGASUS_DELIVERY",
    Name = "Location"
}

Ped = "s_m_y_sheriff_01" 
PedScenario = "WORLD_HUMAN_CLIPBOARD"