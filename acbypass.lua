local ReplicatedStorage = game:GetService("ReplicatedStorage")
local tablefind = table.find
local MainEvent = ReplicatedStorage.MainEvent
local Flags = {
    "CHECKER_1",
    "TeleportDetect",
    "GUI_CHECK",
    "OneMoreTime"
}
local __namecall
__namecall = hookmetamethod(game, "__namecall", function(...)
    local args = {...}
    local self = args[1]
    local method = getnamecallmethod()
    local caller = getcallingscript()
    if (method == "FireServer" and self == MainEvent and tablefind(Flags, args[2])) then
        wait(math.huge)
        return
    end
    return __namecall(...)
end)
