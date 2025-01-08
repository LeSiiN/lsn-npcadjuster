-----------------------------------[   VARIABLES   ]-----------------------------------
local sharedConfig       = require 'config.shared'
local currentPlayerCount = 0
local npcDensity         = 1.0
local vehicleDensity     = 1.0

-----------------------------------[   FUNCTIONS   ]-----------------------------------
local function debug(message)
    if sharedConfig.Debug then
        print(message)
    end
end

local function adjustDensity()
    currentPlayerCount         = GetNumberOfPlayers()

    for _, threshold in ipairs(sharedConfig.Thresholds) do
        if currentPlayerCount <= threshold.players then
            npcDensity         = threshold.npcDensity
            vehicleDensity     = threshold.vehicleDensity
            break
        end
    end

    debug("[DEBUG] Adjusted densities [ " ..currentPlayerCount.. " Players ]: NPC = " ..npcDensity.. ", Vehicles = " ..vehicleDensity)
end

-----------------------------------[   THREADS   ]-----------------------------------
Citizen.CreateThread(function()
    while true do
        adjustDensity()
        Wait(sharedConfig.UpdateInterval * 1000)
    end
end)

CreateThread(function()
    while true do
        SetParkedVehicleDensityMultiplierThisFrame(vehicleDensity)
        SetVehicleDensityMultiplierThisFrame(npcDensity)
        SetRandomVehicleDensityMultiplierThisFrame(vehicleDensity)
        SetPedDensityMultiplierThisFrame(npcDensity)
        SetScenarioPedDensityMultiplierThisFrame(npcDensity, npcDensity)
        Wait(0)
    end
end)