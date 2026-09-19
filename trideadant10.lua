-- TRIDENT_INSPECT: clickea un cuerpo y dice que es. YA JUGANDO, con el otro a la vista.
local Players = game:GetService("Players")
local mouse = Players.LocalPlayer:GetMouse()
local last = 0
print("INSPECTOR listo: clickea un cuerpo")
mouse.Button1Down:Connect(function()
    if tick() - last < 1 then return end
    last = tick()
    local t = mouse.Target
    if not t then print("click al aire") return end
    print("--- click en:", t.Name, "|", t.ClassName, "---")
    local m = t
    while m and not m:IsA("Model") do m = m.Parent end
    if not m then print("no esta en un Model") return end
    local path = m.Name
    local par = m.Parent
    while par and par ~= workspace and par ~= game do
        path = par.Name .. "/" .. path
        par = par.Parent
    end
    local np, names = 0, {}
    for _, d in ipairs(m:GetDescendants()) do
        if d:IsA("BasePart") then
            np = np + 1
            if #names < 25 then names[#names + 1] = d.Name end
        end
    end
    print("modelo:", m.Name, "| ruta:", path, "| partes:", np)
    print("nombres:", table.concat(names, ", "))
    local okA, at = pcall(function() return m:GetAttributes() end)
    if okA then for k, v in pairs(at) do print("attr:", k, "=", tostring(v)) end end
    for _, d in ipairs(m:GetChildren()) do
        if not d:IsA("BasePart") then print("extra:", d.Name, "|", d.ClassName) end
    end
end)
