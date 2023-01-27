repeat task.wait() until game:GetService("Workspace")["_waves_started"].Value == true
local expectedWave
local expectedMoney
local expectedTimeSinceLastCommand
local deviation = 0
local unitPositions = {}
local positionToUpgrade = {}
local positionToSell = {}
local positionToActivate = {}
getgenv().timeOfLastCommand = os.clock()
getgenv().macroStartTime = os.clock()

local function getUpgradeCost(unitId, currentUpgrade)
    return require((game.ReplicatedStorage.src.Data:FindFirstChild("Units", true)))[unitId]["upgrade"][currentUpgrade]["cost"]
end

local function getPlacementCost(unitId)
    return require((game.ReplicatedStorage.src.Data:FindFirstChild("Units", true)))[unitId]["cost"]
end

local function updateUnitPositions()
    unitPositions = {}
    
    for i, v in ipairs(game.Workspace["_UNITS"]:GetChildren()) do
        if v:FindFirstChild("_stats") then
            if tostring(v["_stats"].player.Value) == game.Players.LocalPlayer.Name and v["_stats"].xp.Value >= 0 then
                table.insert(unitPositions, {v, v._hitbox.CFrame.X, v._hitbox.CFrame.Z})
            end
        end
    end
end

local function printValueDeviations()
    print("Expected Wave:                    " .. expectedWave .. "(got " .. game.Workspace["_wave_num"].Value .. ")")
    print("Expected Money:                   " .. expectedMoney .. "(got " .. tostring(game.Players.LocalPlayer._stats.resource.Value) .. ")")
    print("Expected Time Since Last Command: " .. expectedTimeSinceLastCommand .. "(got " .. tostring(os.clock() - getgenv().timeOfLastCommand) .. ")")
    print("Deviation:                        " .. deviation)
end

--Start Spawn Command
repeat task.wait() until (game.Workspace["_wave_num"].Value >= 2 and os.clock() - getgenv().macroStartTime >= 15.189423800009536 - deviation and game.Players.LocalPlayer._stats.resource.Value >= 4517.47753485)

deviation = tostring(os.clock() - getgenv().macroStartTime) - 15.190572299994528
expectedWave = 2
expectedMoney = 4517.47753485
expectedTimeSinceLastCommand = 15.19249950000085

printValueDeviations()

print("Attempting to spawn unit: {cfc75d37-6f20-4e8c-8817-b479be72999a}")
game:GetService("ReplicatedStorage").endpoints.client_to_server.spawn_unit:InvokeServer("{cfc75d37-6f20-4e8c-8817-b479be72999a}",CFrame.new(Vector3.new(-353.8562316894531, 1, -532.7299194335938), Vector3.new(0, 0, -1)))
updateUnitPositions()
getgenv().timeOfLastCommand = os.clock()
--End Spawn Command


--Start Spawn Command
repeat task.wait() until (game.Workspace["_wave_num"].Value >= 2 and os.clock() - getgenv().macroStartTime >= 16.254399299999932 - deviation and game.Players.LocalPlayer._stats.resource.Value >= 3967.4775348499998)

deviation = tostring(os.clock() - getgenv().macroStartTime) - 16.255704700015485
expectedWave = 2
expectedMoney = 3967.4775348499998
expectedTimeSinceLastCommand = 1.0584548999904655

printValueDeviations()

print("Attempting to spawn unit: {cfc75d37-6f20-4e8c-8817-b479be72999a}")
game:GetService("ReplicatedStorage").endpoints.client_to_server.spawn_unit:InvokeServer("{cfc75d37-6f20-4e8c-8817-b479be72999a}",CFrame.new(Vector3.new(-357.3047180175781, 0.9999997615814209, -531.8944702148438), Vector3.new(0, 0, -1)))
updateUnitPositions()
getgenv().timeOfLastCommand = os.clock()
--End Spawn Command


--Start Spawn Command
repeat task.wait() until (game.Workspace["_wave_num"].Value >= 2 and os.clock() - getgenv().macroStartTime >= 17.445884300017497 - deviation and game.Players.LocalPlayer._stats.resource.Value >= 3417.4775348499998)

deviation = tostring(os.clock() - getgenv().macroStartTime) - 17.44734939999762
expectedWave = 2
expectedMoney = 3417.4775348499998
expectedTimeSinceLastCommand = 1.1847672000003513

printValueDeviations()

print("Attempting to spawn unit: {cfc75d37-6f20-4e8c-8817-b479be72999a}")
game:GetService("ReplicatedStorage").endpoints.client_to_server.spawn_unit:InvokeServer("{cfc75d37-6f20-4e8c-8817-b479be72999a}",CFrame.new(Vector3.new(-361.5539855957031, 1, -532.878173828125), Vector3.new(0, 0, -1)))
updateUnitPositions()
getgenv().timeOfLastCommand = os.clock()
--End Spawn Command


--Start Spawn Command
repeat task.wait() until (game.Workspace["_wave_num"].Value >= 2 and os.clock() - getgenv().macroStartTime >= 23.190391800017096 - deviation and game.Players.LocalPlayer._stats.resource.Value >= 2867.4775348499998)

deviation = tostring(os.clock() - getgenv().macroStartTime) - 23.191835100005846
expectedWave = 2
expectedMoney = 2867.4775348499998
expectedTimeSinceLastCommand = 5.736595800000941

printValueDeviations()

print("Attempting to spawn unit: {4847c30f-2dbd-41df-8afd-d36f329a8404}")
game:GetService("ReplicatedStorage").endpoints.client_to_server.spawn_unit:InvokeServer("{4847c30f-2dbd-41df-8afd-d36f329a8404}",CFrame.new(Vector3.new(-357.75042724609375, 1, -538.8425903320312), Vector3.new(0, 0, -1)))
updateUnitPositions()
getgenv().timeOfLastCommand = os.clock()
--End Spawn Command


--Start Upgrade Command
repeat task.wait() until (game.Workspace["_wave_num"].Value >= 2 and os.clock() - getgenv().macroStartTime >= 24.622613300016383 - deviation and game.Players.LocalPlayer._stats.resource.Value >= 2067.4775348499998)

deviation = tostring(os.clock() - getgenv().macroStartTime) - 24.623969800013583
expectedWave = 2
expectedMoney = 2067.4775348499998
expectedTimeSinceLastCommand = 1.42530619999161

printValueDeviations()

updateUnitPositions()

positionToUpgrade = {-357.75042724609375, -538.8425903320312}

for _, unit in pairs(unitPositions) do
    if math.abs(unit[2] - positionToUpgrade[1]) <= 0.01 and math.abs(unit[3] - positionToUpgrade[2]) <= 0.01 then
        print("Attempting to upgrade unit: " .. unit[1]["Name"] .. " from " .. tostring(unit[1]["_stats"]["upgrade"].Value) ..  " to " .. tostring(unit[1]["_stats"]["upgrade"].Value + 1))
        game:GetService("ReplicatedStorage").endpoints.client_to_server.upgrade_unit_ingame:InvokeServer(unit[1])
    end
end
getgenv().timeOfLastCommand = os.clock()
--End Upgrade Command


--Start Upgrade Command
repeat task.wait() until (game.Workspace["_wave_num"].Value >= 3 and os.clock() - getgenv().macroStartTime >= 41.048666000016965 - deviation and game.Players.LocalPlayer._stats.resource.Value >= 5990.9550696999995)

deviation = tostring(os.clock() - getgenv().macroStartTime) - 41.049818800005596
expectedWave = 3
expectedMoney = 5990.9550696999995
expectedTimeSinceLastCommand = 16.415112100017723

printValueDeviations()

updateUnitPositions()

positionToUpgrade = {-353.8562316894531, -532.7299194335938}

for _, unit in pairs(unitPositions) do
    if math.abs(unit[2] - positionToUpgrade[1]) <= 0.01 and math.abs(unit[3] - positionToUpgrade[2]) <= 0.01 then
        print("Attempting to upgrade unit: " .. unit[1]["Name"] .. " from " .. tostring(unit[1]["_stats"]["upgrade"].Value) ..  " to " .. tostring(unit[1]["_stats"]["upgrade"].Value + 1))
        game:GetService("ReplicatedStorage").endpoints.client_to_server.upgrade_unit_ingame:InvokeServer(unit[1])
    end
end
getgenv().timeOfLastCommand = os.clock()
--End Upgrade Command


--Start Upgrade Command
repeat task.wait() until (game.Workspace["_wave_num"].Value >= 3 and os.clock() - getgenv().macroStartTime >= 42.21721410000464 - deviation and game.Players.LocalPlayer._stats.resource.Value >= 4990.9550696999995)

deviation = tostring(os.clock() - getgenv().macroStartTime) - 42.21860690001631
expectedWave = 3
expectedMoney = 4990.9550696999995
expectedTimeSinceLastCommand = 1.1602653000154532

printValueDeviations()

updateUnitPositions()

positionToUpgrade = {-357.3047180175781, -531.8944702148438}

for _, unit in pairs(unitPositions) do
    if math.abs(unit[2] - positionToUpgrade[1]) <= 0.01 and math.abs(unit[3] - positionToUpgrade[2]) <= 0.01 then
        print("Attempting to upgrade unit: " .. unit[1]["Name"] .. " from " .. tostring(unit[1]["_stats"]["upgrade"].Value) ..  " to " .. tostring(unit[1]["_stats"]["upgrade"].Value + 1))
        game:GetService("ReplicatedStorage").endpoints.client_to_server.upgrade_unit_ingame:InvokeServer(unit[1])
    end
end
getgenv().timeOfLastCommand = os.clock()
--End Upgrade Command


--Start Upgrade Command
repeat task.wait() until (game.Workspace["_wave_num"].Value >= 3 and os.clock() - getgenv().macroStartTime >= 43.57753650000086 - deviation and game.Players.LocalPlayer._stats.resource.Value >= 3990.9550696999995)

deviation = tostring(os.clock() - getgenv().macroStartTime) - 43.578536799992435
expectedWave = 3
expectedMoney = 3990.9550696999995
expectedTimeSinceLastCommand = 1.349392700009048

printValueDeviations()

updateUnitPositions()

positionToUpgrade = {-361.5539855957031, -532.878173828125}

for _, unit in pairs(unitPositions) do
    if math.abs(unit[2] - positionToUpgrade[1]) <= 0.01 and math.abs(unit[3] - positionToUpgrade[2]) <= 0.01 then
        print("Attempting to upgrade unit: " .. unit[1]["Name"] .. " from " .. tostring(unit[1]["_stats"]["upgrade"].Value) ..  " to " .. tostring(unit[1]["_stats"]["upgrade"].Value + 1))
        game:GetService("ReplicatedStorage").endpoints.client_to_server.upgrade_unit_ingame:InvokeServer(unit[1])
    end
end
getgenv().timeOfLastCommand = os.clock()
--End Upgrade Command


--Start Upgrade Command
repeat task.wait() until (game.Workspace["_wave_num"].Value >= 3 and os.clock() - getgenv().macroStartTime >= 48.8925463000196 - deviation and game.Players.LocalPlayer._stats.resource.Value >= 2990.9550696999995)

deviation = tostring(os.clock() - getgenv().macroStartTime) - 48.89384269999573
expectedWave = 3
expectedMoney = 2990.9550696999995
expectedTimeSinceLastCommand = 5.305043400003342

printValueDeviations()

updateUnitPositions()

positionToUpgrade = {-353.8562316894531, -532.7299194335938}

for _, unit in pairs(unitPositions) do
    if math.abs(unit[2] - positionToUpgrade[1]) <= 0.01 and math.abs(unit[3] - positionToUpgrade[2]) <= 0.01 then
        print("Attempting to upgrade unit: " .. unit[1]["Name"] .. " from " .. tostring(unit[1]["_stats"]["upgrade"].Value) ..  " to " .. tostring(unit[1]["_stats"]["upgrade"].Value + 1))
        game:GetService("ReplicatedStorage").endpoints.client_to_server.upgrade_unit_ingame:InvokeServer(unit[1])
    end
end
getgenv().timeOfLastCommand = os.clock()
--End Upgrade Command


--Start Upgrade Command
repeat task.wait() until (game.Workspace["_wave_num"].Value >= 3 and os.clock() - getgenv().macroStartTime >= 52.852777699998114 - deviation and game.Players.LocalPlayer._stats.resource.Value >= 7908.432604549999)

deviation = tostring(os.clock() - getgenv().macroStartTime) - 52.854159900016384
expectedWave = 3
expectedMoney = 7908.432604549999
expectedTimeSinceLastCommand = 3.9502605000161566

printValueDeviations()

updateUnitPositions()

positionToUpgrade = {-353.8562316894531, -532.7299194335938}

for _, unit in pairs(unitPositions) do
    if math.abs(unit[2] - positionToUpgrade[1]) <= 0.01 and math.abs(unit[3] - positionToUpgrade[2]) <= 0.01 then
        print("Attempting to upgrade unit: " .. unit[1]["Name"] .. " from " .. tostring(unit[1]["_stats"]["upgrade"].Value) ..  " to " .. tostring(unit[1]["_stats"]["upgrade"].Value + 1))
        game:GetService("ReplicatedStorage").endpoints.client_to_server.upgrade_unit_ingame:InvokeServer(unit[1])
    end
end
getgenv().timeOfLastCommand = os.clock()
--End Upgrade Command


--Start Upgrade Command
repeat task.wait() until (game.Workspace["_wave_num"].Value >= 3 and os.clock() - getgenv().macroStartTime >= 54.12434270000085 - deviation and game.Players.LocalPlayer._stats.resource.Value >= 5408.432604549999)

deviation = tostring(os.clock() - getgenv().macroStartTime) - 54.125337600009516
expectedWave = 3
expectedMoney = 5408.432604549999
expectedTimeSinceLastCommand = 1.2610096000134945

printValueDeviations()

updateUnitPositions()

positionToUpgrade = {-361.5539855957031, -532.878173828125}

for _, unit in pairs(unitPositions) do
    if math.abs(unit[2] - positionToUpgrade[1]) <= 0.01 and math.abs(unit[3] - positionToUpgrade[2]) <= 0.01 then
        print("Attempting to upgrade unit: " .. unit[1]["Name"] .. " from " .. tostring(unit[1]["_stats"]["upgrade"].Value) ..  " to " .. tostring(unit[1]["_stats"]["upgrade"].Value + 1))
        game:GetService("ReplicatedStorage").endpoints.client_to_server.upgrade_unit_ingame:InvokeServer(unit[1])
    end
end
getgenv().timeOfLastCommand = os.clock()
--End Upgrade Command


--Start Upgrade Command
repeat task.wait() until (game.Workspace["_wave_num"].Value >= 3 and os.clock() - getgenv().macroStartTime >= 56.22368120000465 - deviation and game.Players.LocalPlayer._stats.resource.Value >= 3827.4326045499993)

deviation = tostring(os.clock() - getgenv().macroStartTime) - 56.22498640001868
expectedWave = 3
expectedMoney = 3827.4326045499993
expectedTimeSinceLastCommand = 2.0905805000220425

printValueDeviations()

updateUnitPositions()

positionToUpgrade = {-361.5539855957031, -532.878173828125}

for _, unit in pairs(unitPositions) do
    if math.abs(unit[2] - positionToUpgrade[1]) <= 0.01 and math.abs(unit[3] - positionToUpgrade[2]) <= 0.01 then
        print("Attempting to upgrade unit: " .. unit[1]["Name"] .. " from " .. tostring(unit[1]["_stats"]["upgrade"].Value) ..  " to " .. tostring(unit[1]["_stats"]["upgrade"].Value + 1))
        game:GetService("ReplicatedStorage").endpoints.client_to_server.upgrade_unit_ingame:InvokeServer(unit[1])
    end
end
getgenv().timeOfLastCommand = os.clock()
--End Upgrade Command


--Start Upgrade Command
repeat task.wait() until (game.Workspace["_wave_num"].Value >= 4 and os.clock() - getgenv().macroStartTime >= 73.83652179999626 - deviation and game.Players.LocalPlayer._stats.resource.Value >= 10209.910139399999)

deviation = tostring(os.clock() - getgenv().macroStartTime) - 73.83799590001581
expectedWave = 4
expectedMoney = 10209.910139399999
expectedTimeSinceLastCommand = 17.60484839999117

printValueDeviations()

updateUnitPositions()

positionToUpgrade = {-361.5539855957031, -532.878173828125}

for _, unit in pairs(unitPositions) do
    if math.abs(unit[2] - positionToUpgrade[1]) <= 0.01 and math.abs(unit[3] - positionToUpgrade[2]) <= 0.01 then
        print("Attempting to upgrade unit: " .. unit[1]["Name"] .. " from " .. tostring(unit[1]["_stats"]["upgrade"].Value) ..  " to " .. tostring(unit[1]["_stats"]["upgrade"].Value + 1))
        game:GetService("ReplicatedStorage").endpoints.client_to_server.upgrade_unit_ingame:InvokeServer(unit[1])
    end
end
getgenv().timeOfLastCommand = os.clock()
--End Upgrade Command


--Start Upgrade Command
repeat task.wait() until (game.Workspace["_wave_num"].Value >= 4 and os.clock() - getgenv().macroStartTime >= 75.73918299999787 - deviation and game.Players.LocalPlayer._stats.resource.Value >= 7209.910139399999)

deviation = tostring(os.clock() - getgenv().macroStartTime) - 75.74029340001289
expectedWave = 4
expectedMoney = 7209.910139399999
expectedTimeSinceLastCommand = 1.8887917999818455

printValueDeviations()

updateUnitPositions()

positionToUpgrade = {-357.3047180175781, -531.8944702148438}

for _, unit in pairs(unitPositions) do
    if math.abs(unit[2] - positionToUpgrade[1]) <= 0.01 and math.abs(unit[3] - positionToUpgrade[2]) <= 0.01 then
        print("Attempting to upgrade unit: " .. unit[1]["Name"] .. " from " .. tostring(unit[1]["_stats"]["upgrade"].Value) ..  " to " .. tostring(unit[1]["_stats"]["upgrade"].Value + 1))
        game:GetService("ReplicatedStorage").endpoints.client_to_server.upgrade_unit_ingame:InvokeServer(unit[1])
    end
end
getgenv().timeOfLastCommand = os.clock()
--End Upgrade Command


--Start Upgrade Command
repeat task.wait() until (game.Workspace["_wave_num"].Value >= 5 and os.clock() - getgenv().macroStartTime >= 78.4729961999983 - deviation and game.Players.LocalPlayer._stats.resource.Value >= 5695.910139399999)

deviation = tostring(os.clock() - getgenv().macroStartTime) - 78.47413810002035
expectedWave = 5
expectedMoney = 5695.910139399999
expectedTimeSinceLastCommand = 2.7252102000056766

printValueDeviations()

updateUnitPositions()

positionToUpgrade = {-357.3047180175781, -531.8944702148438}

for _, unit in pairs(unitPositions) do
    if math.abs(unit[2] - positionToUpgrade[1]) <= 0.01 and math.abs(unit[3] - positionToUpgrade[2]) <= 0.01 then
        print("Attempting to upgrade unit: " .. unit[1]["Name"] .. " from " .. tostring(unit[1]["_stats"]["upgrade"].Value) ..  " to " .. tostring(unit[1]["_stats"]["upgrade"].Value + 1))
        game:GetService("ReplicatedStorage").endpoints.client_to_server.upgrade_unit_ingame:InvokeServer(unit[1])
    end
end
getgenv().timeOfLastCommand = os.clock()
--End Upgrade Command


--Start Upgrade Command
repeat task.wait() until (game.Workspace["_wave_num"].Value >= 5 and os.clock() - getgenv().macroStartTime >= 79.03634670001338 - deviation and game.Players.LocalPlayer._stats.resource.Value >= 3195.910139399999)

deviation = tostring(os.clock() - getgenv().macroStartTime) - 79.03739750001114
expectedWave = 5
expectedMoney = 3195.910139399999
expectedTimeSinceLastCommand = 0.5541656999848783

printValueDeviations()

updateUnitPositions()

positionToUpgrade = {-357.3047180175781, -531.8944702148438}

for _, unit in pairs(unitPositions) do
    if math.abs(unit[2] - positionToUpgrade[1]) <= 0.01 and math.abs(unit[3] - positionToUpgrade[2]) <= 0.01 then
        print("Attempting to upgrade unit: " .. unit[1]["Name"] .. " from " .. tostring(unit[1]["_stats"]["upgrade"].Value) ..  " to " .. tostring(unit[1]["_stats"]["upgrade"].Value + 1))
        game:GetService("ReplicatedStorage").endpoints.client_to_server.upgrade_unit_ingame:InvokeServer(unit[1])
    end
end
getgenv().timeOfLastCommand = os.clock()
--End Upgrade Command


--Start Upgrade Command
repeat task.wait() until (game.Workspace["_wave_num"].Value >= 6 and os.clock() - getgenv().macroStartTime >= 99.62913509999635 - deviation and game.Players.LocalPlayer._stats.resource.Value >= 11937.38767425)

deviation = tostring(os.clock() - getgenv().macroStartTime) - 99.6305299999949
expectedWave = 6
expectedMoney = 11937.38767425
expectedTimeSinceLastCommand = 20.584781500016106

printValueDeviations()

updateUnitPositions()

positionToUpgrade = {-357.75042724609375, -538.8425903320312}

for _, unit in pairs(unitPositions) do
    if math.abs(unit[2] - positionToUpgrade[1]) <= 0.01 and math.abs(unit[3] - positionToUpgrade[2]) <= 0.01 then
        print("Attempting to upgrade unit: " .. unit[1]["Name"] .. " from " .. tostring(unit[1]["_stats"]["upgrade"].Value) ..  " to " .. tostring(unit[1]["_stats"]["upgrade"].Value + 1))
        game:GetService("ReplicatedStorage").endpoints.client_to_server.upgrade_unit_ingame:InvokeServer(unit[1])
    end
end
getgenv().timeOfLastCommand = os.clock()
--End Upgrade Command


--Start Upgrade Command
repeat task.wait() until (game.Workspace["_wave_num"].Value >= 6 and os.clock() - getgenv().macroStartTime >= 100.06934059999185 - deviation and game.Players.LocalPlayer._stats.resource.Value >= 8937.38767425)

deviation = tostring(os.clock() - getgenv().macroStartTime) - 100.07053910000832
expectedWave = 6
expectedMoney = 8937.38767425
expectedTimeSinceLastCommand = 0.43091979998280294

printValueDeviations()

updateUnitPositions()

positionToUpgrade = {-357.75042724609375, -538.8425903320312}

for _, unit in pairs(unitPositions) do
    if math.abs(unit[2] - positionToUpgrade[1]) <= 0.01 and math.abs(unit[3] - positionToUpgrade[2]) <= 0.01 then
        print("Attempting to upgrade unit: " .. unit[1]["Name"] .. " from " .. tostring(unit[1]["_stats"]["upgrade"].Value) ..  " to " .. tostring(unit[1]["_stats"]["upgrade"].Value + 1))
        game:GetService("ReplicatedStorage").endpoints.client_to_server.upgrade_unit_ingame:InvokeServer(unit[1])
    end
end
getgenv().timeOfLastCommand = os.clock()
--End Upgrade Command


--Start Upgrade Command
repeat task.wait() until (game.Workspace["_wave_num"].Value >= 6 and os.clock() - getgenv().macroStartTime >= 103.85504409999703 - deviation and game.Players.LocalPlayer._stats.resource.Value >= 4437.38767425)

deviation = tostring(os.clock() - getgenv().macroStartTime) - 103.85619980000774
expectedWave = 6
expectedMoney = 4437.38767425
expectedTimeSinceLastCommand = 3.777145300002303

printValueDeviations()

updateUnitPositions()

positionToUpgrade = {-353.8562316894531, -532.7299194335938}

for _, unit in pairs(unitPositions) do
    if math.abs(unit[2] - positionToUpgrade[1]) <= 0.01 and math.abs(unit[3] - positionToUpgrade[2]) <= 0.01 then
        print("Attempting to upgrade unit: " .. unit[1]["Name"] .. " from " .. tostring(unit[1]["_stats"]["upgrade"].Value) ..  " to " .. tostring(unit[1]["_stats"]["upgrade"].Value + 1))
        game:GetService("ReplicatedStorage").endpoints.client_to_server.upgrade_unit_ingame:InvokeServer(unit[1])
    end
end
getgenv().timeOfLastCommand = os.clock()
--End Upgrade Command


--Start Spawn Command
repeat task.wait() until (game.Workspace["_wave_num"].Value >= 7 and os.clock() - getgenv().macroStartTime >= 142.414291699999 - deviation and game.Players.LocalPlayer._stats.resource.Value >= 16624.8652091)

deviation = tostring(os.clock() - getgenv().macroStartTime) - 142.41536330000963
expectedWave = 7
expectedMoney = 16624.8652091
expectedTimeSinceLastCommand = 38.54924170000595

printValueDeviations()

print("Attempting to spawn unit: {fee07a12-dc03-4493-aa73-455f061ffd0e}")
game:GetService("ReplicatedStorage").endpoints.client_to_server.spawn_unit:InvokeServer("{fee07a12-dc03-4493-aa73-455f061ffd0e}",CFrame.new(Vector3.new(-289.2087707519531, 1.0000014305114746, -572.0425415039062), Vector3.new(0, 0, -1)))
updateUnitPositions()
getgenv().timeOfLastCommand = os.clock()
--End Spawn Command


--Start Spawn Command
repeat task.wait() until (game.Workspace["_wave_num"].Value >= 7 and os.clock() - getgenv().macroStartTime >= 146.4993800999946 - deviation and game.Players.LocalPlayer._stats.resource.Value >= 15426.8652091)

deviation = tostring(os.clock() - getgenv().macroStartTime) - 146.50060600001598
expectedWave = 7
expectedMoney = 15426.8652091
expectedTimeSinceLastCommand = 4.08109780002269

printValueDeviations()

print("Attempting to spawn unit: {44ab972b-13e5-4796-9a4e-c48523720cd1}")
game:GetService("ReplicatedStorage").endpoints.client_to_server.spawn_unit:InvokeServer("{44ab972b-13e5-4796-9a4e-c48523720cd1}",CFrame.new(Vector3.new(-298.9858093261719, 12.780887603759766, -566.171875), Vector3.new(0, 0, -1)))
updateUnitPositions()
getgenv().timeOfLastCommand = os.clock()
--End Spawn Command


--Start Upgrade Command
repeat task.wait() until (game.Workspace["_wave_num"].Value >= 7 and os.clock() - getgenv().macroStartTime >= 147.94209530000808 - deviation and game.Players.LocalPlayer._stats.resource.Value >= 13926.8652091)

deviation = tostring(os.clock() - getgenv().macroStartTime) - 147.94359800001257
expectedWave = 7
expectedMoney = 13926.8652091
expectedTimeSinceLastCommand = 1.4359638000023551

printValueDeviations()

updateUnitPositions()

positionToUpgrade = {-298.9858093261719, -566.171875}

for _, unit in pairs(unitPositions) do
    if math.abs(unit[2] - positionToUpgrade[1]) <= 0.01 and math.abs(unit[3] - positionToUpgrade[2]) <= 0.01 then
        print("Attempting to upgrade unit: " .. unit[1]["Name"] .. " from " .. tostring(unit[1]["_stats"]["upgrade"].Value) ..  " to " .. tostring(unit[1]["_stats"]["upgrade"].Value + 1))
        game:GetService("ReplicatedStorage").endpoints.client_to_server.upgrade_unit_ingame:InvokeServer(unit[1])
    end
end
getgenv().timeOfLastCommand = os.clock()
--End Upgrade Command


--Start Upgrade Command
repeat task.wait() until (game.Workspace["_wave_num"].Value >= 7 and os.clock() - getgenv().macroStartTime >= 148.0936878999928 - deviation and game.Players.LocalPlayer._stats.resource.Value >= 11976.8652091)

deviation = tostring(os.clock() - getgenv().macroStartTime) - 148.0950506000081
expectedWave = 7
expectedMoney = 11976.8652091
expectedTimeSinceLastCommand = 0.13965070000267588

printValueDeviations()

updateUnitPositions()

positionToUpgrade = {-298.9858093261719, -566.171875}

for _, unit in pairs(unitPositions) do
    if math.abs(unit[2] - positionToUpgrade[1]) <= 0.01 and math.abs(unit[3] - positionToUpgrade[2]) <= 0.01 then
        print("Attempting to upgrade unit: " .. unit[1]["Name"] .. " from " .. tostring(unit[1]["_stats"]["upgrade"].Value) ..  " to " .. tostring(unit[1]["_stats"]["upgrade"].Value + 1))
        game:GetService("ReplicatedStorage").endpoints.client_to_server.upgrade_unit_ingame:InvokeServer(unit[1])
    end
end
getgenv().timeOfLastCommand = os.clock()
--End Upgrade Command


--Start Upgrade Command
repeat task.wait() until (game.Workspace["_wave_num"].Value >= 7 and os.clock() - getgenv().macroStartTime >= 148.2127574000042 - deviation and game.Players.LocalPlayer._stats.resource.Value >= 11976.8652091)

deviation = tostring(os.clock() - getgenv().macroStartTime) - 148.21392510001897
expectedWave = 7
expectedMoney = 11976.8652091
expectedTimeSinceLastCommand = 0.11019959999248385

printValueDeviations()

updateUnitPositions()

positionToUpgrade = {-298.9858093261719, -566.171875}

for _, unit in pairs(unitPositions) do
    if math.abs(unit[2] - positionToUpgrade[1]) <= 0.01 and math.abs(unit[3] - positionToUpgrade[2]) <= 0.01 then
        print("Attempting to upgrade unit: " .. unit[1]["Name"] .. " from " .. tostring(unit[1]["_stats"]["upgrade"].Value) ..  " to " .. tostring(unit[1]["_stats"]["upgrade"].Value + 1))
        game:GetService("ReplicatedStorage").endpoints.client_to_server.upgrade_unit_ingame:InvokeServer(unit[1])
    end
end
getgenv().timeOfLastCommand = os.clock()
--End Upgrade Command


--Start Upgrade Command
repeat task.wait() until (game.Workspace["_wave_num"].Value >= 7 and os.clock() - getgenv().macroStartTime >= 148.38560740000685 - deviation and game.Players.LocalPlayer._stats.resource.Value >= 6226.8652091)

deviation = tostring(os.clock() - getgenv().macroStartTime) - 148.38688480001292
expectedWave = 7
expectedMoney = 6226.8652091
expectedTimeSinceLastCommand = 0.16493780000018887

printValueDeviations()

updateUnitPositions()

positionToUpgrade = {-298.9858093261719, -566.171875}

for _, unit in pairs(unitPositions) do
    if math.abs(unit[2] - positionToUpgrade[1]) <= 0.01 and math.abs(unit[3] - positionToUpgrade[2]) <= 0.01 then
        print("Attempting to upgrade unit: " .. unit[1]["Name"] .. " from " .. tostring(unit[1]["_stats"]["upgrade"].Value) ..  " to " .. tostring(unit[1]["_stats"]["upgrade"].Value + 1))
        game:GetService("ReplicatedStorage").endpoints.client_to_server.upgrade_unit_ingame:InvokeServer(unit[1])
    end
end
getgenv().timeOfLastCommand = os.clock()
--End Upgrade Command


--Start Upgrade Command
repeat task.wait() until (game.Workspace["_wave_num"].Value >= 7 and os.clock() - getgenv().macroStartTime >= 148.49392880001687 - deviation and game.Players.LocalPlayer._stats.resource.Value >= 6226.8652091)

deviation = tostring(os.clock() - getgenv().macroStartTime) - 148.49508670001524
expectedWave = 7
expectedMoney = 6226.8652091
expectedTimeSinceLastCommand = 0.09983329998794943

printValueDeviations()

updateUnitPositions()

positionToUpgrade = {-298.9858093261719, -566.171875}

for _, unit in pairs(unitPositions) do
    if math.abs(unit[2] - positionToUpgrade[1]) <= 0.01 and math.abs(unit[3] - positionToUpgrade[2]) <= 0.01 then
        print("Attempting to upgrade unit: " .. unit[1]["Name"] .. " from " .. tostring(unit[1]["_stats"]["upgrade"].Value) ..  " to " .. tostring(unit[1]["_stats"]["upgrade"].Value + 1))
        game:GetService("ReplicatedStorage").endpoints.client_to_server.upgrade_unit_ingame:InvokeServer(unit[1])
    end
end
getgenv().timeOfLastCommand = os.clock()
--End Upgrade Command


--Start Upgrade Command
repeat task.wait() until (game.Workspace["_wave_num"].Value >= 7 and os.clock() - getgenv().macroStartTime >= 148.63364980000188 - deviation and game.Players.LocalPlayer._stats.resource.Value >= 1476.8652091000004)

deviation = tostring(os.clock() - getgenv().macroStartTime) - 148.63583410001593
expectedWave = 7
expectedMoney = 1476.8652091000004
expectedTimeSinceLastCommand = 0.13180999999167398

printValueDeviations()

updateUnitPositions()

positionToUpgrade = {-298.9858093261719, -566.171875}

for _, unit in pairs(unitPositions) do
    if math.abs(unit[2] - positionToUpgrade[1]) <= 0.01 and math.abs(unit[3] - positionToUpgrade[2]) <= 0.01 then
        print("Attempting to upgrade unit: " .. unit[1]["Name"] .. " from " .. tostring(unit[1]["_stats"]["upgrade"].Value) ..  " to " .. tostring(unit[1]["_stats"]["upgrade"].Value + 1))
        game:GetService("ReplicatedStorage").endpoints.client_to_server.upgrade_unit_ingame:InvokeServer(unit[1])
    end
end
getgenv().timeOfLastCommand = os.clock()
--End Upgrade Command


--Start Upgrade Command
repeat task.wait() until (game.Workspace["_wave_num"].Value >= 8 and os.clock() - getgenv().macroStartTime >= 171.939145500015 - deviation and game.Players.LocalPlayer._stats.resource.Value >= 16866.34274395)

deviation = tostring(os.clock() - getgenv().macroStartTime) - 171.9406694000063
expectedWave = 8
expectedMoney = 16866.34274395
expectedTimeSinceLastCommand = 23.295046899991576

printValueDeviations()

updateUnitPositions()

positionToUpgrade = {-357.75042724609375, -538.8425903320312}

for _, unit in pairs(unitPositions) do
    if math.abs(unit[2] - positionToUpgrade[1]) <= 0.01 and math.abs(unit[3] - positionToUpgrade[2]) <= 0.01 then
        print("Attempting to upgrade unit: " .. unit[1]["Name"] .. " from " .. tostring(unit[1]["_stats"]["upgrade"].Value) ..  " to " .. tostring(unit[1]["_stats"]["upgrade"].Value + 1))
        game:GetService("ReplicatedStorage").endpoints.client_to_server.upgrade_unit_ingame:InvokeServer(unit[1])
    end
end
getgenv().timeOfLastCommand = os.clock()
--End Upgrade Command


--Start Upgrade Command
repeat task.wait() until (game.Workspace["_wave_num"].Value >= 9 and os.clock() - getgenv().macroStartTime >= 209.6090058000118 - deviation and game.Players.LocalPlayer._stats.resource.Value >= 27355.8202788)

deviation = tostring(os.clock() - getgenv().macroStartTime) - 209.61015849999967
expectedWave = 9
expectedMoney = 27355.8202788
expectedTimeSinceLastCommand = 37.659637199976714

printValueDeviations()

updateUnitPositions()

positionToUpgrade = {-357.75042724609375, -538.8425903320312}

for _, unit in pairs(unitPositions) do
    if math.abs(unit[2] - positionToUpgrade[1]) <= 0.01 and math.abs(unit[3] - positionToUpgrade[2]) <= 0.01 then
        print("Attempting to upgrade unit: " .. unit[1]["Name"] .. " from " .. tostring(unit[1]["_stats"]["upgrade"].Value) ..  " to " .. tostring(unit[1]["_stats"]["upgrade"].Value + 1))
        game:GetService("ReplicatedStorage").endpoints.client_to_server.upgrade_unit_ingame:InvokeServer(unit[1])
    end
end
getgenv().timeOfLastCommand = os.clock()
--End Upgrade Command


--Start Upgrade Command
repeat task.wait() until (game.Workspace["_wave_num"].Value >= 9 and os.clock() - getgenv().macroStartTime >= 210.55005390002043 - deviation and game.Players.LocalPlayer._stats.resource.Value >= 17355.8202788)

deviation = tostring(os.clock() - getgenv().macroStartTime) - 210.55165700000362
expectedWave = 9
expectedMoney = 17355.8202788
expectedTimeSinceLastCommand = 0.932449700019788

printValueDeviations()

updateUnitPositions()

positionToUpgrade = {-357.75042724609375, -538.8425903320312}

for _, unit in pairs(unitPositions) do
    if math.abs(unit[2] - positionToUpgrade[1]) <= 0.01 and math.abs(unit[3] - positionToUpgrade[2]) <= 0.01 then
        print("Attempting to upgrade unit: " .. unit[1]["Name"] .. " from " .. tostring(unit[1]["_stats"]["upgrade"].Value) ..  " to " .. tostring(unit[1]["_stats"]["upgrade"].Value + 1))
        game:GetService("ReplicatedStorage").endpoints.client_to_server.upgrade_unit_ingame:InvokeServer(unit[1])
    end
end
getgenv().timeOfLastCommand = os.clock()
--End Upgrade Command


--Start Upgrade Command
repeat task.wait() until (game.Workspace["_wave_num"].Value >= 9 and os.clock() - getgenv().macroStartTime >= 242.7135050999932 - deviation and game.Players.LocalPlayer._stats.resource.Value >= 27048.297813650002)

deviation = tostring(os.clock() - getgenv().macroStartTime) - 242.71451220000745
expectedWave = 9
expectedMoney = 27048.297813650002
expectedTimeSinceLastCommand = 32.15298889999394

printValueDeviations()

updateUnitPositions()

positionToUpgrade = {-289.2087707519531, -572.0425415039062}

for _, unit in pairs(unitPositions) do
    if math.abs(unit[2] - positionToUpgrade[1]) <= 0.01 and math.abs(unit[3] - positionToUpgrade[2]) <= 0.01 then
        print("Attempting to upgrade unit: " .. unit[1]["Name"] .. " from " .. tostring(unit[1]["_stats"]["upgrade"].Value) ..  " to " .. tostring(unit[1]["_stats"]["upgrade"].Value + 1))
        game:GetService("ReplicatedStorage").endpoints.client_to_server.upgrade_unit_ingame:InvokeServer(unit[1])
    end
end
getgenv().timeOfLastCommand = os.clock()
--End Upgrade Command


--Start Upgrade Command
repeat task.wait() until (game.Workspace["_wave_num"].Value >= 9 and os.clock() - getgenv().macroStartTime >= 242.8621170000115 - deviation and game.Players.LocalPlayer._stats.resource.Value >= 27048.297813650002)

deviation = tostring(os.clock() - getgenv().macroStartTime) - 242.8633850000042
expectedWave = 9
expectedMoney = 27048.297813650002
expectedTimeSinceLastCommand = 0.14016799998353235

printValueDeviations()

updateUnitPositions()

positionToUpgrade = {-289.2087707519531, -572.0425415039062}

for _, unit in pairs(unitPositions) do
    if math.abs(unit[2] - positionToUpgrade[1]) <= 0.01 and math.abs(unit[3] - positionToUpgrade[2]) <= 0.01 then
        print("Attempting to upgrade unit: " .. unit[1]["Name"] .. " from " .. tostring(unit[1]["_stats"]["upgrade"].Value) ..  " to " .. tostring(unit[1]["_stats"]["upgrade"].Value + 1))
        game:GetService("ReplicatedStorage").endpoints.client_to_server.upgrade_unit_ingame:InvokeServer(unit[1])
    end
end
getgenv().timeOfLastCommand = os.clock()
--End Upgrade Command


--Start Upgrade Command
repeat task.wait() until (game.Workspace["_wave_num"].Value >= 9 and os.clock() - getgenv().macroStartTime >= 242.99051190001774 - deviation and game.Players.LocalPlayer._stats.resource.Value >= 24948.297813650002)

deviation = tostring(os.clock() - getgenv().macroStartTime) - 242.99179410000215
expectedWave = 9
expectedMoney = 24948.297813650002
expectedTimeSinceLastCommand = 0.11802890000399202

printValueDeviations()

updateUnitPositions()

positionToUpgrade = {-289.2087707519531, -572.0425415039062}

for _, unit in pairs(unitPositions) do
    if math.abs(unit[2] - positionToUpgrade[1]) <= 0.01 and math.abs(unit[3] - positionToUpgrade[2]) <= 0.01 then
        print("Attempting to upgrade unit: " .. unit[1]["Name"] .. " from " .. tostring(unit[1]["_stats"]["upgrade"].Value) ..  " to " .. tostring(unit[1]["_stats"]["upgrade"].Value + 1))
        game:GetService("ReplicatedStorage").endpoints.client_to_server.upgrade_unit_ingame:InvokeServer(unit[1])
    end
end
getgenv().timeOfLastCommand = os.clock()
--End Upgrade Command


--Start Upgrade Command
repeat task.wait() until (game.Workspace["_wave_num"].Value >= 9 and os.clock() - getgenv().macroStartTime >= 243.14198760001455 - deviation and game.Players.LocalPlayer._stats.resource.Value >= 18648.297813650002)

deviation = tostring(os.clock() - getgenv().macroStartTime) - 243.14309369999683
expectedWave = 9
expectedMoney = 18648.297813650002
expectedTimeSinceLastCommand = 0.1430959000135772

printValueDeviations()

updateUnitPositions()

positionToUpgrade = {-289.2087707519531, -572.0425415039062}

for _, unit in pairs(unitPositions) do
    if math.abs(unit[2] - positionToUpgrade[1]) <= 0.01 and math.abs(unit[3] - positionToUpgrade[2]) <= 0.01 then
        print("Attempting to upgrade unit: " .. unit[1]["Name"] .. " from " .. tostring(unit[1]["_stats"]["upgrade"].Value) ..  " to " .. tostring(unit[1]["_stats"]["upgrade"].Value + 1))
        game:GetService("ReplicatedStorage").endpoints.client_to_server.upgrade_unit_ingame:InvokeServer(unit[1])
    end
end
getgenv().timeOfLastCommand = os.clock()
--End Upgrade Command


--Start Upgrade Command
repeat task.wait() until (game.Workspace["_wave_num"].Value >= 9 and os.clock() - getgenv().macroStartTime >= 243.2887973000179 - deviation and game.Players.LocalPlayer._stats.resource.Value >= 14648.297813650002)

deviation = tostring(os.clock() - getgenv().macroStartTime) - 243.29010370001197
expectedWave = 9
expectedMoney = 14648.297813650002
expectedTimeSinceLastCommand = 0.13831219999701716

printValueDeviations()

updateUnitPositions()

positionToUpgrade = {-289.2087707519531, -572.0425415039062}

for _, unit in pairs(unitPositions) do
    if math.abs(unit[2] - positionToUpgrade[1]) <= 0.01 and math.abs(unit[3] - positionToUpgrade[2]) <= 0.01 then
        print("Attempting to upgrade unit: " .. unit[1]["Name"] .. " from " .. tostring(unit[1]["_stats"]["upgrade"].Value) ..  " to " .. tostring(unit[1]["_stats"]["upgrade"].Value + 1))
        game:GetService("ReplicatedStorage").endpoints.client_to_server.upgrade_unit_ingame:InvokeServer(unit[1])
    end
end
getgenv().timeOfLastCommand = os.clock()
--End Upgrade Command


--Start Upgrade Command
repeat task.wait() until (game.Workspace["_wave_num"].Value >= 10 and os.clock() - getgenv().macroStartTime >= 244.36876450001728 - deviation and game.Players.LocalPlayer._stats.resource.Value >= 9148.297813650002)

deviation = tostring(os.clock() - getgenv().macroStartTime) - 244.36981130001368
expectedWave = 10
expectedMoney = 9148.297813650002
expectedTimeSinceLastCommand = 1.0694420000072569

printValueDeviations()

updateUnitPositions()

positionToUpgrade = {-289.2087707519531, -572.0425415039062}

for _, unit in pairs(unitPositions) do
    if math.abs(unit[2] - positionToUpgrade[1]) <= 0.01 and math.abs(unit[3] - positionToUpgrade[2]) <= 0.01 then
        print("Attempting to upgrade unit: " .. unit[1]["Name"] .. " from " .. tostring(unit[1]["_stats"]["upgrade"].Value) ..  " to " .. tostring(unit[1]["_stats"]["upgrade"].Value + 1))
        game:GetService("ReplicatedStorage").endpoints.client_to_server.upgrade_unit_ingame:InvokeServer(unit[1])
    end
end
getgenv().timeOfLastCommand = os.clock()
--End Upgrade Command


--Start Spawn Command
repeat task.wait() until (game.Workspace["_wave_num"].Value >= 11 and os.clock() - getgenv().macroStartTime >= 282.1945798000088 - deviation and game.Players.LocalPlayer._stats.resource.Value >= 25690.775348500003)

deviation = tostring(os.clock() - getgenv().macroStartTime) - 282.19592319999356
expectedWave = 11
expectedMoney = 25690.775348500003
expectedTimeSinceLastCommand = 37.81787820000318

printValueDeviations()

print("Attempting to spawn unit: {44ab972b-13e5-4796-9a4e-c48523720cd1}")
game:GetService("ReplicatedStorage").endpoints.client_to_server.spawn_unit:InvokeServer("{44ab972b-13e5-4796-9a4e-c48523720cd1}",CFrame.new(Vector3.new(-373.0122375488281, 12.272951126098633, -613.7689208984375), Vector3.new(0, 0, -1)))
updateUnitPositions()
getgenv().timeOfLastCommand = os.clock()
--End Spawn Command


--Start Upgrade Command
repeat task.wait() until (game.Workspace["_wave_num"].Value >= 11 and os.clock() - getgenv().macroStartTime >= 283.1966876999941 - deviation and game.Players.LocalPlayer._stats.resource.Value >= 24269.775348500003)

deviation = tostring(os.clock() - getgenv().macroStartTime) - 283.1980872999993
expectedWave = 11
expectedMoney = 24269.775348500003
expectedTimeSinceLastCommand = 0.9949905000103172

printValueDeviations()

updateUnitPositions()

positionToUpgrade = {-373.0122375488281, -613.7689208984375}

for _, unit in pairs(unitPositions) do
    if math.abs(unit[2] - positionToUpgrade[1]) <= 0.01 and math.abs(unit[3] - positionToUpgrade[2]) <= 0.01 then
        print("Attempting to upgrade unit: " .. unit[1]["Name"] .. " from " .. tostring(unit[1]["_stats"]["upgrade"].Value) ..  " to " .. tostring(unit[1]["_stats"]["upgrade"].Value + 1))
        game:GetService("ReplicatedStorage").endpoints.client_to_server.upgrade_unit_ingame:InvokeServer(unit[1])
    end
end
getgenv().timeOfLastCommand = os.clock()
--End Upgrade Command


--Start Upgrade Command
repeat task.wait() until (game.Workspace["_wave_num"].Value >= 11 and os.clock() - getgenv().macroStartTime >= 283.5534580000094 - deviation and game.Players.LocalPlayer._stats.resource.Value >= 22319.775348500003)

deviation = tostring(os.clock() - getgenv().macroStartTime) - 283.55493139999453
expectedWave = 11
expectedMoney = 22319.775348500003
expectedTimeSinceLastCommand = 0.34749980000196956

printValueDeviations()

updateUnitPositions()

positionToUpgrade = {-373.0122375488281, -613.7689208984375}

for _, unit in pairs(unitPositions) do
    if math.abs(unit[2] - positionToUpgrade[1]) <= 0.01 and math.abs(unit[3] - positionToUpgrade[2]) <= 0.01 then
        print("Attempting to upgrade unit: " .. unit[1]["Name"] .. " from " .. tostring(unit[1]["_stats"]["upgrade"].Value) ..  " to " .. tostring(unit[1]["_stats"]["upgrade"].Value + 1))
        game:GetService("ReplicatedStorage").endpoints.client_to_server.upgrade_unit_ingame:InvokeServer(unit[1])
    end
end
getgenv().timeOfLastCommand = os.clock()
--End Upgrade Command


--Start Upgrade Command
repeat task.wait() until (game.Workspace["_wave_num"].Value >= 11 and os.clock() - getgenv().macroStartTime >= 283.8826047000184 - deviation and game.Players.LocalPlayer._stats.resource.Value >= 19819.775348500003)

deviation = tostring(os.clock() - getgenv().macroStartTime) - 283.8836433000106
expectedWave = 11
expectedMoney = 19819.775348500003
expectedTimeSinceLastCommand = 0.31805739999981597

printValueDeviations()

updateUnitPositions()

positionToUpgrade = {-373.0122375488281, -613.7689208984375}

for _, unit in pairs(unitPositions) do
    if math.abs(unit[2] - positionToUpgrade[1]) <= 0.01 and math.abs(unit[3] - positionToUpgrade[2]) <= 0.01 then
        print("Attempting to upgrade unit: " .. unit[1]["Name"] .. " from " .. tostring(unit[1]["_stats"]["upgrade"].Value) ..  " to " .. tostring(unit[1]["_stats"]["upgrade"].Value + 1))
        game:GetService("ReplicatedStorage").endpoints.client_to_server.upgrade_unit_ingame:InvokeServer(unit[1])
    end
end
getgenv().timeOfLastCommand = os.clock()
--End Upgrade Command


--Start Upgrade Command
repeat task.wait() until (game.Workspace["_wave_num"].Value >= 11 and os.clock() - getgenv().macroStartTime >= 284.25959319999674 - deviation and game.Players.LocalPlayer._stats.resource.Value >= 16569.775348500003)

deviation = tostring(os.clock() - getgenv().macroStartTime) - 284.2608419000171
expectedWave = 11
expectedMoney = 16569.775348500003
expectedTimeSinceLastCommand = 0.36935059999814257

printValueDeviations()

updateUnitPositions()

positionToUpgrade = {-373.0122375488281, -613.7689208984375}

for _, unit in pairs(unitPositions) do
    if math.abs(unit[2] - positionToUpgrade[1]) <= 0.01 and math.abs(unit[3] - positionToUpgrade[2]) <= 0.01 then
        print("Attempting to upgrade unit: " .. unit[1]["Name"] .. " from " .. tostring(unit[1]["_stats"]["upgrade"].Value) ..  " to " .. tostring(unit[1]["_stats"]["upgrade"].Value + 1))
        game:GetService("ReplicatedStorage").endpoints.client_to_server.upgrade_unit_ingame:InvokeServer(unit[1])
    end
end
getgenv().timeOfLastCommand = os.clock()
--End Upgrade Command


--Start Upgrade Command
repeat task.wait() until (game.Workspace["_wave_num"].Value >= 11 and os.clock() - getgenv().macroStartTime >= 284.65966219999245 - deviation and game.Players.LocalPlayer._stats.resource.Value >= 11819.775348500003)

deviation = tostring(os.clock() - getgenv().macroStartTime) - 284.6608897999977
expectedWave = 11
expectedMoney = 11819.775348500003
expectedTimeSinceLastCommand = 0.39024349997635

printValueDeviations()

updateUnitPositions()

positionToUpgrade = {-373.0122375488281, -613.7689208984375}

for _, unit in pairs(unitPositions) do
    if math.abs(unit[2] - positionToUpgrade[1]) <= 0.01 and math.abs(unit[3] - positionToUpgrade[2]) <= 0.01 then
        print("Attempting to upgrade unit: " .. unit[1]["Name"] .. " from " .. tostring(unit[1]["_stats"]["upgrade"].Value) ..  " to " .. tostring(unit[1]["_stats"]["upgrade"].Value + 1))
        game:GetService("ReplicatedStorage").endpoints.client_to_server.upgrade_unit_ingame:InvokeServer(unit[1])
    end
end
getgenv().timeOfLastCommand = os.clock()
--End Upgrade Command


--Start Upgrade Command
repeat task.wait() until (game.Workspace["_wave_num"].Value >= 12 and os.clock() - getgenv().macroStartTime >= 325.0878192000091 - deviation and game.Players.LocalPlayer._stats.resource.Value >= 30826.252883350004)

deviation = tostring(os.clock() - getgenv().macroStartTime) - 325.0888794999919
expectedWave = 12
expectedMoney = 30826.252883350004
expectedTimeSinceLastCommand = 40.418783600005554

printValueDeviations()

updateUnitPositions()

positionToUpgrade = {-289.2087707519531, -572.0425415039062}

for _, unit in pairs(unitPositions) do
    if math.abs(unit[2] - positionToUpgrade[1]) <= 0.01 and math.abs(unit[3] - positionToUpgrade[2]) <= 0.01 then
        print("Attempting to upgrade unit: " .. unit[1]["Name"] .. " from " .. tostring(unit[1]["_stats"]["upgrade"].Value) ..  " to " .. tostring(unit[1]["_stats"]["upgrade"].Value + 1))
        game:GetService("ReplicatedStorage").endpoints.client_to_server.upgrade_unit_ingame:InvokeServer(unit[1])
    end
end
getgenv().timeOfLastCommand = os.clock()
--End Upgrade Command


--Start Upgrade Command
repeat task.wait() until (game.Workspace["_wave_num"].Value >= 12 and os.clock() - getgenv().macroStartTime >= 325.70013559999643 - deviation and game.Players.LocalPlayer._stats.resource.Value >= 22326.252883350004)

deviation = tostring(os.clock() - getgenv().macroStartTime) - 325.70158490000176
expectedWave = 12
expectedMoney = 22326.252883350004
expectedTimeSinceLastCommand = 0.6055235000094399

printValueDeviations()

updateUnitPositions()

positionToUpgrade = {-289.2087707519531, -572.0425415039062}

for _, unit in pairs(unitPositions) do
    if math.abs(unit[2] - positionToUpgrade[1]) <= 0.01 and math.abs(unit[3] - positionToUpgrade[2]) <= 0.01 then
        print("Attempting to upgrade unit: " .. unit[1]["Name"] .. " from " .. tostring(unit[1]["_stats"]["upgrade"].Value) ..  " to " .. tostring(unit[1]["_stats"]["upgrade"].Value + 1))
        game:GetService("ReplicatedStorage").endpoints.client_to_server.upgrade_unit_ingame:InvokeServer(unit[1])
    end
end
getgenv().timeOfLastCommand = os.clock()
--End Upgrade Command


--Start Upgrade Command
repeat task.wait() until (game.Workspace["_wave_num"].Value >= 12 and os.clock() - getgenv().macroStartTime >= 326.44540660001803 - deviation and game.Players.LocalPlayer._stats.resource.Value >= 11700.252883350004)

deviation = tostring(os.clock() - getgenv().macroStartTime) - 326.4465247000044
expectedWave = 12
expectedMoney = 11700.252883350004
expectedTimeSinceLastCommand = 0.732572099979734

printValueDeviations()

updateUnitPositions()

positionToUpgrade = {-289.2087707519531, -572.0425415039062}

for _, unit in pairs(unitPositions) do
    if math.abs(unit[2] - positionToUpgrade[1]) <= 0.01 and math.abs(unit[3] - positionToUpgrade[2]) <= 0.01 then
        print("Attempting to upgrade unit: " .. unit[1]["Name"] .. " from " .. tostring(unit[1]["_stats"]["upgrade"].Value) ..  " to " .. tostring(unit[1]["_stats"]["upgrade"].Value + 1))
        game:GetService("ReplicatedStorage").endpoints.client_to_server.upgrade_unit_ingame:InvokeServer(unit[1])
    end
end
getgenv().timeOfLastCommand = os.clock()
--End Upgrade Command


--Start Upgrade Command
repeat task.wait() until (game.Workspace["_wave_num"].Value >= 12 and os.clock() - getgenv().macroStartTime >= 363.67408600001363 - deviation and game.Players.LocalPlayer._stats.resource.Value >= 36143.73041820001)

deviation = tostring(os.clock() - getgenv().macroStartTime) - 363.6752853000071
expectedWave = 12
expectedMoney = 36143.73041820001
expectedTimeSinceLastCommand = 37.221011299989186

printValueDeviations()

updateUnitPositions()

positionToUpgrade = {-289.2087707519531, -572.0425415039062}

for _, unit in pairs(unitPositions) do
    if math.abs(unit[2] - positionToUpgrade[1]) <= 0.01 and math.abs(unit[3] - positionToUpgrade[2]) <= 0.01 then
        print("Attempting to upgrade unit: " .. unit[1]["Name"] .. " from " .. tostring(unit[1]["_stats"]["upgrade"].Value) ..  " to " .. tostring(unit[1]["_stats"]["upgrade"].Value + 1))
        game:GetService("ReplicatedStorage").endpoints.client_to_server.upgrade_unit_ingame:InvokeServer(unit[1])
    end
end
getgenv().timeOfLastCommand = os.clock()
--End Upgrade Command


--Start Spawn Command
repeat task.wait() until (game.Workspace["_wave_num"].Value >= 13 and os.clock() - getgenv().macroStartTime >= 368.65459350001765 - deviation and game.Players.LocalPlayer._stats.resource.Value >= 21143.730418200008)

deviation = tostring(os.clock() - getgenv().macroStartTime) - 368.6558369999984
expectedWave = 13
expectedMoney = 21143.730418200008
expectedTimeSinceLastCommand = 4.97203940001782

printValueDeviations()

print("Attempting to spawn unit: {20180404-a09b-42c7-a7e2-3ee985c24b74}")
game:GetService("ReplicatedStorage").endpoints.client_to_server.spawn_unit:InvokeServer("{20180404-a09b-42c7-a7e2-3ee985c24b74}",CFrame.new(Vector3.new(-289.6642761230469, 1.0000017881393433, -574.8026733398438), Vector3.new(0, 0, -1)))
updateUnitPositions()
getgenv().timeOfLastCommand = os.clock()
--End Spawn Command


--Start Upgrade Command
repeat task.wait() until (game.Workspace["_wave_num"].Value >= 13 and os.clock() - getgenv().macroStartTime >= 371.88741460000165 - deviation and game.Players.LocalPlayer._stats.resource.Value >= 19390.730418200008)

deviation = tostring(os.clock() - getgenv().macroStartTime) - 371.88843839999754
expectedWave = 13
expectedMoney = 19390.730418200008
expectedTimeSinceLastCommand = 3.2271753000095487

printValueDeviations()

updateUnitPositions()

positionToUpgrade = {-289.6642761230469, -574.8026733398438}

for _, unit in pairs(unitPositions) do
    if math.abs(unit[2] - positionToUpgrade[1]) <= 0.01 and math.abs(unit[3] - positionToUpgrade[2]) <= 0.01 then
        print("Attempting to upgrade unit: " .. unit[1]["Name"] .. " from " .. tostring(unit[1]["_stats"]["upgrade"].Value) ..  " to " .. tostring(unit[1]["_stats"]["upgrade"].Value + 1))
        game:GetService("ReplicatedStorage").endpoints.client_to_server.upgrade_unit_ingame:InvokeServer(unit[1])
    end
end
getgenv().timeOfLastCommand = os.clock()
--End Upgrade Command


--Start Upgrade Command
repeat task.wait() until (game.Workspace["_wave_num"].Value >= 13 and os.clock() - getgenv().macroStartTime >= 372.27926619999926 - deviation and game.Players.LocalPlayer._stats.resource.Value >= 17515.730418200008)

deviation = tostring(os.clock() - getgenv().macroStartTime) - 372.2805721000186
expectedWave = 13
expectedMoney = 17515.730418200008
expectedTimeSinceLastCommand = 0.38436490000458434

printValueDeviations()

updateUnitPositions()

positionToUpgrade = {-289.6642761230469, -574.8026733398438}

for _, unit in pairs(unitPositions) do
    if math.abs(unit[2] - positionToUpgrade[1]) <= 0.01 and math.abs(unit[3] - positionToUpgrade[2]) <= 0.01 then
        print("Attempting to upgrade unit: " .. unit[1]["Name"] .. " from " .. tostring(unit[1]["_stats"]["upgrade"].Value) ..  " to " .. tostring(unit[1]["_stats"]["upgrade"].Value + 1))
        game:GetService("ReplicatedStorage").endpoints.client_to_server.upgrade_unit_ingame:InvokeServer(unit[1])
    end
end
getgenv().timeOfLastCommand = os.clock()
--End Upgrade Command


--Start Upgrade Command
repeat task.wait() until (game.Workspace["_wave_num"].Value >= 13 and os.clock() - getgenv().macroStartTime >= 372.59594230001676 - deviation and game.Players.LocalPlayer._stats.resource.Value >= 14984.730418200008)

deviation = tostring(os.clock() - getgenv().macroStartTime) - 372.597448799992
expectedWave = 13
expectedMoney = 14984.730418200008
expectedTimeSinceLastCommand = 0.30718619999242947

printValueDeviations()

updateUnitPositions()

positionToUpgrade = {-289.6642761230469, -574.8026733398438}

for _, unit in pairs(unitPositions) do
    if math.abs(unit[2] - positionToUpgrade[1]) <= 0.01 and math.abs(unit[3] - positionToUpgrade[2]) <= 0.01 then
        print("Attempting to upgrade unit: " .. unit[1]["Name"] .. " from " .. tostring(unit[1]["_stats"]["upgrade"].Value) ..  " to " .. tostring(unit[1]["_stats"]["upgrade"].Value + 1))
        game:GetService("ReplicatedStorage").endpoints.client_to_server.upgrade_unit_ingame:InvokeServer(unit[1])
    end
end
getgenv().timeOfLastCommand = os.clock()
--End Upgrade Command


--Start Upgrade Command
repeat task.wait() until (game.Workspace["_wave_num"].Value >= 13 and os.clock() - getgenv().macroStartTime >= 373.0105279000127 - deviation and game.Players.LocalPlayer._stats.resource.Value >= 11527.730418200008)

deviation = tostring(os.clock() - getgenv().macroStartTime) - 373.01151969999773
expectedWave = 13
expectedMoney = 11527.730418200008
expectedTimeSinceLastCommand = 0.40338299999712035

printValueDeviations()

updateUnitPositions()

positionToUpgrade = {-289.6642761230469, -574.8026733398438}

for _, unit in pairs(unitPositions) do
    if math.abs(unit[2] - positionToUpgrade[1]) <= 0.01 and math.abs(unit[3] - positionToUpgrade[2]) <= 0.01 then
        print("Attempting to upgrade unit: " .. unit[1]["Name"] .. " from " .. tostring(unit[1]["_stats"]["upgrade"].Value) ..  " to " .. tostring(unit[1]["_stats"]["upgrade"].Value + 1))
        game:GetService("ReplicatedStorage").endpoints.client_to_server.upgrade_unit_ingame:InvokeServer(unit[1])
    end
end
getgenv().timeOfLastCommand = os.clock()
--End Upgrade Command


--Start Upgrade Command
repeat task.wait() until (game.Workspace["_wave_num"].Value >= 13 and os.clock() - getgenv().macroStartTime >= 381.8377574000042 - deviation and game.Players.LocalPlayer._stats.resource.Value >= 6853.730418200008)

deviation = tostring(os.clock() - getgenv().macroStartTime) - 381.83890780000365
expectedWave = 13
expectedMoney = 6853.730418200008
expectedTimeSinceLastCommand = 8.81929160002619

printValueDeviations()

updateUnitPositions()

positionToUpgrade = {-373.0122375488281, -613.7689208984375}

for _, unit in pairs(unitPositions) do
    if math.abs(unit[2] - positionToUpgrade[1]) <= 0.01 and math.abs(unit[3] - positionToUpgrade[2]) <= 0.01 then
        print("Attempting to upgrade unit: " .. unit[1]["Name"] .. " from " .. tostring(unit[1]["_stats"]["upgrade"].Value) ..  " to " .. tostring(unit[1]["_stats"]["upgrade"].Value + 1))
        game:GetService("ReplicatedStorage").endpoints.client_to_server.upgrade_unit_ingame:InvokeServer(unit[1])
    end
end
getgenv().timeOfLastCommand = os.clock()
--End Upgrade Command


--Start Upgrade Command
repeat task.wait() until (game.Workspace["_wave_num"].Value >= 13 and os.clock() - getgenv().macroStartTime >= 382.2923473000119 - deviation and game.Players.LocalPlayer._stats.resource.Value >= 603.730418200008)

deviation = tostring(os.clock() - getgenv().macroStartTime) - 382.2936950000003
expectedWave = 13
expectedMoney = 603.730418200008
expectedTimeSinceLastCommand = 0.44518999999854714

printValueDeviations()

updateUnitPositions()

positionToUpgrade = {-373.0122375488281, -613.7689208984375}

for _, unit in pairs(unitPositions) do
    if math.abs(unit[2] - positionToUpgrade[1]) <= 0.01 and math.abs(unit[3] - positionToUpgrade[2]) <= 0.01 then
        print("Attempting to upgrade unit: " .. unit[1]["Name"] .. " from " .. tostring(unit[1]["_stats"]["upgrade"].Value) ..  " to " .. tostring(unit[1]["_stats"]["upgrade"].Value + 1))
        game:GetService("ReplicatedStorage").endpoints.client_to_server.upgrade_unit_ingame:InvokeServer(unit[1])
    end
end
getgenv().timeOfLastCommand = os.clock()
--End Upgrade Command


--Start Upgrade Command
repeat task.wait() until (game.Workspace["_wave_num"].Value >= 13 and os.clock() - getgenv().macroStartTime >= 406.6638235000137 - deviation and game.Players.LocalPlayer._stats.resource.Value >= 2503.730418200008)

deviation = tostring(os.clock() - getgenv().macroStartTime) - 406.66490319999866
expectedWave = 13
expectedMoney = 2503.730418200008
expectedTimeSinceLastCommand = 24.36150299999281

printValueDeviations()

updateUnitPositions()

positionToUpgrade = {-289.6642761230469, -574.8026733398438}

for _, unit in pairs(unitPositions) do
    if math.abs(unit[2] - positionToUpgrade[1]) <= 0.01 and math.abs(unit[3] - positionToUpgrade[2]) <= 0.01 then
        print("Attempting to upgrade unit: " .. unit[1]["Name"] .. " from " .. tostring(unit[1]["_stats"]["upgrade"].Value) ..  " to " .. tostring(unit[1]["_stats"]["upgrade"].Value + 1))
        game:GetService("ReplicatedStorage").endpoints.client_to_server.upgrade_unit_ingame:InvokeServer(unit[1])
    end
end
getgenv().timeOfLastCommand = os.clock()
--End Upgrade Command


--Start Upgrade Command
repeat task.wait() until (game.Workspace["_wave_num"].Value >= 14 and os.clock() - getgenv().macroStartTime >= 420.87998810000136 - deviation and game.Players.LocalPlayer._stats.resource.Value >= 24884.20795305001)

deviation = tostring(os.clock() - getgenv().macroStartTime) - 420.88095439999597
expectedWave = 14
expectedMoney = 24884.20795305001
expectedTimeSinceLastCommand = 14.208184099989012

printValueDeviations()

updateUnitPositions()

positionToUpgrade = {-289.6642761230469, -574.8026733398438}

for _, unit in pairs(unitPositions) do
    if math.abs(unit[2] - positionToUpgrade[1]) <= 0.01 and math.abs(unit[3] - positionToUpgrade[2]) <= 0.01 then
        print("Attempting to upgrade unit: " .. unit[1]["Name"] .. " from " .. tostring(unit[1]["_stats"]["upgrade"].Value) ..  " to " .. tostring(unit[1]["_stats"]["upgrade"].Value + 1))
        game:GetService("ReplicatedStorage").endpoints.client_to_server.upgrade_unit_ingame:InvokeServer(unit[1])
    end
end
getgenv().timeOfLastCommand = os.clock()
--End Upgrade Command


--Start Upgrade Command
repeat task.wait() until (game.Workspace["_wave_num"].Value >= 14 and os.clock() - getgenv().macroStartTime >= 421.3691708999977 - deviation and game.Players.LocalPlayer._stats.resource.Value >= 18363.20795305001)

deviation = tostring(os.clock() - getgenv().macroStartTime) - 421.37033249999513
expectedWave = 14
expectedMoney = 18363.20795305001
expectedTimeSinceLastCommand = 0.4815445999847725

printValueDeviations()

updateUnitPositions()

positionToUpgrade = {-289.6642761230469, -574.8026733398438}

for _, unit in pairs(unitPositions) do
    if math.abs(unit[2] - positionToUpgrade[1]) <= 0.01 and math.abs(unit[3] - positionToUpgrade[2]) <= 0.01 then
        print("Attempting to upgrade unit: " .. unit[1]["Name"] .. " from " .. tostring(unit[1]["_stats"]["upgrade"].Value) ..  " to " .. tostring(unit[1]["_stats"]["upgrade"].Value + 1))
        game:GetService("ReplicatedStorage").endpoints.client_to_server.upgrade_unit_ingame:InvokeServer(unit[1])
    end
end
getgenv().timeOfLastCommand = os.clock()
--End Upgrade Command


--Start Upgrade Command
repeat task.wait() until (game.Workspace["_wave_num"].Value >= 14 and os.clock() - getgenv().macroStartTime >= 422.27338930001133 - deviation and game.Players.LocalPlayer._stats.resource.Value >= 10444.207953050009)

deviation = tostring(os.clock() - getgenv().macroStartTime) - 422.274670600018
expectedWave = 14
expectedMoney = 10444.207953050009
expectedTimeSinceLastCommand = 0.89610330000869

printValueDeviations()

updateUnitPositions()

positionToUpgrade = {-289.6642761230469, -574.8026733398438}

for _, unit in pairs(unitPositions) do
    if math.abs(unit[2] - positionToUpgrade[1]) <= 0.01 and math.abs(unit[3] - positionToUpgrade[2]) <= 0.01 then
        print("Attempting to upgrade unit: " .. unit[1]["Name"] .. " from " .. tostring(unit[1]["_stats"]["upgrade"].Value) ..  " to " .. tostring(unit[1]["_stats"]["upgrade"].Value + 1))
        game:GetService("ReplicatedStorage").endpoints.client_to_server.upgrade_unit_ingame:InvokeServer(unit[1])
    end
end
getgenv().timeOfLastCommand = os.clock()
--End Upgrade Command


--Start Upgrade Command
repeat task.wait() until (game.Workspace["_wave_num"].Value >= 15 and os.clock() - getgenv().macroStartTime >= 498.1427478000114 - deviation and game.Players.LocalPlayer._stats.resource.Value >= 27006.68548790001)

deviation = tostring(os.clock() - getgenv().macroStartTime) - 498.14375800002017
expectedWave = 15
expectedMoney = 27006.68548790001
expectedTimeSinceLastCommand = 75.85931260001962

printValueDeviations()

updateUnitPositions()

positionToUpgrade = {-289.6642761230469, -574.8026733398438}

for _, unit in pairs(unitPositions) do
    if math.abs(unit[2] - positionToUpgrade[1]) <= 0.01 and math.abs(unit[3] - positionToUpgrade[2]) <= 0.01 then
        print("Attempting to upgrade unit: " .. unit[1]["Name"] .. " from " .. tostring(unit[1]["_stats"]["upgrade"].Value) ..  " to " .. tostring(unit[1]["_stats"]["upgrade"].Value + 1))
        game:GetService("ReplicatedStorage").endpoints.client_to_server.upgrade_unit_ingame:InvokeServer(unit[1])
    end
end
getgenv().timeOfLastCommand = os.clock()
--End Upgrade Command


--Start Upgrade Command
repeat task.wait() until (game.Workspace["_wave_num"].Value >= 15 and os.clock() - getgenv().macroStartTime >= 503.71774240001105 - deviation and game.Players.LocalPlayer._stats.resource.Value >= 37682.98886770001)

deviation = tostring(os.clock() - getgenv().macroStartTime) - 503.71866420001606
expectedWave = 15
expectedMoney = 37682.98886770001
expectedTimeSinceLastCommand = 5.564448799996171

printValueDeviations()

updateUnitPositions()

positionToUpgrade = {-289.6642761230469, -574.8026733398438}

for _, unit in pairs(unitPositions) do
    if math.abs(unit[2] - positionToUpgrade[1]) <= 0.01 and math.abs(unit[3] - positionToUpgrade[2]) <= 0.01 then
        print("Attempting to upgrade unit: " .. unit[1]["Name"] .. " from " .. tostring(unit[1]["_stats"]["upgrade"].Value) ..  " to " .. tostring(unit[1]["_stats"]["upgrade"].Value + 1))
        game:GetService("ReplicatedStorage").endpoints.client_to_server.upgrade_unit_ingame:InvokeServer(unit[1])
    end
end
getgenv().timeOfLastCommand = os.clock()
--End Upgrade Command


--Start Spawn Command
repeat task.wait() until (game.Workspace["_wave_num"].Value >= 17 and os.clock() - getgenv().macroStartTime >= 583.17259870001 - deviation and game.Players.LocalPlayer._stats.resource.Value >= 48834.29224750001)

deviation = tostring(os.clock() - getgenv().macroStartTime) - 583.1739369000134
expectedWave = 17
expectedMoney = 48834.29224750001
expectedTimeSinceLastCommand = 79.4482224000094

printValueDeviations()

print("Attempting to spawn unit: {20180404-a09b-42c7-a7e2-3ee985c24b74}")
game:GetService("ReplicatedStorage").endpoints.client_to_server.spawn_unit:InvokeServer("{20180404-a09b-42c7-a7e2-3ee985c24b74}",CFrame.new(Vector3.new(-288.64886474609375, 1.0000017881393433, -577.27978515625), Vector3.new(0, 0, -1)))
updateUnitPositions()
getgenv().timeOfLastCommand = os.clock()
--End Spawn Command


--Start Upgrade Command
repeat task.wait() until (game.Workspace["_wave_num"].Value >= 17 and os.clock() - getgenv().macroStartTime >= 584.4507962999924 - deviation and game.Players.LocalPlayer._stats.resource.Value >= 47081.29224750001)

deviation = tostring(os.clock() - getgenv().macroStartTime) - 584.4520071000152
expectedWave = 17
expectedMoney = 47081.29224750001
expectedTimeSinceLastCommand = 1.2713106999872252

printValueDeviations()

updateUnitPositions()

positionToUpgrade = {-288.64886474609375, -577.27978515625}

for _, unit in pairs(unitPositions) do
    if math.abs(unit[2] - positionToUpgrade[1]) <= 0.01 and math.abs(unit[3] - positionToUpgrade[2]) <= 0.01 then
        print("Attempting to upgrade unit: " .. unit[1]["Name"] .. " from " .. tostring(unit[1]["_stats"]["upgrade"].Value) ..  " to " .. tostring(unit[1]["_stats"]["upgrade"].Value + 1))
        game:GetService("ReplicatedStorage").endpoints.client_to_server.upgrade_unit_ingame:InvokeServer(unit[1])
    end
end
getgenv().timeOfLastCommand = os.clock()
--End Upgrade Command


--Start Upgrade Command
repeat task.wait() until (game.Workspace["_wave_num"].Value >= 17 and os.clock() - getgenv().macroStartTime >= 584.6181054000044 - deviation and game.Players.LocalPlayer._stats.resource.Value >= 47229.29224750001)

deviation = tostring(os.clock() - getgenv().macroStartTime) - 584.6195806000032
expectedWave = 17
expectedMoney = 47229.29224750001
expectedTimeSinceLastCommand = 0.15872060001129285

printValueDeviations()

updateUnitPositions()

positionToUpgrade = {-288.64886474609375, -577.27978515625}

for _, unit in pairs(unitPositions) do
    if math.abs(unit[2] - positionToUpgrade[1]) <= 0.01 and math.abs(unit[3] - positionToUpgrade[2]) <= 0.01 then
        print("Attempting to upgrade unit: " .. unit[1]["Name"] .. " from " .. tostring(unit[1]["_stats"]["upgrade"].Value) ..  " to " .. tostring(unit[1]["_stats"]["upgrade"].Value + 1))
        game:GetService("ReplicatedStorage").endpoints.client_to_server.upgrade_unit_ingame:InvokeServer(unit[1])
    end
end
getgenv().timeOfLastCommand = os.clock()
--End Upgrade Command


--Start Upgrade Command
repeat task.wait() until (game.Workspace["_wave_num"].Value >= 17 and os.clock() - getgenv().macroStartTime >= 584.7807724000013 - deviation and game.Players.LocalPlayer._stats.resource.Value >= 42569.29224750001)

deviation = tostring(os.clock() - getgenv().macroStartTime) - 584.7821496000106
expectedWave = 17
expectedMoney = 42569.29224750001
expectedTimeSinceLastCommand = 0.15355290001025423

printValueDeviations()

updateUnitPositions()

positionToUpgrade = {-288.64886474609375, -577.27978515625}

for _, unit in pairs(unitPositions) do
    if math.abs(unit[2] - positionToUpgrade[1]) <= 0.01 and math.abs(unit[3] - positionToUpgrade[2]) <= 0.01 then
        print("Attempting to upgrade unit: " .. unit[1]["Name"] .. " from " .. tostring(unit[1]["_stats"]["upgrade"].Value) ..  " to " .. tostring(unit[1]["_stats"]["upgrade"].Value + 1))
        game:GetService("ReplicatedStorage").endpoints.client_to_server.upgrade_unit_ingame:InvokeServer(unit[1])
    end
end
getgenv().timeOfLastCommand = os.clock()
--End Upgrade Command


--Start Upgrade Command
repeat task.wait() until (game.Workspace["_wave_num"].Value >= 17 and os.clock() - getgenv().macroStartTime >= 584.9231465000194 - deviation and game.Players.LocalPlayer._stats.resource.Value >= 42569.29224750001)

deviation = tostring(os.clock() - getgenv().macroStartTime) - 584.9244147000136
expectedWave = 17
expectedMoney = 42569.29224750001
expectedTimeSinceLastCommand = 0.13286759998300113

printValueDeviations()

updateUnitPositions()

positionToUpgrade = {-288.64886474609375, -577.27978515625}

for _, unit in pairs(unitPositions) do
    if math.abs(unit[2] - positionToUpgrade[1]) <= 0.01 and math.abs(unit[3] - positionToUpgrade[2]) <= 0.01 then
        print("Attempting to upgrade unit: " .. unit[1]["Name"] .. " from " .. tostring(unit[1]["_stats"]["upgrade"].Value) ..  " to " .. tostring(unit[1]["_stats"]["upgrade"].Value + 1))
        game:GetService("ReplicatedStorage").endpoints.client_to_server.upgrade_unit_ingame:InvokeServer(unit[1])
    end
end
getgenv().timeOfLastCommand = os.clock()
--End Upgrade Command


--Start Upgrade Command
repeat task.wait() until (game.Workspace["_wave_num"].Value >= 17 and os.clock() - getgenv().macroStartTime >= 585.0762971999939 - deviation and game.Players.LocalPlayer._stats.resource.Value >= 34011.29224750001)

deviation = tostring(os.clock() - getgenv().macroStartTime) - 585.0772356000089
expectedWave = 17
expectedMoney = 34011.29224750001
expectedTimeSinceLastCommand = 0.14217470001312904

printValueDeviations()

updateUnitPositions()

positionToUpgrade = {-288.64886474609375, -577.27978515625}

for _, unit in pairs(unitPositions) do
    if math.abs(unit[2] - positionToUpgrade[1]) <= 0.01 and math.abs(unit[3] - positionToUpgrade[2]) <= 0.01 then
        print("Attempting to upgrade unit: " .. unit[1]["Name"] .. " from " .. tostring(unit[1]["_stats"]["upgrade"].Value) ..  " to " .. tostring(unit[1]["_stats"]["upgrade"].Value + 1))
        game:GetService("ReplicatedStorage").endpoints.client_to_server.upgrade_unit_ingame:InvokeServer(unit[1])
    end
end
getgenv().timeOfLastCommand = os.clock()
--End Upgrade Command


--Start Upgrade Command
repeat task.wait() until (game.Workspace["_wave_num"].Value >= 17 and os.clock() - getgenv().macroStartTime >= 585.2672731000057 - deviation and game.Players.LocalPlayer._stats.resource.Value >= 34011.29224750001)

deviation = tostring(os.clock() - getgenv().macroStartTime) - 585.2684170000139
expectedWave = 17
expectedMoney = 34011.29224750001
expectedTimeSinceLastCommand = 0.18175269998027943

printValueDeviations()

updateUnitPositions()

positionToUpgrade = {-288.64886474609375, -577.27978515625}

for _, unit in pairs(unitPositions) do
    if math.abs(unit[2] - positionToUpgrade[1]) <= 0.01 and math.abs(unit[3] - positionToUpgrade[2]) <= 0.01 then
        print("Attempting to upgrade unit: " .. unit[1]["Name"] .. " from " .. tostring(unit[1]["_stats"]["upgrade"].Value) ..  " to " .. tostring(unit[1]["_stats"]["upgrade"].Value + 1))
        game:GetService("ReplicatedStorage").endpoints.client_to_server.upgrade_unit_ingame:InvokeServer(unit[1])
    end
end
getgenv().timeOfLastCommand = os.clock()
--End Upgrade Command


--Start Upgrade Command
repeat task.wait() until (game.Workspace["_wave_num"].Value >= 17 and os.clock() - getgenv().macroStartTime >= 585.852229000011 - deviation and game.Players.LocalPlayer._stats.resource.Value >= 19571.29224750001)

deviation = tostring(os.clock() - getgenv().macroStartTime) - 585.8532918000128
expectedWave = 17
expectedMoney = 19571.29224750001
expectedTimeSinceLastCommand = 0.5741128000081517

printValueDeviations()

updateUnitPositions()

positionToUpgrade = {-288.64886474609375, -577.27978515625}

for _, unit in pairs(unitPositions) do
    if math.abs(unit[2] - positionToUpgrade[1]) <= 0.01 and math.abs(unit[3] - positionToUpgrade[2]) <= 0.01 then
        print("Attempting to upgrade unit: " .. unit[1]["Name"] .. " from " .. tostring(unit[1]["_stats"]["upgrade"].Value) ..  " to " .. tostring(unit[1]["_stats"]["upgrade"].Value + 1))
        game:GetService("ReplicatedStorage").endpoints.client_to_server.upgrade_unit_ingame:InvokeServer(unit[1])
    end
end
getgenv().timeOfLastCommand = os.clock()
--End Upgrade Command


--Start Upgrade Command
repeat task.wait() until (game.Workspace["_wave_num"].Value >= 18 and os.clock() - getgenv().macroStartTime >= 607.9587787000055 - deviation and game.Players.LocalPlayer._stats.resource.Value >= 34133.595627300005)

deviation = tostring(os.clock() - getgenv().macroStartTime) - 607.9602274000063
expectedWave = 18
expectedMoney = 34133.595627300005
expectedTimeSinceLastCommand = 22.097101000021212

printValueDeviations()

updateUnitPositions()

positionToUpgrade = {-288.64886474609375, -577.27978515625}

for _, unit in pairs(unitPositions) do
    if math.abs(unit[2] - positionToUpgrade[1]) <= 0.01 and math.abs(unit[3] - positionToUpgrade[2]) <= 0.01 then
        print("Attempting to upgrade unit: " .. unit[1]["Name"] .. " from " .. tostring(unit[1]["_stats"]["upgrade"].Value) ..  " to " .. tostring(unit[1]["_stats"]["upgrade"].Value + 1))
        game:GetService("ReplicatedStorage").endpoints.client_to_server.upgrade_unit_ingame:InvokeServer(unit[1])
    end
end
getgenv().timeOfLastCommand = os.clock()
--End Upgrade Command


--Start Upgrade Command
repeat task.wait() until (game.Workspace["_wave_num"].Value >= 18 and os.clock() - getgenv().macroStartTime >= 608.7703271000064 - deviation and game.Players.LocalPlayer._stats.resource.Value >= 21564.595627300005)

deviation = tostring(os.clock() - getgenv().macroStartTime) - 608.7716353000142
expectedWave = 18
expectedMoney = 21564.595627300005
expectedTimeSinceLastCommand = 0.8029835000052117

printValueDeviations()

updateUnitPositions()

positionToUpgrade = {-288.64886474609375, -577.27978515625}

for _, unit in pairs(unitPositions) do
    if math.abs(unit[2] - positionToUpgrade[1]) <= 0.01 and math.abs(unit[3] - positionToUpgrade[2]) <= 0.01 then
        print("Attempting to upgrade unit: " .. unit[1]["Name"] .. " from " .. tostring(unit[1]["_stats"]["upgrade"].Value) ..  " to " .. tostring(unit[1]["_stats"]["upgrade"].Value + 1))
        game:GetService("ReplicatedStorage").endpoints.client_to_server.upgrade_unit_ingame:InvokeServer(unit[1])
    end
end
getgenv().timeOfLastCommand = os.clock()
--End Upgrade Command


--Start Spawn Command
repeat task.wait() until (game.Workspace["_wave_num"].Value >= 19 and os.clock() - getgenv().macroStartTime >= 689.5876542000042 - deviation and game.Players.LocalPlayer._stats.resource.Value >= 37029.8990071)

deviation = tostring(os.clock() - getgenv().macroStartTime) - 689.5888721999945
expectedWave = 19
expectedMoney = 37029.8990071
expectedTimeSinceLastCommand = 80.80909280001651

printValueDeviations()

print("Attempting to spawn unit: {20180404-a09b-42c7-a7e2-3ee985c24b74}")
game:GetService("ReplicatedStorage").endpoints.client_to_server.spawn_unit:InvokeServer("{20180404-a09b-42c7-a7e2-3ee985c24b74}",CFrame.new(Vector3.new(-287.5981140136719, 1.0000017881393433, -573.6194458007812), Vector3.new(0, 0, -1)))
updateUnitPositions()
getgenv().timeOfLastCommand = os.clock()
--End Spawn Command


--Start Upgrade Command
repeat task.wait() until (game.Workspace["_wave_num"].Value >= 19 and os.clock() - getgenv().macroStartTime >= 691.0472967000096 - deviation and game.Players.LocalPlayer._stats.resource.Value >= 35699.8990071)

deviation = tostring(os.clock() - getgenv().macroStartTime) - 691.048457500001
expectedWave = 19
expectedMoney = 35699.8990071
expectedTimeSinceLastCommand = 1.4530324000224937

printValueDeviations()

updateUnitPositions()

positionToUpgrade = {-287.5981140136719, -573.6194458007812}

for _, unit in pairs(unitPositions) do
    if math.abs(unit[2] - positionToUpgrade[1]) <= 0.01 and math.abs(unit[3] - positionToUpgrade[2]) <= 0.01 then
        print("Attempting to upgrade unit: " .. unit[1]["Name"] .. " from " .. tostring(unit[1]["_stats"]["upgrade"].Value) ..  " to " .. tostring(unit[1]["_stats"]["upgrade"].Value + 1))
        game:GetService("ReplicatedStorage").endpoints.client_to_server.upgrade_unit_ingame:InvokeServer(unit[1])
    end
end
getgenv().timeOfLastCommand = os.clock()
--End Upgrade Command


--Start Upgrade Command
repeat task.wait() until (game.Workspace["_wave_num"].Value >= 19 and os.clock() - getgenv().macroStartTime >= 691.2107446000155 - deviation and game.Players.LocalPlayer._stats.resource.Value >= 35806.8990071)

deviation = tostring(os.clock() - getgenv().macroStartTime) - 691.2134576000099
expectedWave = 19
expectedMoney = 35806.8990071
expectedTimeSinceLastCommand = 0.15734860001248308

printValueDeviations()

updateUnitPositions()

positionToUpgrade = {-287.5981140136719, -573.6194458007812}

for _, unit in pairs(unitPositions) do
    if math.abs(unit[2] - positionToUpgrade[1]) <= 0.01 and math.abs(unit[3] - positionToUpgrade[2]) <= 0.01 then
        print("Attempting to upgrade unit: " .. unit[1]["Name"] .. " from " .. tostring(unit[1]["_stats"]["upgrade"].Value) ..  " to " .. tostring(unit[1]["_stats"]["upgrade"].Value + 1))
        game:GetService("ReplicatedStorage").endpoints.client_to_server.upgrade_unit_ingame:InvokeServer(unit[1])
    end
end
getgenv().timeOfLastCommand = os.clock()
--End Upgrade Command


--Start Upgrade Command
repeat task.wait() until (game.Workspace["_wave_num"].Value >= 19 and os.clock() - getgenv().macroStartTime >= 691.5304895000008 - deviation and game.Players.LocalPlayer._stats.resource.Value >= 31146.8990071)

deviation = tostring(os.clock() - getgenv().macroStartTime) - 691.5316850999952
expectedWave = 19
expectedMoney = 31146.8990071
expectedTimeSinceLastCommand = 0.30328880000161007

printValueDeviations()

updateUnitPositions()

positionToUpgrade = {-287.5981140136719, -573.6194458007812}

for _, unit in pairs(unitPositions) do
    if math.abs(unit[2] - positionToUpgrade[1]) <= 0.01 and math.abs(unit[3] - positionToUpgrade[2]) <= 0.01 then
        print("Attempting to upgrade unit: " .. unit[1]["Name"] .. " from " .. tostring(unit[1]["_stats"]["upgrade"].Value) ..  " to " .. tostring(unit[1]["_stats"]["upgrade"].Value + 1))
        game:GetService("ReplicatedStorage").endpoints.client_to_server.upgrade_unit_ingame:InvokeServer(unit[1])
    end
end
getgenv().timeOfLastCommand = os.clock()
--End Upgrade Command


--Start Upgrade Command
repeat task.wait() until (game.Workspace["_wave_num"].Value >= 19 and os.clock() - getgenv().macroStartTime >= 691.7702643999946 - deviation and game.Players.LocalPlayer._stats.resource.Value >= 27689.8990071)

deviation = tostring(os.clock() - getgenv().macroStartTime) - 691.7715217999939
expectedWave = 19
expectedMoney = 27689.8990071
expectedTimeSinceLastCommand = 0.23113539998303168

printValueDeviations()

updateUnitPositions()

positionToUpgrade = {-287.5981140136719, -573.6194458007812}

for _, unit in pairs(unitPositions) do
    if math.abs(unit[2] - positionToUpgrade[1]) <= 0.01 and math.abs(unit[3] - positionToUpgrade[2]) <= 0.01 then
        print("Attempting to upgrade unit: " .. unit[1]["Name"] .. " from " .. tostring(unit[1]["_stats"]["upgrade"].Value) ..  " to " .. tostring(unit[1]["_stats"]["upgrade"].Value + 1))
        game:GetService("ReplicatedStorage").endpoints.client_to_server.upgrade_unit_ingame:InvokeServer(unit[1])
    end
end
getgenv().timeOfLastCommand = os.clock()
--End Upgrade Command


--Start Upgrade Command
repeat task.wait() until (game.Workspace["_wave_num"].Value >= 19 and os.clock() - getgenv().macroStartTime >= 692.0405674999929 - deviation and game.Players.LocalPlayer._stats.resource.Value >= 22588.8990071)

deviation = tostring(os.clock() - getgenv().macroStartTime) - 692.041813399992
expectedWave = 19
expectedMoney = 22588.8990071
expectedTimeSinceLastCommand = 0.2618240999872796

printValueDeviations()

updateUnitPositions()

positionToUpgrade = {-287.5981140136719, -573.6194458007812}

for _, unit in pairs(unitPositions) do
    if math.abs(unit[2] - positionToUpgrade[1]) <= 0.01 and math.abs(unit[3] - positionToUpgrade[2]) <= 0.01 then
        print("Attempting to upgrade unit: " .. unit[1]["Name"] .. " from " .. tostring(unit[1]["_stats"]["upgrade"].Value) ..  " to " .. tostring(unit[1]["_stats"]["upgrade"].Value + 1))
        game:GetService("ReplicatedStorage").endpoints.client_to_server.upgrade_unit_ingame:InvokeServer(unit[1])
    end
end
getgenv().timeOfLastCommand = os.clock()
--End Upgrade Command


--Start Upgrade Command
repeat task.wait() until (game.Workspace["_wave_num"].Value >= 19 and os.clock() - getgenv().macroStartTime >= 692.8137666000111 - deviation and game.Players.LocalPlayer._stats.resource.Value >= 16067.8990071)

deviation = tostring(os.clock() - getgenv().macroStartTime) - 692.8150250000181
expectedWave = 19
expectedMoney = 16067.8990071
expectedTimeSinceLastCommand = 0.7641447000205517

printValueDeviations()

updateUnitPositions()

positionToUpgrade = {-287.5981140136719, -573.6194458007812}

for _, unit in pairs(unitPositions) do
    if math.abs(unit[2] - positionToUpgrade[1]) <= 0.01 and math.abs(unit[3] - positionToUpgrade[2]) <= 0.01 then
        print("Attempting to upgrade unit: " .. unit[1]["Name"] .. " from " .. tostring(unit[1]["_stats"]["upgrade"].Value) ..  " to " .. tostring(unit[1]["_stats"]["upgrade"].Value + 1))
        game:GetService("ReplicatedStorage").endpoints.client_to_server.upgrade_unit_ingame:InvokeServer(unit[1])
    end
end
getgenv().timeOfLastCommand = os.clock()
--End Upgrade Command


--Start Upgrade Command
repeat task.wait() until (game.Workspace["_wave_num"].Value >= 19 and os.clock() - getgenv().macroStartTime >= 717.0556356000016 - deviation and game.Players.LocalPlayer._stats.resource.Value >= 33276.2023869)

deviation = tostring(os.clock() - getgenv().macroStartTime) - 717.0568238999986
expectedWave = 19
expectedMoney = 33276.2023869
expectedTimeSinceLastCommand = 24.232261600001948

printValueDeviations()

updateUnitPositions()

positionToUpgrade = {-287.5981140136719, -573.6194458007812}

for _, unit in pairs(unitPositions) do
    if math.abs(unit[2] - positionToUpgrade[1]) <= 0.01 and math.abs(unit[3] - positionToUpgrade[2]) <= 0.01 then
        print("Attempting to upgrade unit: " .. unit[1]["Name"] .. " from " .. tostring(unit[1]["_stats"]["upgrade"].Value) ..  " to " .. tostring(unit[1]["_stats"]["upgrade"].Value + 1))
        game:GetService("ReplicatedStorage").endpoints.client_to_server.upgrade_unit_ingame:InvokeServer(unit[1])
    end
end
getgenv().timeOfLastCommand = os.clock()
--End Upgrade Command


--Start Upgrade Command
repeat task.wait() until (game.Workspace["_wave_num"].Value >= 19 and os.clock() - getgenv().macroStartTime >= 718.369360200013 - deviation and game.Players.LocalPlayer._stats.resource.Value >= 23009.202386899997)

deviation = tostring(os.clock() - getgenv().macroStartTime) - 718.3704208999989
expectedWave = 19
expectedMoney = 23009.202386899997
expectedTimeSinceLastCommand = 1.3053596999961883

printValueDeviations()

updateUnitPositions()

positionToUpgrade = {-287.5981140136719, -573.6194458007812}

for _, unit in pairs(unitPositions) do
    if math.abs(unit[2] - positionToUpgrade[1]) <= 0.01 and math.abs(unit[3] - positionToUpgrade[2]) <= 0.01 then
        print("Attempting to upgrade unit: " .. unit[1]["Name"] .. " from " .. tostring(unit[1]["_stats"]["upgrade"].Value) ..  " to " .. tostring(unit[1]["_stats"]["upgrade"].Value + 1))
        game:GetService("ReplicatedStorage").endpoints.client_to_server.upgrade_unit_ingame:InvokeServer(unit[1])
    end
end
getgenv().timeOfLastCommand = os.clock()
--End Upgrade Command


--Start Upgrade Command
repeat task.wait() until (game.Workspace["_wave_num"].Value >= 20 and os.clock() - getgenv().macroStartTime >= 763.3876056000008 - deviation and game.Players.LocalPlayer._stats.resource.Value >= 18573.202386899997)

deviation = tostring(os.clock() - getgenv().macroStartTime) - 763.3887388000148
expectedWave = 20
expectedMoney = 18573.202386899997
expectedTimeSinceLastCommand = 45.010139599995455

printValueDeviations()

updateUnitPositions()

positionToUpgrade = {-287.5981140136719, -573.6194458007812}

for _, unit in pairs(unitPositions) do
    if math.abs(unit[2] - positionToUpgrade[1]) <= 0.01 and math.abs(unit[3] - positionToUpgrade[2]) <= 0.01 then
        print("Attempting to upgrade unit: " .. unit[1]["Name"] .. " from " .. tostring(unit[1]["_stats"]["upgrade"].Value) ..  " to " .. tostring(unit[1]["_stats"]["upgrade"].Value + 1))
        game:GetService("ReplicatedStorage").endpoints.client_to_server.upgrade_unit_ingame:InvokeServer(unit[1])
    end
end
getgenv().timeOfLastCommand = os.clock()
--End Upgrade Command


--Start Active Command
repeat task.wait() until (game.Workspace["_wave_num"].Value >= 20 and os.clock() - getgenv().macroStartTime >= 844.8757143999974 - deviation)

deviation = tostring(os.clock() - getgenv().macroStartTime) - 844.8769063999935
expectedWave = 20
expectedMoney = 6029.202386899997
expectedTimeSinceLastCommand = 81.47990169998957

printValueDeviations()

updateUnitPositions()

positionToActivate = {-287.5981140136719, -573.6194458007812}

for _, unit in pairs(unitPositions) do
    if math.abs(unit[2] - positionToActivate[1]) <= 0.01 and math.abs(unit[3] - positionToActivate[2]) <= 0.01 then
        print("Attempting to active attack with unit: " .. unit[1]["Name"])
        game:GetService("ReplicatedStorage").endpoints.client_to_server.use_active_attack:InvokeServer(unit[1])
    end
end
getgenv().timeOfLastCommand = os.clock()
--End Active Command


--Start Spawn Command
repeat task.wait() until (game.Workspace["_wave_num"].Value >= 20 and os.clock() - getgenv().macroStartTime >= 893.0115535999939 - deviation and game.Players.LocalPlayer._stats.resource.Value >= 6029.202386899997)

deviation = tostring(os.clock() - getgenv().macroStartTime) - 893.0125810000172
expectedWave = 20
expectedMoney = 6029.202386899997
expectedTimeSinceLastCommand = 48.126427900017006

printValueDeviations()

print("Attempting to spawn unit: {b7cad29d-38ce-49b4-8178-fae563173129}")
game:GetService("ReplicatedStorage").endpoints.client_to_server.spawn_unit:InvokeServer("{b7cad29d-38ce-49b4-8178-fae563173129}",CFrame.new(Vector3.new(-287.9677734375, 1.000002384185791, -590.222412109375), Vector3.new(0, 0, -1)))
updateUnitPositions()
getgenv().timeOfLastCommand = os.clock()
--End Spawn Command


--Start Active Command
repeat task.wait() until (game.Workspace["_wave_num"].Value >= 20 and os.clock() - getgenv().macroStartTime >= 895.9720365999965 - deviation)

deviation = tostring(os.clock() - getgenv().macroStartTime) - 895.973276100005
expectedWave = 20
expectedMoney = 4429.202386899997
expectedTimeSinceLastCommand = 2.9551143999851774

printValueDeviations()

updateUnitPositions()

positionToActivate = {-287.9677734375, -590.222412109375}

for _, unit in pairs(unitPositions) do
    if math.abs(unit[2] - positionToActivate[1]) <= 0.01 and math.abs(unit[3] - positionToActivate[2]) <= 0.01 then
        print("Attempting to active attack with unit: " .. unit[1]["Name"])
        game:GetService("ReplicatedStorage").endpoints.client_to_server.use_active_attack:InvokeServer(unit[1])
    end
end
getgenv().timeOfLastCommand = os.clock()
--End Active Command


--Start Sell Command
repeat task.wait() until (game.Workspace["_wave_num"].Value >= 20 and os.clock() - getgenv().macroStartTime >= 935.4922577000107 - deviation)

deviation = tostring(os.clock() - getgenv().macroStartTime) - 935.4933814000105
expectedWave = 20
expectedMoney = 4429.202386899997
expectedTimeSinceLastCommand = 39.51006949998555

printValueDeviations()

updateUnitPositions()

positionToSell = {-287.5981140136719, -573.6194458007812}

for _, unit in pairs(unitPositions) do
    if math.abs(unit[2] - positionToSell[1]) <= 0.01 and math.abs(unit[3] - positionToSell[2]) <= 0.01 then
        print("Attempting to sell unit: " .. unit[1]["Name"])
        game:GetService("ReplicatedStorage").endpoints.client_to_server.upgrade_unit_ingame:InvokeServer(unit[1])
    end
end
getgenv().timeOfLastCommand = os.clock()
--End Sell Command


--Start Sell Command
repeat task.wait() until (game.Workspace["_wave_num"].Value >= 20 and os.clock() - getgenv().macroStartTime >= 936.3966854000173 - deviation)

deviation = tostring(os.clock() - getgenv().macroStartTime) - 936.3976601000177
expectedWave = 20
expectedMoney = 21792.702386899997
expectedTimeSinceLastCommand = 0.8949332000047434

printValueDeviations()

updateUnitPositions()

positionToSell = {-288.64886474609375, -577.27978515625}

for _, unit in pairs(unitPositions) do
    if math.abs(unit[2] - positionToSell[1]) <= 0.01 and math.abs(unit[3] - positionToSell[2]) <= 0.01 then
        print("Attempting to sell unit: " .. unit[1]["Name"])
        game:GetService("ReplicatedStorage").endpoints.client_to_server.upgrade_unit_ingame:InvokeServer(unit[1])
    end
end
getgenv().timeOfLastCommand = os.clock()
--End Sell Command


--Start Sell Command
repeat task.wait() until (game.Workspace["_wave_num"].Value >= 20 and os.clock() - getgenv().macroStartTime >= 938.7407633000112 - deviation)

deviation = tostring(os.clock() - getgenv().macroStartTime) - 938.7417827000027
expectedWave = 20
expectedMoney = 39156.2023869
expectedTimeSinceLastCommand = 2.333936300012283

printValueDeviations()

updateUnitPositions()

positionToSell = {-289.6642761230469, -574.8026733398438}

for _, unit in pairs(unitPositions) do
    if math.abs(unit[2] - positionToSell[1]) <= 0.01 and math.abs(unit[3] - positionToSell[2]) <= 0.01 then
        print("Attempting to sell unit: " .. unit[1]["Name"])
        game:GetService("ReplicatedStorage").endpoints.client_to_server.upgrade_unit_ingame:InvokeServer(unit[1])
    end
end
getgenv().timeOfLastCommand = os.clock()
--End Sell Command


--Start Sell Command
repeat task.wait() until (game.Workspace["_wave_num"].Value >= 20 and os.clock() - getgenv().macroStartTime >= 941.7604170000122 - deviation)

deviation = tostring(os.clock() - getgenv().macroStartTime) - 941.7616834999935
expectedWave = 20
expectedMoney = 56519.7023869
expectedTimeSinceLastCommand = 3.01307220000308

printValueDeviations()

updateUnitPositions()

positionToSell = {-289.2087707519531, -572.0425415039062}

for _, unit in pairs(unitPositions) do
    if math.abs(unit[2] - positionToSell[1]) <= 0.01 and math.abs(unit[3] - positionToSell[2]) <= 0.01 then
        print("Attempting to sell unit: " .. unit[1]["Name"])
        game:GetService("ReplicatedStorage").endpoints.client_to_server.upgrade_unit_ingame:InvokeServer(unit[1])
    end
end
getgenv().timeOfLastCommand = os.clock()
--End Sell Command


--Start Spawn Command
repeat task.wait() until (game.Workspace["_wave_num"].Value >= 20 and os.clock() - getgenv().macroStartTime >= 945.3740578000143 - deviation and game.Players.LocalPlayer._stats.resource.Value >= 71469.7023869)

deviation = tostring(os.clock() - getgenv().macroStartTime) - 945.3751149000018
expectedWave = 20
expectedMoney = 71469.7023869
expectedTimeSinceLastCommand = 3.6042419000004884

printValueDeviations()

print("Attempting to spawn unit: {20180404-a09b-42c7-a7e2-3ee985c24b74}")
game:GetService("ReplicatedStorage").endpoints.client_to_server.spawn_unit:InvokeServer("{20180404-a09b-42c7-a7e2-3ee985c24b74}",CFrame.new(Vector3.new(-368.4873046875, 1.0000032186508179, -613.4392700195312), Vector3.new(0, 0, -1)))
updateUnitPositions()
getgenv().timeOfLastCommand = os.clock()
--End Spawn Command


--Start Upgrade Command
repeat task.wait() until (game.Workspace["_wave_num"].Value >= 20 and os.clock() - getgenv().macroStartTime >= 947.1274061000149 - deviation and game.Players.LocalPlayer._stats.resource.Value >= 69716.7023869)

deviation = tostring(os.clock() - getgenv().macroStartTime) - 947.1286490000202
expectedWave = 20
expectedMoney = 69716.7023869
expectedTimeSinceLastCommand = 1.7470156000053976

printValueDeviations()

updateUnitPositions()

positionToUpgrade = {-368.4873046875, -613.4392700195312}

for _, unit in pairs(unitPositions) do
    if math.abs(unit[2] - positionToUpgrade[1]) <= 0.01 and math.abs(unit[3] - positionToUpgrade[2]) <= 0.01 then
        print("Attempting to upgrade unit: " .. unit[1]["Name"] .. " from " .. tostring(unit[1]["_stats"]["upgrade"].Value) ..  " to " .. tostring(unit[1]["_stats"]["upgrade"].Value + 1))
        game:GetService("ReplicatedStorage").endpoints.client_to_server.upgrade_unit_ingame:InvokeServer(unit[1])
    end
end
getgenv().timeOfLastCommand = os.clock()
--End Upgrade Command


--Start Upgrade Command
repeat task.wait() until (game.Workspace["_wave_num"].Value >= 20 and os.clock() - getgenv().macroStartTime >= 947.295314100018 - deviation and game.Players.LocalPlayer._stats.resource.Value >= 67587.7023869)

deviation = tostring(os.clock() - getgenv().macroStartTime) - 947.2964800000191
expectedWave = 20
expectedMoney = 67587.7023869
expectedTimeSinceLastCommand = 0.15778370000771247

printValueDeviations()

updateUnitPositions()

positionToUpgrade = {-368.4873046875, -613.4392700195312}

for _, unit in pairs(unitPositions) do
    if math.abs(unit[2] - positionToUpgrade[1]) <= 0.01 and math.abs(unit[3] - positionToUpgrade[2]) <= 0.01 then
        print("Attempting to upgrade unit: " .. unit[1]["Name"] .. " from " .. tostring(unit[1]["_stats"]["upgrade"].Value) ..  " to " .. tostring(unit[1]["_stats"]["upgrade"].Value + 1))
        game:GetService("ReplicatedStorage").endpoints.client_to_server.upgrade_unit_ingame:InvokeServer(unit[1])
    end
end
getgenv().timeOfLastCommand = os.clock()
--End Upgrade Command


--Start Upgrade Command
repeat task.wait() until (game.Workspace["_wave_num"].Value >= 20 and os.clock() - getgenv().macroStartTime >= 947.4256978000049 - deviation and game.Players.LocalPlayer._stats.resource.Value >= 65056.7023869)

deviation = tostring(os.clock() - getgenv().macroStartTime) - 947.4267629999958
expectedWave = 20
expectedMoney = 65056.7023869
expectedTimeSinceLastCommand = 0.12181189999682829

printValueDeviations()

updateUnitPositions()

positionToUpgrade = {-368.4873046875, -613.4392700195312}

for _, unit in pairs(unitPositions) do
    if math.abs(unit[2] - positionToUpgrade[1]) <= 0.01 and math.abs(unit[3] - positionToUpgrade[2]) <= 0.01 then
        print("Attempting to upgrade unit: " .. unit[1]["Name"] .. " from " .. tostring(unit[1]["_stats"]["upgrade"].Value) ..  " to " .. tostring(unit[1]["_stats"]["upgrade"].Value + 1))
        game:GetService("ReplicatedStorage").endpoints.client_to_server.upgrade_unit_ingame:InvokeServer(unit[1])
    end
end
getgenv().timeOfLastCommand = os.clock()
--End Upgrade Command


--Start Upgrade Command
repeat task.wait() until (game.Workspace["_wave_num"].Value >= 20 and os.clock() - getgenv().macroStartTime >= 947.6022491000185 - deviation and game.Players.LocalPlayer._stats.resource.Value >= 61599.7023869)

deviation = tostring(os.clock() - getgenv().macroStartTime) - 947.6035749000148
expectedWave = 20
expectedMoney = 61599.7023869
expectedTimeSinceLastCommand = 0.16871540001011454

printValueDeviations()

updateUnitPositions()

positionToUpgrade = {-368.4873046875, -613.4392700195312}

for _, unit in pairs(unitPositions) do
    if math.abs(unit[2] - positionToUpgrade[1]) <= 0.01 and math.abs(unit[3] - positionToUpgrade[2]) <= 0.01 then
        print("Attempting to upgrade unit: " .. unit[1]["Name"] .. " from " .. tostring(unit[1]["_stats"]["upgrade"].Value) ..  " to " .. tostring(unit[1]["_stats"]["upgrade"].Value + 1))
        game:GetService("ReplicatedStorage").endpoints.client_to_server.upgrade_unit_ingame:InvokeServer(unit[1])
    end
end
getgenv().timeOfLastCommand = os.clock()
--End Upgrade Command


--Start Upgrade Command
repeat task.wait() until (game.Workspace["_wave_num"].Value >= 20 and os.clock() - getgenv().macroStartTime >= 947.724180899997 - deviation and game.Players.LocalPlayer._stats.resource.Value >= 61599.7023869)

deviation = tostring(os.clock() - getgenv().macroStartTime) - 947.7254726999963
expectedWave = 20
expectedMoney = 61599.7023869
expectedTimeSinceLastCommand = 0.11221270001260564

printValueDeviations()

updateUnitPositions()

positionToUpgrade = {-368.4873046875, -613.4392700195312}

for _, unit in pairs(unitPositions) do
    if math.abs(unit[2] - positionToUpgrade[1]) <= 0.01 and math.abs(unit[3] - positionToUpgrade[2]) <= 0.01 then
        print("Attempting to upgrade unit: " .. unit[1]["Name"] .. " from " .. tostring(unit[1]["_stats"]["upgrade"].Value) ..  " to " .. tostring(unit[1]["_stats"]["upgrade"].Value + 1))
        game:GetService("ReplicatedStorage").endpoints.client_to_server.upgrade_unit_ingame:InvokeServer(unit[1])
    end
end
getgenv().timeOfLastCommand = os.clock()
--End Upgrade Command


--Start Upgrade Command
repeat task.wait() until (game.Workspace["_wave_num"].Value >= 20 and os.clock() - getgenv().macroStartTime >= 947.8901439000037 - deviation and game.Players.LocalPlayer._stats.resource.Value >= 49977.7023869)

deviation = tostring(os.clock() - getgenv().macroStartTime) - 947.8914133000071
expectedWave = 20
expectedMoney = 49977.7023869
expectedTimeSinceLastCommand = 0.15636630001245067

printValueDeviations()

updateUnitPositions()

positionToUpgrade = {-368.4873046875, -613.4392700195312}

for _, unit in pairs(unitPositions) do
    if math.abs(unit[2] - positionToUpgrade[1]) <= 0.01 and math.abs(unit[3] - positionToUpgrade[2]) <= 0.01 then
        print("Attempting to upgrade unit: " .. unit[1]["Name"] .. " from " .. tostring(unit[1]["_stats"]["upgrade"].Value) ..  " to " .. tostring(unit[1]["_stats"]["upgrade"].Value + 1))
        game:GetService("ReplicatedStorage").endpoints.client_to_server.upgrade_unit_ingame:InvokeServer(unit[1])
    end
end
getgenv().timeOfLastCommand = os.clock()
--End Upgrade Command


--Start Upgrade Command
repeat task.wait() until (game.Workspace["_wave_num"].Value >= 20 and os.clock() - getgenv().macroStartTime >= 948.0653452000115 - deviation and game.Players.LocalPlayer._stats.resource.Value >= 42058.7023869)

deviation = tostring(os.clock() - getgenv().macroStartTime) - 948.0665066000074
expectedWave = 20
expectedMoney = 42058.7023869
expectedTimeSinceLastCommand = 0.1639932000252884

printValueDeviations()

updateUnitPositions()

positionToUpgrade = {-368.4873046875, -613.4392700195312}

for _, unit in pairs(unitPositions) do
    if math.abs(unit[2] - positionToUpgrade[1]) <= 0.01 and math.abs(unit[3] - positionToUpgrade[2]) <= 0.01 then
        print("Attempting to upgrade unit: " .. unit[1]["Name"] .. " from " .. tostring(unit[1]["_stats"]["upgrade"].Value) ..  " to " .. tostring(unit[1]["_stats"]["upgrade"].Value + 1))
        game:GetService("ReplicatedStorage").endpoints.client_to_server.upgrade_unit_ingame:InvokeServer(unit[1])
    end
end
getgenv().timeOfLastCommand = os.clock()
--End Upgrade Command


--Start Upgrade Command
repeat task.wait() until (game.Workspace["_wave_num"].Value >= 20 and os.clock() - getgenv().macroStartTime >= 948.1977941000077 - deviation and game.Players.LocalPlayer._stats.resource.Value >= 42058.7023869)

deviation = tostring(os.clock() - getgenv().macroStartTime) - 948.1990835000179
expectedWave = 20
expectedMoney = 42058.7023869
expectedTimeSinceLastCommand = 0.12463840001146309

printValueDeviations()

updateUnitPositions()

positionToUpgrade = {-368.4873046875, -613.4392700195312}

for _, unit in pairs(unitPositions) do
    if math.abs(unit[2] - positionToUpgrade[1]) <= 0.01 and math.abs(unit[3] - positionToUpgrade[2]) <= 0.01 then
        print("Attempting to upgrade unit: " .. unit[1]["Name"] .. " from " .. tostring(unit[1]["_stats"]["upgrade"].Value) ..  " to " .. tostring(unit[1]["_stats"]["upgrade"].Value + 1))
        game:GetService("ReplicatedStorage").endpoints.client_to_server.upgrade_unit_ingame:InvokeServer(unit[1])
    end
end
getgenv().timeOfLastCommand = os.clock()
--End Upgrade Command


--Start Upgrade Command
repeat task.wait() until (game.Workspace["_wave_num"].Value >= 20 and os.clock() - getgenv().macroStartTime >= 951.0804313000117 - deviation and game.Players.LocalPlayer._stats.resource.Value >= 19222.702386899997)

deviation = tostring(os.clock() - getgenv().macroStartTime) - 951.0819417000166
expectedWave = 20
expectedMoney = 19222.702386899997
expectedTimeSinceLastCommand = 2.8736921999952756

printValueDeviations()

updateUnitPositions()

positionToUpgrade = {-368.4873046875, -613.4392700195312}

for _, unit in pairs(unitPositions) do
    if math.abs(unit[2] - positionToUpgrade[1]) <= 0.01 and math.abs(unit[3] - positionToUpgrade[2]) <= 0.01 then
        print("Attempting to upgrade unit: " .. unit[1]["Name"] .. " from " .. tostring(unit[1]["_stats"]["upgrade"].Value) ..  " to " .. tostring(unit[1]["_stats"]["upgrade"].Value + 1))
        game:GetService("ReplicatedStorage").endpoints.client_to_server.upgrade_unit_ingame:InvokeServer(unit[1])
    end
end
getgenv().timeOfLastCommand = os.clock()
--End Upgrade Command


--Start Spawn Command
repeat task.wait() until (game.Workspace["_wave_num"].Value >= 20 and os.clock() - getgenv().macroStartTime >= 975.8148185000173 - deviation and game.Players.LocalPlayer._stats.resource.Value >= 2015.7023868999968)

deviation = tostring(os.clock() - getgenv().macroStartTime) - 975.8158495000098
expectedWave = 20
expectedMoney = 2015.7023868999968
expectedTimeSinceLastCommand = 24.724064100009855

printValueDeviations()

print("Attempting to spawn unit: {fee07a12-dc03-4493-aa73-455f061ffd0e}")
game:GetService("ReplicatedStorage").endpoints.client_to_server.spawn_unit:InvokeServer("{fee07a12-dc03-4493-aa73-455f061ffd0e}",CFrame.new(Vector3.new(-362.30206298828125, 1.0000035762786865, -619.310302734375), Vector3.new(0, 0, -1)))
updateUnitPositions()
getgenv().timeOfLastCommand = os.clock()
--End Spawn Command


--Start Active Command
repeat task.wait() until (game.Workspace["_wave_num"].Value >= 20 and os.clock() - getgenv().macroStartTime >= 981.6754235000117 - deviation)

deviation = tostring(os.clock() - getgenv().macroStartTime) - 981.6766466000117
expectedWave = 20
expectedMoney = 615.7023868999968
expectedTimeSinceLastCommand = 5.8558466999966186

printValueDeviations()

updateUnitPositions()

positionToActivate = {-287.9677734375, -590.222412109375}

for _, unit in pairs(unitPositions) do
    if math.abs(unit[2] - positionToActivate[1]) <= 0.01 and math.abs(unit[3] - positionToActivate[2]) <= 0.01 then
        print("Attempting to active attack with unit: " .. unit[1]["Name"])
        game:GetService("ReplicatedStorage").endpoints.client_to_server.use_active_attack:InvokeServer(unit[1])
    end
end
getgenv().timeOfLastCommand = os.clock()
--End Active Command


--Start Active Command
repeat task.wait() until (game.Workspace["_wave_num"].Value >= 20 and os.clock() - getgenv().macroStartTime >= 996.5174668999971 - deviation)

deviation = tostring(os.clock() - getgenv().macroStartTime) - 996.5186810000159
expectedWave = 20
expectedMoney = 615.7023868999968
expectedTimeSinceLastCommand = 14.832468999986304

printValueDeviations()

updateUnitPositions()

positionToActivate = {-362.30206298828125, -619.310302734375}

for _, unit in pairs(unitPositions) do
    if math.abs(unit[2] - positionToActivate[1]) <= 0.01 and math.abs(unit[3] - positionToActivate[2]) <= 0.01 then
        print("Attempting to active attack with unit: " .. unit[1]["Name"])
        game:GetService("ReplicatedStorage").endpoints.client_to_server.use_active_attack:InvokeServer(unit[1])
    end
end
getgenv().timeOfLastCommand = os.clock()
--End Active Command
