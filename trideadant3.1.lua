-- TRIDENT_RECON3: donde estan los cuerpos de los demas. Ejecutar YA JUGANDO.
local Players = game:GetService("Players")
print("jugadores:", #Players:GetPlayers())
local conChar = 0
for _, p in ipairs(Players:GetPlayers()) do
    if p.Character then conChar = conChar + 1 end
end
print("jugadores con Character:", conChar)
print("--- folders workspace ---")
for _, c in ipairs(workspace:GetChildren()) do
    if c:IsA("Folder") then
        print("folder:", c.Name, "| hijos:", #c:GetChildren())
    end
end
local ign = workspace:FindFirstChild("Ignore")
local tW = tick()
while not ign and tick() - tW < 30 do task.wait(0.5) ign = workspace:FindFirstChild("Ignore") end
if ign then
    print("Ignore ENCONTRADO con", #ign:GetChildren(), "hijos")
    print("--- hijos de Ignore (40) ---")
    local n = 0
    for _, m in ipairs(ign:GetChildren()) do
        n = n + 1
        if n <= 40 then
            local np = 0
            if m:IsA("Model") then
                for _, d in ipairs(m:GetDescendants()) do
                    if d:IsA("BasePart") then np = np + 1 end
                end
            end
            print(n .. ".", m.Name, "|", m.ClassName, "| partes:", np)
        end
    end
    print("total hijos Ignore:", n)
else
    print("NO hay folder Ignore")
end
local lc = ign and ign:FindFirstChild("LocalCharacter")
if lc then
    print("--- piezas de LocalCharacter ---")
    for _, d in ipairs(lc:GetDescendants()) do
        if d:IsA("BasePart") then
            local s = d.Size
            print("parte:", d.Name, "|", d.ClassName, "| tam:", math.floor(s.X) .. "x" .. math.floor(s.Y) .. "x" .. math.floor(s.Z))
        end
    end
end
print("FIN RECON3")
