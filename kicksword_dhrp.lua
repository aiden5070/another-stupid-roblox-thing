local a = game.Players.LocalPlayer;
local b = a.Character;
local c = a.Backpack;
local function d(e, ...)
    local f = {...}
    local g = {[1] = ";" .. e .. " " .. table.concat(f, " ")}
    game:GetService("ReplicatedStorage").HDAdminClient.Signals.RequestCommand:InvokeServer(
        unpack(g))
    print("Executed " .. ";" .. e .. " " .. table.concat(f, " "))
end
d("sword", "me")
c:WaitForChild("Sword")
local h = c["Sword"]
local i = h:WaitForChild("Handle")
local j = string.format("%02X", tostring(math.random(0, 0xFF)))
print(j)
local function k(l)
    spawn(function()
        repeat
            d("kick", l,
              "kick sword'd (you got killed by a sword and then kicked)")
            wait(1)
        until game.Players:FindFirstChild(l) == nil
    end)
end
local m = a:GetMouse()
local n = false;
m.Button1Down:Connect(function()
    if n == false then
        n = true;
        local o = i.Touched:Connect(function(p)
            if p and p.Parent and p.Parent:FindFirstChildOfClass("Humanoid") and
                p.Parent ~= b then
                if game.Players:GetPlayerFromCharacter(p.Parent) then
                    local q = p.Parent.Name;
                    local r = p.Parent;
                    if r:FindFirstChild(j) == nil then
                        local s = Instance.new('BoolValue', r)
                        s.Name = j;
                        k(r.Name)
                    end
                end
            end
        end)
        wait(.5)
        n = false;
        o:disconnect()
    end
end)  
