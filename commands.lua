-- commands.lua
-- contents of all commands and functionlity

local function require(script_name)
	return loadstring(game:HttpGet("https://raw.githubusercontent.com/aiden5070/another-stupid-roblox-thing/main/"..script_name..".lua", true))()
end

local function FindPlayerFromString(string1, number)
    for _,v in pairs(game:GetService("Players"):GetChildren()) do
        if v.Name:sub(1, #tostring(string1)):lower() == tostring(string1) then
            return v
        end
    end
end

local function ban(user,reason)

	local args = {
		[1] = ";directBan ".. user.. " ".. reason,
		[2] = {
			["length"] = "Time",
			["lengthTime"] = "15m0h0d",
			["server"] = "Current"
		}
	}

	game:GetService("ReplicatedStorage").HDAdminClient.Signals.RequestCommand:InvokeServer(unpack(args))
		
end

local commands = {
    ["kicksword"] = function(...)
        local args = {...}
        -- kicksword can only be used on yourself
        require("kicksword_dhrp")
    end,
    ["tban"] = function(...)
        local args = {...}
        print(args[1])
    end
}

return commands