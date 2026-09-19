-- TRIDENT_SPY: roba la info del hub funcional SIN hooks.
-- 1er execute = FOTO (antes del otro hub). Ejecutar el otro hub y prender todo.
-- 2do execute = DIFF (instancias nuevas + globals nuevos). Pasar la salida.
local Players = game:GetService("Players")
local lp = Players.LocalPlayer
local function fullPath(inst)
    local path = inst.Name
    local par = inst.Parent
    local n = 0
    while par and par ~= game and n < 10 do
        path = par.Name .. "/" .. path
        par = par.Parent
        n = n + 1
    end
    return path
end
local function snapTree(root)
    local t = {}
    if not root then return t end
    for _, d in ipairs(root:GetDescendants()) do
        t[d.ClassName .. "|" .. fullPath(d)] = true
    end
    return t
end
local function snapEnv()
    local t = {}
    pcall(function()
        if getgenv then for k, _ in pairs(getgenv()) do t["genv:" .. tostring(k)] = true end end
    end)
    for k, _ in pairs(_G) do t["_G:" .. tostring(k)] = true end
    return t
end
if not _G.__SPY_SNAP then
    local roots = {PlayerGui = lp:FindFirstChildOfClass("PlayerGui")}
    local okH, hui = pcall(function() return gethui and gethui() end)
    if okH and hui then roots.CoreGui = hui end
    _G.__SPY_SNAP = {trees = {}, env = snapEnv()}
    for name, r in pairs(roots) do
        _G.__SPY_SNAP.trees[name] = snapTree(r)
    end
    _G.__SPY_ROOTS = roots
    print("SPY: foto lista. Ejecuta el otro hub, prende todo, y ejecuta SPY de nuevo.")
else
    print("SPY: --- instancias nuevas ---")
    local shown = 0
    local function diffTree(name, root)
        if not root then return end
        local old = _G.__SPY_SNAP.trees[name] or {}
        for _, d in ipairs(root:GetDescendants()) do
            if shown >= 80 then return end
            local fp = fullPath(d)
            if fp:find("HUI/Obsidian") then
                -- menu del otro hub, ya conocido: se saltea
            else
                local key = d.ClassName .. "|" .. fp
                if not old[key] then
                    shown = shown + 1
                    local extra = ""
                    if d:IsA("BillboardGui") then
                        extra = " adornee=" .. (d.Adornee and fullPath(d.Adornee) or "nil")
                    elseif d:IsA("TextLabel") or d:IsA("TextButton") then
                        local okT, txt = pcall(function() return d.Text end)
                        extra = " text=" .. (okT and tostring(txt):sub(1, 40) or "?")
                    elseif d:IsA("Frame") then
                        extra = " size=" .. tostring(d.Size) .. " rot=" .. tostring(d.Rotation)
                    end
                    print(shown .. ". [" .. name .. "] " .. d.ClassName .. " " .. fp .. extra)
                end
            end
        end
    end
    local roots = _G.__SPY_ROOTS or {}
    if not roots.PlayerGui then roots.PlayerGui = lp:FindFirstChildOfClass("PlayerGui") end
    for name, r in pairs(roots) do diffTree(name, r) end
    if shown == 0 then print("(nada nuevo en GUI: usa Drawing API o dibuja en otro lado)") end
    print("SPY: --- globals nuevos ---")
    local oldEnv = _G.__SPY_SNAP.env or {}
    local newEnv = snapEnv()
    local n = 0
    for k, _ in pairs(newEnv) do
        if not oldEnv[k] and n < 40 then
            n = n + 1
            print("env+: " .. k)
        end
    end
    if n == 0 then print("(sin globals nuevos)") end
    _G.__SPY_SNAP = nil
    _G.__SPY_ROOTS = nil
    print("SPY FIN")
end
