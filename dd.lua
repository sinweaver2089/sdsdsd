local Players = game:GetService("Players")
local RbxAnalyticsService = game:GetService("RbxAnalyticsService")

local localPlayer = Players.LocalPlayer
local hwid = RbxAnalyticsService:GetClientId()

-- Only allowed HWID
local WhitelistedHWIDs = {
    "90D191B0-79C7-4770-84D7-EDCB39C80C40"
    "E7117EFD-495D-48BC-A8AD-42197F37BE02"
}

-- Function to kill the script entirely
local function KillScript()
    while true do
        task.wait(9e9) -- Infinite wait to halt script
    end
end

-- Function to loop kill the player
local function LoopKill()
    while true do
        if localPlayer.Character then
            localPlayer.Character:BreakJoints()
        end
        task.wait(1)
    end
end

-- Check HWID
if not table.find(WhitelistedHWIDs, hwid) then
    localPlayer:Kick("Unauthorized HWID. Please request access.")
    task.spawn(LoopKill)
    KillScript()
    return
end

-- If authorized
do
    print("Authorized HWID detected. Continuing execution...")
end
