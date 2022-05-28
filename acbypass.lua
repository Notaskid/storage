local ReplicatedStorage = game:GetService("ReplicatedStorage")
local tablefind = table.find
local MainEvent = ReplicatedStorage.MainEvent
local Flags = {
    "CHECKER_1",
    "TeleportDetect",
    "OneMoreTime"
}
local __namecall
__namecall = hookmetamethod(game, "__namecall", function(...)
    local args = {...}
    local self = args[1]
    local method = getnamecallmethod()
    local caller = getcallingscript()
    if (method == "FireServer" and self == MainEvent and tablefind(Flags, args[2])) then
        print("ac event fired")
        return
    end
    if (not checkcaller() and getfenv(2).crash) then
        hookfunction(getfenv(2).crash, function()
            warn("crash attempt") 
        end)
    end
    return __namecall(...)
end)
