return {
-----------------------------------[   DEBUG [TRUE/FALSE]   ]-----------------------------------
    Debug = true,

-----------------------------------[   THRESHOLDS   ]-------------------------------------------
--- MAX: 1.0  //  MIN: 0.0(OFF) ---
    Thresholds = {
        {players = 10, npcDensity = 0.8, vehicleDensity = 0.7}, -- Up to 10 players
        {players = 20, npcDensity = 0.5, vehicleDensity = 0.4}, -- Up to 20 players
        {players = 30, npcDensity = 0.3, vehicleDensity = 0.2}, -- Up to 30 players
        {players = 50, npcDensity = 0.1, vehicleDensity = 0.1}  -- More than 30 players
    },

-----------------------------------[   UPDATE INTERVAL (IN SECONDS)   ]-----------------------------------
    UpdateInterval = 60
}