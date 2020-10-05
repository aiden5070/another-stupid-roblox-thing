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

local commands = {
    ["kicksword"] = function(...)
        local args = {...}
        -- kicksword can only be used on yourself
        require("kicksword_dhrp")
    end
}

return commands