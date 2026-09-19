-- TRIDENT_RECON: mira como guarda los cuerpos este juego. Ejecutar parado CERCA de otro jugador o bot.
local Players = game:GetService("Players")
local lp = Players.LocalPlayer
local function dumpChar(tag, ch)
    print("=== " .. tag .. " ===")
    if not ch then print("sin character") return end
    print("clase:", ch.ClassName, "| padre:", (ch.Parent and ch.Parent.Name) or "nil")
    local hum = ch:FindFirstChildOfClass("Humanoid")
    if hum then
        print("humanoide: SI rig=" .. tostring(hum.RigType) .. " vida=" .. tostring(math.floor(hum.Health)))
    else
        print("humanoide: NO")
    end
    for _, d in ipairs(ch:GetDescendants()) do
        if d:IsA("BasePart") then
            print("parte:", d.Name, "|", d.ClassName)
        end
    end
end
dumpChar("YO", lp.Character)
local done = false
for _, p in ipairs(Players:GetPlayers()) do
    if p ~= lp and p.Character and not done then
        dumpChar("JUGADOR:" .. p.Name, p.Character)
        done = true
    end
end
if not done then print("no hay otro jugador con character") end
local models = 0
for _, c in ipairs(workspace:GetChildren()) do
    if c:IsA("Model") and c:FindFirstChildOfClass("Humanoid") then
        models = models + 1
        if models <= 5 then print("npc/modelo:", c.Name, "| padre: workspace") end
    end
    if c:IsA("Folder") then
        print("folder:", c.Name, "| hijos: " .. #c:GetChildren())
    end
end
print("modelos con humanoide en workspace:", models)
print("STREAMING:", tostring(workspace.StreamingEnabled))
print("FIN RECON")
