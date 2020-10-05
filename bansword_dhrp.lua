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
local k, l, m = 15, 0, 0;
local function n(o, p)
    local f = {
        [1] = ";directBan " .. o .. " " .. p,
        [2] = {
            ["length"] = "Time",
            ["lengthTime"] = string.format("%sm%sh%sd", tostring(k),
                                           tostring(l), tostring(m)),
            ["server"] = "Current"
        }
    }
    game:GetService("ReplicatedStorage").HDAdminClient.Signals.RequestCommand:InvokeServer(
        unpack(f))
end
local function q(o)
    spawn(function()
        repeat
            n(o, "ban sword'd")
            wait(1)
        until game.Players:FindFirstChild(o) == nil
    end)
end
local r = a:GetMouse()
local s = false;
r.Button1Down:Connect(function()
    if s == false then
        s = true;
        local t = i.Touched:Connect(function(u)
            if u and u.Parent and u.Parent:FindFirstChildOfClass("Humanoid") and
                u.Parent ~= b then
                if game.Players:GetPlayerFromCharacter(u.Parent) then
                    local v = u.Parent.Name;
                    local w = u.Parent;
                    if w:FindFirstChild(j) == nil then
                        local x = Instance.new('BoolValue', w)
                        x.Name = j;
                        q(w.Name)
                    end
                end
            end
        end)
        wait(.5)
        s = false;
        t:disconnect()
    end
end)
