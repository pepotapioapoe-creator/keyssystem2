-- TRIDENT_RECON4: buscar cuerpos por nombre de jugador + modelos con muchas piezas. YA JUGANDO.
local Players = game:GetService("Players")
print("jugadores:", #Players:GetPlayers())
print("--- buscar por nombre (recursivo) ---")
local found = 0
for _, p in ipairs(Players:GetPlayers()) do
    if p ~= Players.LocalPlayer then
        local m = workspace:FindFirstChild(p.Name, true)
        if m then
            found = found + 1
            local path = m.Name
            local par = m.Parent
            while par and par ~= workspace and par ~= game do
                path = par.Name .. "/" .. path
                par = par.Parent
            end
            print("HIT:", path, "|", m.ClassName)
            if found >= 10 then break end
        end
    end
end
print("hits por nombre:", found)
print("--- modelos con 4+ piezas (40) ---")
local shown, scannedM = 0, 0
for _, d in ipairs(workspace:GetDescendants()) do
    if d:IsA("Model") then
        scannedM = scannedM + 1
        if scannedM > 600 then break end
        local np = 0
        for _, q in ipairs(d:GetDescendants()) do
            if q:IsA("BasePart") then np = np + 1 if np >= 4 then break end end
        end
        if np >= 4 and shown < 40 then
            shown = shown + 1
            local path = d.Name
            local par = d.Parent
            while par and par ~= workspace and par ~= game do
                path = par.Name .. "/" .. path
                par = par.Parent
            end
            print(shown .. ".", path, "| partes4+")
        end
    end
end
print("modelos escaneados:", scannedM)
print("FIN RECON4")
