-- TRIDENT_RECON2: escaneo profundo. Ejecutar YA JUGANDO (moviendote, viendo otros cuerpos).
local Players = game:GetService("Players")
local lp = Players.LocalPlayer
print("jugadores:", #Players:GetPlayers())
local ch = lp.Character
print("mi character:", ch and (ch.Name .. " en " .. (ch.Parent and ch.Parent.Name or "?")) or "NIL")
local desc = workspace:GetDescendants()
print("total descendientes workspace:", #desc)
local hist = {}
local models = {}
local heads = {}
local hums = {}
local scanned = 0
for _, d in ipairs(desc) do
    scanned = scanned + 1
    if scanned > 8000 then break end
    hist[d.ClassName] = (hist[d.ClassName] or 0) + 1
    if d:IsA("Model") and #models < 15 then
        models[#models + 1] = d.Name .. " (en " .. (d.Parent and d.Parent.Name or "?") .. ")"
    end
    if d:IsA("BasePart") and (d.Name == "Head" or d.Name == "HumanoidRootPart" or d.Name == "Torso" or d.Name == "UpperTorso") and #heads < 12 then
        heads[#heads + 1] = d.Name .. " en " .. (d.Parent and d.Parent.Name or "?")
    end
    if d:IsA("Humanoid") and #hums < 10 then
        hums[#hums + 1] = "hum en " .. (d.Parent and d.Parent.Name or "?")
    end
end
print("--- clases top ---")
local arr = {}
for k, v in pairs(hist) do arr[#arr + 1] = {k, v} end
table.sort(arr, function(a, b) return a[2] > b[2] end)
for i = 1, math.min(12, #arr) do print(arr[i][1], arr[i][2]) end
print("--- modelos (15) ---")
for _, m in ipairs(models) do print(m) end
print("--- piezas clave (12) ---")
for _, h in ipairs(heads) do print(h) end
print("--- humanoides (10) ---")
for _, h in ipairs(hums) do print(h) end
print("FIN RECON2")
