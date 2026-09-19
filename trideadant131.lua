--[[
    TRIDENT HUB V1 — exclusivo "Supervivencia de Tridentes" (estilo Rust)
    Solo: asistencia de apuntado (cámara) + radar ESP.
    Sin hooks, sin CoreGui/gethui, sin prints. Textos neutros desde el código.
]]

--// Servicios
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local localPlayer = Players.LocalPlayer
local camera = workspace.CurrentCamera

--// Anti re-ejecución: mata loops e hilos de la instancia anterior
if _G.__TR_STOP then pcall(_G.__TR_STOP) end
local dead = false
_G.__TR_STOP = function() dead = true end
if _G.__TR_CONNS then
    for _, c in ipairs(_G.__TR_CONNS) do pcall(function() c:Disconnect() end) end
end
_G.__TR_CONNS = {}
local function TCONN(c) table.insert(_G.__TR_CONNS, c) return c end

--// Settings
local settings = {
    aimEnabled = false, aimAuto = false, smoothing = 25, fovRadius = 140,
    showFov = true, targetPart = "Head", maxDistance = 1500,
    aimNpcs = true, aimDeadzone = 6,
    espEnabled = false, espNames = true, espDistance = true, espHealthBar = true,
    espBox = true, espTracer = true, skeleton = true, espNpcs = true,
    tracerOrigin = "Bottom",
    uiToggleKey = Enum.KeyCode.RightShift,
}
-- Cuerpos custom de este juego: viven en Const/Ignore, sin Humanoid,
-- sin Character. Regla de cuerpo: Model con 6+ piezas + Head + Torso.
-- Se excluyen los propios (FPSArms, LocalCharacter) por nombre.
local SELF_NAMES = {FPSArms = true, LocalCharacter = true, HLPart = true}
local bodyCache, bodyCacheTime = {}, 0
local function refreshBodies()
    bodyCache = {}
    local seen = 0
    for _, m in ipairs(workspace:GetDescendants()) do
        if m:IsA("Model") and m.Name == "Model" then
            seen = seen + 1
            if seen > 200 then break end
            if isBody(m) then
                bodyCache[#bodyCache + 1] = m
                if #bodyCache >= 40 then break end
            end
        end
    end
    -- respaldo: carpeta Ignore si existe
    local c = workspace:FindFirstChild("Const")
    local ig = c and c:FindFirstChild("Ignore")
    if not ig then ig = workspace:FindFirstChild("Ignore", true) end
    if ig then
        for _, m in ipairs(ig:GetChildren()) do
            if isBody(m) then
                local dup = false
                for _, b in ipairs(bodyCache) do if b == m then dup = true break end end
                if not dup then bodyCache[#bodyCache + 1] = m end
            end
        end
    end
end
local function collectBodies()
    local now = tick()
    if now - bodyCacheTime > 3 then
        refreshBodies()
        bodyCacheTime = now
    end
    local out = {}
    for _, m in ipairs(bodyCache) do
        if m and m.Parent then out[#out + 1] = m end
    end
    return out
end
local function findPart(char, name)
    return char:FindFirstChild(name) or char:FindFirstChild(name, true)
end
local function isBody(m)
    if not m or not m:IsA("Model") then return false end
    if SELF_NAMES[m.Name] then return false end
    if not findPart(m, "Head") then return false end
    if not findPart(m, "Torso") then return false end
    local np = 0
    for _, d in ipairs(m:GetDescendants()) do
        if d:IsA("BasePart") then np = np + 1 if np >= 6 then break end end
    end
    return np >= 6
end
local function bodyAnchor(char)
    return findPart(char, "Torso") or findPart(char, "Head")
        or char:FindFirstChildWhichIsA("BasePart", true)
end
local function ownPos()
    local r = myRoot()
    if r then return r.Position end
    return camera.CFrame.Position
end

--// Estilo fijo
local ACCENT = Color3.fromRGB(0, 242, 255)
local COLOR_BG = Color3.fromRGB(10, 10, 16)
local COLOR_CARD = Color3.fromRGB(17, 17, 27)
local COLOR_CARD2 = Color3.fromRGB(22, 22, 34)
local COLOR_TEXT = Color3.fromRGB(245, 245, 250)
local COLOR_SUBTEXT = Color3.fromRGB(150, 150, 170)
local FONT_MAIN = Enum.Font.GothamMedium
local FONT_BOLD = Enum.Font.GothamBold
local FONT_TITLE = Enum.Font.FredokaOne

local function tween(obj, info, props)
    pcall(function()
        TweenService:Create(obj, info or TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), props):Play()
    end)
end
local function corner(obj, r)
    local c = Instance.new("UICorner") c.CornerRadius = UDim.new(0, r or 8) c.Parent = obj return c
end
local function stroke(obj, col, t)
    local s = Instance.new("UIStroke") s.Color = col s.Thickness = t or 1 s.Transparency = 0 s.Parent = obj return s
end
local function myRoot()
    local c = localPlayer.Character return c and c:FindFirstChild("HumanoidRootPart")
end
local function myHum()
    local c = localPlayer.Character return c and c:FindFirstChildOfClass("Humanoid")
end
local function getAimPart(char, bone)
    if not char then return nil end
    return char:FindFirstChild(bone) or char:FindFirstChild("Head")
        or char:FindFirstChild("HumanoidRootPart") or char:FindFirstChildWhichIsA("BasePart")
end

--// GUI raíz (nombres neutros aleatorios)
local function rndName()
    local s = ""
    for i = 1, 10 do s = s .. string.char(math.random(97, 122)) end
    return "ui_" .. s
end
for _, v in ipairs(localPlayer.PlayerGui:GetChildren()) do
    pcall(function()
        if v:GetAttribute("TR1") then v:Destroy() end
    end)
end
local gui = Instance.new("ScreenGui")
gui.Name = rndName()
gui:SetAttribute("TR1", true)
gui.ResetOnSpawn = false
gui.IgnoreGuiInset = true
gui.Parent = localPlayer:WaitForChild("PlayerGui")

--// Panel principal
local mainFrame = Instance.new("Frame")
mainFrame.Size = UDim2.new(0, 560, 0, 400)
mainFrame.Position = UDim2.new(0.5, -280, 0.5, -200)
mainFrame.BackgroundColor3 = COLOR_BG
mainFrame.Visible = false
mainFrame.Parent = gui
corner(mainFrame, 12) stroke(mainFrame, Color3.fromRGB(38, 38, 55), 1.2)

local topBar = Instance.new("Frame")
topBar.Size = UDim2.new(1, 0, 0, 48) topBar.BackgroundTransparency = 1 topBar.Parent = mainFrame
local titleLbl = Instance.new("TextLabel")
titleLbl.Size = UDim2.new(0, 220, 0, 28) titleLbl.Position = UDim2.new(0, 16, 0, 6)
titleLbl.BackgroundTransparency = 1 titleLbl.Font = FONT_BOLD titleLbl.TextSize = 17
titleLbl.TextXAlignment = Enum.TextXAlignment.Left titleLbl.TextColor3 = COLOR_TEXT
titleLbl.Text = "Tridentes v1.4" titleLbl.Parent = topBar
local descLbl = Instance.new("TextLabel")
descLbl.Size = UDim2.new(0, 300, 0, 16) descLbl.Position = UDim2.new(0, 16, 0, 30)
descLbl.BackgroundTransparency = 1 descLbl.Font = FONT_MAIN descLbl.TextSize = 11
descLbl.TextXAlignment = Enum.TextXAlignment.Left descLbl.TextColor3 = COLOR_SUBTEXT
descLbl.Text = "Asistencia + radar." descLbl.Parent = topBar
local hideBtn = Instance.new("TextButton")
hideBtn.Size = UDim2.new(0, 32, 0, 32) hideBtn.Position = UDim2.new(1, -44, 0, 8)
hideBtn.BackgroundColor3 = COLOR_CARD2 hideBtn.Font = FONT_BOLD hideBtn.TextSize = 14
hideBtn.TextColor3 = COLOR_TEXT hideBtn.Text = "-" hideBtn.Parent = topBar corner(hideBtn, 8)

local scroll = Instance.new("ScrollingFrame")
scroll.Size = UDim2.new(1, -24, 1, -60) scroll.Position = UDim2.new(0, 12, 0, 54)
scroll.BackgroundTransparency = 1 scroll.ScrollBarThickness = 3
scroll.ScrollBarImageColor3 = ACCENT scroll.AutomaticCanvasSize = Enum.AutomaticSize.Y
scroll.CanvasSize = UDim2.new(0, 0, 0, 0) scroll.Parent = mainFrame
local scrollLay = Instance.new("UIListLayout")
scrollLay.Padding = UDim.new(0, 10) scrollLay.SortOrder = Enum.SortOrder.LayoutOrder scrollLay.Parent = scroll

-- drag
do
    local dragging, ds, sp
    local function begin(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            dragging = true ds = input.Position sp = mainFrame.Position
        end
    end
    local function move(input)
        if dragging and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
            local d = input.Position - ds
            mainFrame.Position = UDim2.new(sp.X.Scale, sp.X.Offset + d.X, sp.Y.Scale, sp.Y.Offset + d.Y)
        end
    end
    local function fin(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then dragging = false end
    end
    TCONN(topBar.InputBegan:Connect(begin))
    TCONN(UserInputService.InputChanged:Connect(move))
    TCONN(UserInputService.InputEnded:Connect(fin))
    hideBtn.MouseButton1Click:Connect(function() mainFrame.Visible = false end)
end

--// Componentes
local toggleStates = {}
local cardCount = 0
local function createCard(titleText)
    cardCount = cardCount + 1
    local card = Instance.new("Frame")
    card.Size = UDim2.new(1, -12, 0, 0)
    card.AutomaticSize = Enum.AutomaticSize.Y
    card.BackgroundColor3 = COLOR_CARD card.Parent = scroll
    card.LayoutOrder = cardCount
    corner(card, 10) stroke(card, Color3.fromRGB(32, 32, 48), 1)
    local pad = Instance.new("UIPadding")
    pad.PaddingLeft = UDim.new(0, 14) pad.PaddingRight = UDim.new(0, 14)
    pad.PaddingTop = UDim.new(0, 12) pad.PaddingBottom = UDim.new(0, 14) pad.Parent = card
    local layCard = Instance.new("UIListLayout")
    layCard.Padding = UDim.new(0, 6) layCard.SortOrder = Enum.SortOrder.LayoutOrder layCard.Parent = card
    local title = Instance.new("TextLabel")
    title.Size = UDim2.new(1, 0, 0, 20) title.BackgroundTransparency = 1
    title.Font = FONT_BOLD title.TextSize = 12 title.TextColor3 = COLOR_TEXT
    title.TextXAlignment = Enum.TextXAlignment.Left title.Text = titleText:upper() title.Parent = card
    title.LayoutOrder = 1
    local bar = Instance.new("Frame")
    bar.Size = UDim2.new(0, 26, 0, 3)
    bar.BackgroundColor3 = ACCENT bar.Parent = card corner(bar, 99)
    bar.LayoutOrder = 2
    local box = Instance.new("Frame")
    box.Size = UDim2.new(1, 0, 0, 0)
    box.AutomaticSize = Enum.AutomaticSize.Y
    box.BackgroundTransparency = 1 box.Parent = card
    box.LayoutOrder = 3
    local lay = Instance.new("UIListLayout")
    lay.Padding = UDim.new(0, 8) lay.SortOrder = Enum.SortOrder.LayoutOrder lay.Parent = box
    return box
end

local function createToggle(parent, text, callback, key, default)
    default = default or false
    local row = Instance.new("TextButton")
    row.Size = UDim2.new(1, 0, 0, 30) row.BackgroundTransparency = 1 row.Text = "" row.Parent = parent
    local lbl = Instance.new("TextLabel")
    lbl.Size = UDim2.new(1, -58, 1, 0) lbl.BackgroundTransparency = 1
    lbl.Font = FONT_MAIN lbl.TextSize = 12 lbl.TextXAlignment = Enum.TextXAlignment.Left
    lbl.TextColor3 = default and COLOR_TEXT or COLOR_SUBTEXT lbl.Text = text lbl.Parent = row
    local track = Instance.new("Frame")
    track.Size = UDim2.new(0, 42, 0, 22) track.Position = UDim2.new(1, -42, 0.5, -11)
    track.BackgroundColor3 = default and ACCENT or Color3.fromRGB(30, 30, 44) track.Parent = row corner(track, 99)
    local knob = Instance.new("Frame")
    knob.Size = UDim2.new(0, 16, 0, 16) knob.Position = default and UDim2.new(1, -19, 0.5, -8) or UDim2.new(0, 3, 0.5, -8)
    knob.BackgroundColor3 = Color3.fromRGB(255, 255, 255) knob.Parent = track corner(knob, 99)
    local state = default
    local function set(v, silent)
        state = v
        lbl.TextColor3 = state and COLOR_TEXT or COLOR_SUBTEXT
        tween(track, TweenInfo.new(0.2), {BackgroundColor3 = state and ACCENT or Color3.fromRGB(30, 30, 44)})
        tween(knob, TweenInfo.new(0.2, Enum.EasingStyle.Back), {Position = state and UDim2.new(1, -19, 0.5, -8) or UDim2.new(0, 3, 0.5, -8)})
        if not silent then pcall(callback, state) end
    end
    if key then toggleStates[key] = {Set = function(v) set(v) end, Get = function() return state end} end
    row.MouseButton1Click:Connect(function() set(not state) end)
    if default then pcall(callback, true) end
    return {Set = set}
end

local function createSlider(parent, titlePrefix, defaultVal, minVal, maxVal, callback)
    local box = Instance.new("Frame")
    box.Size = UDim2.new(1, 0, 0, 46) box.BackgroundTransparency = 1 box.Parent = parent
    local label = Instance.new("TextLabel")
    label.Size = UDim2.new(1, 0, 0, 18) label.BackgroundTransparency = 1
    label.Font = FONT_MAIN label.TextSize = 12 label.TextColor3 = COLOR_SUBTEXT
    label.TextXAlignment = Enum.TextXAlignment.Left
    label.Text = titlePrefix .. ":  " .. tostring(defaultVal) label.Parent = box
    local valBadge = Instance.new("TextLabel")
    valBadge.Size = UDim2.new(0, 52, 0, 18) valBadge.Position = UDim2.new(1, -52, 0, 0)
    valBadge.BackgroundColor3 = COLOR_CARD2 valBadge.Font = FONT_BOLD valBadge.TextSize = 11
    valBadge.TextColor3 = ACCENT valBadge.Text = tostring(defaultVal) valBadge.Parent = box corner(valBadge, 6)
    local bar = Instance.new("TextButton")
    bar.Size = UDim2.new(1, 0, 0, 8) bar.Position = UDim2.new(0, 0, 0, 28)
    bar.BackgroundColor3 = Color3.fromRGB(28, 28, 42) bar.Text = "" bar.AutoButtonColor = false bar.Parent = box corner(bar, 99)
    local fill = Instance.new("Frame")
    local p0 = (defaultVal - minVal) / math.max(1, (maxVal - minVal))
    fill.Size = UDim2.new(p0, 0, 1, 0) fill.BackgroundColor3 = ACCENT fill.Parent = bar corner(fill, 99)
    local knob = Instance.new("Frame")
    knob.Size = UDim2.new(0, 14, 0, 14) knob.AnchorPoint = Vector2.new(0.5, 0.5)
    knob.Position = UDim2.new(p0, 0, 0.5, 0) knob.BackgroundColor3 = Color3.fromRGB(255, 255, 255) knob.Parent = bar corner(knob, 99)
    local dragging = false
    local function apply(xPos)
        local bp, bs = bar.AbsolutePosition.X, math.max(1, bar.AbsoluteSize.X)
        local c = math.clamp((xPos - bp) / bs, 0, 1)
        local val = math.floor(minVal + c * (maxVal - minVal))
        fill.Size = UDim2.new(c, 0, 1, 0) knob.Position = UDim2.new(c, 0, 0.5, 0)
        label.Text = titlePrefix .. ":  " .. tostring(val) valBadge.Text = tostring(val)
        pcall(callback, val)
    end
    bar.InputBegan:Connect(function(i)
        if i.UserInputType == Enum.UserInputType.MouseButton1 or i.UserInputType == Enum.UserInputType.Touch then
            dragging = true apply(i.Position.X)
        end
    end)
    TCONN(UserInputService.InputEnded:Connect(function(i)
        if i.UserInputType == Enum.UserInputType.MouseButton1 or i.UserInputType == Enum.UserInputType.Touch then dragging = false end
    end))
    TCONN(UserInputService.InputChanged:Connect(function(i)
        if dragging and (i.UserInputType == Enum.UserInputType.MouseMovement or i.UserInputType == Enum.UserInputType.Touch) then apply(i.Position.X) end
    end))
end

local function createDropdown(parent, title, list, default, callback)
    local idx = 1
    for i, v in ipairs(list) do if v == default then idx = i break end end
    local row = Instance.new("Frame")
    row.Size = UDim2.new(1, 0, 0, 32) row.BackgroundTransparency = 1 row.Parent = parent
    local lbl = Instance.new("TextLabel")
    lbl.Size = UDim2.new(0, 170, 1, 0) lbl.BackgroundTransparency = 1
    lbl.Font = FONT_MAIN lbl.TextSize = 12 lbl.TextXAlignment = Enum.TextXAlignment.Left
    lbl.TextColor3 = COLOR_SUBTEXT lbl.Text = title lbl.Parent = row
    local b = Instance.new("TextButton")
    b.Size = UDim2.new(0, 170, 0, 28) b.Position = UDim2.new(1, -170, 0.5, -14)
    b.BackgroundColor3 = COLOR_CARD2 b.Font = FONT_BOLD b.TextSize = 11
    b.TextColor3 = ACCENT b.Text = list[idx] b.Parent = row corner(b, 7)
    stroke(b, Color3.fromRGB(45, 45, 65), 1)
    pcall(callback, list[idx])
    b.MouseButton1Click:Connect(function()
        idx = idx + 1 if idx > #list then idx = 1 end
        b.Text = list[idx] pcall(callback, list[idx])
    end)
    return b
end

local function createButton(parent, text, callback)
    local b = Instance.new("TextButton")
    b.Size = UDim2.new(1, 0, 0, 34) b.Font = FONT_BOLD b.TextSize = 12
    b.TextColor3 = COLOR_TEXT b.BackgroundColor3 = COLOR_CARD2
    b.Text = text b.Parent = parent corner(b, 8)
    stroke(b, Color3.fromRGB(40, 40, 60), 1)
    b.MouseButton1Click:Connect(function() pcall(callback) end)
    return b
end

--// Contenido: Asistencia + Radar + Ajustes
local c1 = createCard("Asistencia")
createToggle(c1, "Asistencia", function(v) settings.aimEnabled = v end, "aim")
createToggle(c1, "Auto", function(v) settings.aimAuto = v end)
createDropdown(c1, "Punto", {"Head", "Torso"}, "Head", function(v) settings.targetPart = v end)
createSlider(c1, "Vista", settings.fovRadius, 40, 400, function(v) settings.fovRadius = v end)
createSlider(c1, "Suave", settings.smoothing, 1, 100, function(v) settings.smoothing = v end)
createSlider(c1, "Margen", settings.aimDeadzone, 0, 30, function(v) settings.aimDeadzone = v end)
createSlider(c1, "Lejos", settings.maxDistance, 100, 5000, function(v) settings.maxDistance = v end)
createToggle(c1, "Ver círculo", function(v) settings.showFov = v end, nil, true)

local c2 = createCard("Radar")
createToggle(c2, "Radar", function(v) settings.espEnabled = v end, "esp")
createToggle(c2, "Nombres", function(v) settings.espNames = v end, nil, true)
createToggle(c2, "Distancia", function(v) settings.espDistance = v end, nil, true)
createToggle(c2, "Vida", function(v) settings.espHealthBar = v end, nil, true)
createToggle(c2, "Caja", function(v) settings.espBox = v end, nil, true)
createToggle(c2, "Líneas", function(v) settings.espTracer = v end, nil, true)
createToggle(c2, "Esqueleto", function(v) settings.skeleton = v end, nil, true)
createDropdown(c2, "Origen", {"Bottom", "Center"}, "Bottom", function(v) settings.tracerOrigin = v end)
local radarCountLbl = Instance.new("TextLabel")
radarCountLbl.Size = UDim2.new(1, 0, 0, 20) radarCountLbl.BackgroundTransparency = 1
radarCountLbl.Font = FONT_MAIN radarCountLbl.TextSize = 12
radarCountLbl.TextXAlignment = Enum.TextXAlignment.Left radarCountLbl.TextColor3 = COLOR_SUBTEXT
radarCountLbl.Text = "Cuerpos: 0" radarCountLbl.Parent = c2

local c3 = createCard("Ajustes")
createDropdown(c3, "Tecla menú", {"RightShift", "Insert", "P", "L"}, "RightShift", function(v)
    settings.uiToggleKey = Enum.KeyCode[v]
end)
createButton(c3, "Quitar menú", function()
    if _G.__TR_STOP then pcall(_G.__TR_STOP) end
    pcall(function() gui:Destroy() end)
end)

--// FOV + estados en pantalla
local fovFrame = Instance.new("Frame")
fovFrame.AnchorPoint = Vector2.new(0.5, 0.5)
fovFrame.BackgroundTransparency = 1 fovFrame.Visible = false fovFrame.Parent = gui
local fovStroke = stroke(fovFrame, ACCENT, 1.6)
corner(fovFrame, 999)
local aimStatus = Instance.new("TextLabel")
aimStatus.Size = UDim2.new(0, 340, 0, 18) aimStatus.Position = UDim2.new(0, 10, 0, 10)
aimStatus.BackgroundTransparency = 1 aimStatus.Font = FONT_MAIN aimStatus.TextSize = 12
aimStatus.TextColor3 = COLOR_SUBTEXT aimStatus.TextStrokeTransparency = 0.5
aimStatus.Text = "" aimStatus.Parent = gui
local espStatus = Instance.new("TextLabel")
espStatus.Size = UDim2.new(0, 340, 0, 18) espStatus.Position = UDim2.new(0, 10, 0, 30)
espStatus.BackgroundTransparency = 1 espStatus.Font = FONT_MAIN espStatus.TextSize = 11
espStatus.TextColor3 = COLOR_SUBTEXT espStatus.TextStrokeTransparency = 0.5
espStatus.Text = "" espStatus.Parent = gui

--// Botón flotante + botón táctil
local floatBtn = Instance.new("TextButton")
floatBtn.Size = UDim2.new(0, 84, 0, 40) floatBtn.Position = UDim2.new(0, 30, 0, 120)
floatBtn.BackgroundColor3 = COLOR_CARD floatBtn.Font = FONT_TITLE floatBtn.TextSize = 14
floatBtn.TextColor3 = Color3.fromRGB(255, 255, 255) floatBtn.Text = "TR" floatBtn.Parent = gui corner(floatBtn, 12)
floatBtn.MouseButton1Click:Connect(function() mainFrame.Visible = not mainFrame.Visible end)
local isTouch = UserInputService.TouchEnabled and not UserInputService.KeyboardEnabled
local aimBtn = Instance.new("TextButton")
aimBtn.Size = UDim2.new(0, 64, 0, 64) aimBtn.Position = UDim2.new(1, -90, 0.5, -32)
aimBtn.BackgroundColor3 = COLOR_CARD aimBtn.Font = FONT_BOLD aimBtn.TextSize = 13
aimBtn.TextColor3 = ACCENT aimBtn.Text = "FIJ" aimBtn.Visible = false aimBtn.Parent = gui
corner(aimBtn, 999) stroke(aimBtn, ACCENT, 2)
local aimingMobile = false
aimBtn.InputBegan:Connect(function(i)
    if i.UserInputType == Enum.UserInputType.Touch or i.UserInputType == Enum.UserInputType.MouseButton1 then
        aimingMobile = true aimBtn.BackgroundColor3 = ACCENT aimBtn.TextColor3 = Color3.fromRGB(0, 0, 0)
    end
end)
aimBtn.InputEnded:Connect(function()
    aimingMobile = false aimBtn.BackgroundColor3 = COLOR_CARD aimBtn.TextColor3 = ACCENT
end)

TCONN(UserInputService.InputBegan:Connect(function(inp, gp)
    if dead then return end
    if inp.UserInputType == Enum.UserInputType.MouseButton2 then
        _G.__TR_AIMPC = true
    end
    if gp then return end
    if inp.UserInputType == Enum.UserInputType.Keyboard and inp.KeyCode == settings.uiToggleKey then
        mainFrame.Visible = not mainFrame.Visible
    end
end))
TCONN(UserInputService.InputEnded:Connect(function(inp)
    if dead then return end
    if inp.UserInputType == Enum.UserInputType.MouseButton2 then _G.__TR_AIMPC = false end
end))

--// ESP (nombres + caja + líneas + esqueleto, sin resaltado)
local espData = {}
local espCharOf = {}
local function safeDestroy(inst)
    pcall(function()
        if inst and typeof(inst) == "Instance" then
            local cn = inst.ClassName
            if cn == "Model" or cn == "Humanoid" or cn == "HumanoidRootPart" then return end
            if Players:GetPlayerFromCharacter(inst) then return end
            inst:Destroy()
        end
    end)
end
local function clearESP(key)
    local o = espData[key]
    if o then
        safeDestroy(o.bb) safeDestroy(o.line) safeDestroy(o.box)
        if o.sk then for _, f in ipairs(o.sk) do safeDestroy(f) end end
        if o.skj then for _, f in ipairs(o.skj) do safeDestroy(f) end end
        espData[key] = nil
    end
end
local SK_R15 = {
    {"Head", "UpperTorso"}, {"UpperTorso", "LowerTorso"},
    {"UpperTorso", "UpperArmLeft"}, {"UpperArmLeft", "LowerArmLeft"}, {"LowerArmLeft", "HandLeft"},
    {"UpperTorso", "UpperArmRight"}, {"UpperArmRight", "LowerArmRight"}, {"LowerArmRight", "HandRight"},
    {"LowerTorso", "UpperLegLeft"}, {"UpperLegLeft", "LowerLegLeft"}, {"LowerLegLeft", "FootLeft"},
    {"LowerTorso", "UpperLegRight"}, {"UpperLegRight", "LowerLegRight"}, {"LowerLegRight", "FootRight"},
}
local SK_R6 = {
    {"Head", "Torso"}, {"Torso", "Left Arm"}, {"Torso", "Right Arm"}, {"Torso", "Left Leg"}, {"Torso", "Right Leg"},
}
local SK_TRIDENT = {
    {"Head", "Torso"}, {"Torso", "LowerTorso"},
    {"Torso", "RightUpperArm"}, {"RightUpperArm", "RightLowerArm"}, {"RightLowerArm", "RightHand"},
    {"Torso", "LeftUpperArm"}, {"LeftUpperArm", "LeftLowerArm"}, {"LeftLowerArm", "LeftHand"},
    {"LowerTorso", "RightUpperLeg"}, {"RightUpperLeg", "RightLowerLeg"}, {"RightLowerLeg", "RightFoot"},
    {"LowerTorso", "LeftUpperLeg"}, {"LeftUpperLeg", "LeftLowerLeg"}, {"LeftLowerLeg", "LeftFoot"},
}
local function skSeg(objs, i)
    local f = objs.sk[i]
    if not f then
        f = Instance.new("Frame")
        f.AnchorPoint = Vector2.new(0.5, 0.5) f.BorderSizePixel = 0
        f.BackgroundColor3 = ACCENT f.Visible = false f.Parent = gui
        objs.sk[i] = f
    end
    return f
end
local function drawSeg(f, ax, ay, bx, by, col)
    local dx, dy = bx - ax, by - ay
    local len = math.sqrt(dx * dx + dy * dy)
    if len < 1 then f.Visible = false return end
    f.Size = UDim2.new(0, 1, 0, len)
    f.Position = UDim2.new(0, (ax + bx) / 2, 0, (ay + by) / 2)
    f.Rotation = math.deg(math.atan2(dy, dx)) - 90
    f.BackgroundColor3 = col f.BackgroundTransparency = 0.1 f.Visible = true
end
local function skDot(objs, i)
    objs.skj = objs.skj or {}
    local f = objs.skj[i]
    if not f then
        f = Instance.new("Frame")
        f.AnchorPoint = Vector2.new(0.5, 0.5) f.BorderSizePixel = 0
        f.Size = UDim2.new(0, 3, 0, 3)
        f.BackgroundColor3 = ACCENT f.Visible = false f.Parent = gui
        corner(f, 999)
        objs.skj[i] = f
    end
    return f
end
local function hideSk(objs)
    if objs.sk then for _, f in ipairs(objs.sk) do f.Visible = false end end
    if objs.skj then for _, f in ipairs(objs.skj) do f.Visible = false end end
end
local function buildESP(key, char)
    clearESP(key)
    local objs = {}
    objs.sk = {} objs.skj = {}
    local bb = Instance.new("BillboardGui")
    bb.Size = UDim2.new(0, 170, 0, 40) bb.StudsOffset = Vector3.new(0, 2.8, 0) bb.AlwaysOnTop = true
    bb:SetAttribute("TR1", true)
    bb.Adornee = bodyAnchor(char)
    bb.Parent = char
    local name = Instance.new("TextLabel")
    name.Size = UDim2.new(1, 0, 0, 16) name.BackgroundTransparency = 1
    name.Font = FONT_BOLD name.TextSize = 12 name.TextColor3 = Color3.fromRGB(255, 255, 255)
    name.TextStrokeTransparency = 0.4 name.Parent = bb objs.name = name
    local hpBg = Instance.new("Frame")
    hpBg.Size = UDim2.new(1, -40, 0, 5) hpBg.Position = UDim2.new(0, 20, 0, 20)
    hpBg.BackgroundColor3 = Color3.fromRGB(25, 25, 35) hpBg.Parent = bb corner(hpBg, 99) objs.hpBg = hpBg
    local hpFill = Instance.new("Frame")
    hpFill.Size = UDim2.new(1, 0, 1, 0) hpFill.Parent = hpBg corner(hpFill, 99) objs.hpFill = hpFill
    objs.bb = bb
    espCharOf[key] = char
    local line = Instance.new("Frame")
    line.AnchorPoint = Vector2.new(0.5, 0.5) line.BorderSizePixel = 0 line.Visible = false line.Parent = gui objs.line = line
    local box = Instance.new("Frame")
    box.BackgroundTransparency = 1 box.Visible = false box.Parent = gui objs.box = box
    local bs = stroke(box, ACCENT, 1.2) objs.boxStroke = bs
    espData[key] = objs
end
local function updateESP(key, char, label)
    if not char or not char.Parent then clearESP(key) return end
    local root = bodyAnchor(char)
    if not settings.espEnabled or not root then clearESP(key) return end
    local objs = espData[key]
    if not objs or espCharOf[key] ~= char then buildESP(key, char) objs = espData[key] if not objs then return end end
    local hum = nil
    local myP = ownPos()
    if not myP then return end
    local dist = math.floor((myP - root.Position).Magnitude)
    if dist < 5 or dist > settings.maxDistance then
        objs.bb.Enabled = false objs.line.Visible = false objs.box.Visible = false
        hideSk(objs)
        return
    end
    local col = ACCENT
    objs.bb.Enabled = true
    local txt = ""
    if settings.espNames then txt = label .. " " end
    if settings.espDistance then txt = txt .. "[" .. dist .. "m]" end
    objs.name.Text = txt ~= "" and txt or label
    objs.name.Visible = (settings.espNames or settings.espDistance)
    objs.name.TextColor3 = col
    objs.hpBg.Visible = settings.espHealthBar and hum ~= nil
    if hum and settings.espHealthBar then
        local pct = math.clamp(hum.Health / math.max(1, hum.MaxHealth), 0, 1)
        objs.hpFill.Size = UDim2.new(pct, 0, 1, 0)
        objs.hpFill.BackgroundColor3 = Color3.fromHSV(pct * 0.33, 1, 1)
    end
    if settings.espTracer then
        local sp, on = camera:WorldToViewportPoint(root.Position)
        if on then
            local vs = camera.ViewportSize local startV
            if settings.tracerOrigin == "Center" then startV = Vector2.new(vs.X / 2, vs.Y / 2)
            else startV = Vector2.new(vs.X / 2, vs.Y) end
            local endV = Vector2.new(sp.X, sp.Y)
            local d = (endV - startV).Magnitude
            objs.line.Size = UDim2.new(0, 1.25, 0, d)
            objs.line.Position = UDim2.new(0, (startV.X + endV.X) / 2, 0, (startV.Y + endV.Y) / 2)
            objs.line.Rotation = math.deg(math.atan2(endV.Y - startV.Y, endV.X - startV.X)) - 90
            objs.line.BackgroundColor3 = col objs.line.Visible = true
        else objs.line.Visible = false end
    else objs.line.Visible = false end
    if settings.espBox then
        local head = findPart(char, "Head")
        local _, on = camera:WorldToViewportPoint(root.Position)
        if on then
            local top3d = head and (head.Position + Vector3.new(0, 0.6, 0)) or (root.Position + Vector3.new(0, 2.5, 0))
            local hp = camera:WorldToViewportPoint(top3d)
            local lp = camera:WorldToViewportPoint(root.Position - Vector3.new(0, 3, 0))
            local h = math.abs(hp.Y - lp.Y) local w = h * 0.62
            if h > 4 then
                objs.box.Size = UDim2.new(0, w, 0, h)
                objs.box.Position = UDim2.new(0, hp.X - w / 2, 0, hp.Y)
                objs.box.Visible = true objs.boxStroke.Color = col
            else objs.box.Visible = false end
        else objs.box.Visible = false end
    else objs.box.Visible = false end
    if settings.skeleton then
        local pm = {}
        for _, c in ipairs(char:GetDescendants()) do
            if c:IsA("BasePart") and pm[c.Name] == nil then pm[c.Name] = c end
        end
        local segs, dots = {}, {}
        local function dotP(p)
            for _, q in ipairs(dots) do
                if (q - p).Magnitude < 0.05 then return end
            end
            if #dots < 16 then dots[#dots + 1] = p end
        end
        if pm["UpperTorso"] or pm["LowerTorso"] then
            for _, s in ipairs(pm["UpperTorso"] and SK_R15 or SK_TRIDENT) do
                local a, b = pm[s[1]], pm[s[2]]
                if a and b then
                    segs[#segs + 1] = {a.Position, b.Position}
                    dotP(a.Position) dotP(b.Position)
                end
            end
        else
            local torso, head = pm["Torso"], pm["Head"]
            if torso then
                local cf = torso.CFrame
                local up, rt = cf.UpVector, cf.RightVector
                local sx, sy = torso.Size.X / 2, torso.Size.Y / 2
                local neck = torso.Position + up * sy
                local hipC = torso.Position - up * sy
                local shL = torso.Position - rt * sx + up * (sy * 0.6)
                local shR = torso.Position + rt * sx + up * (sy * 0.6)
                if head then segs[#segs + 1] = {head.Position, neck} dotP(head.Position) end
                dotP(neck) dotP(hipC) dotP(shL) dotP(shR)
                local limbs = {{"Left Arm", shL}, {"Right Arm", shR}, {"Left Leg", hipC}, {"Right Leg", hipC}}
                for _, L in ipairs(limbs) do
                    local p = pm[L[1]]
                    if p then segs[#segs + 1] = {L[2], p.Position} dotP(p.Position) end
                end
            elseif head then
                dotP(head.Position)
            end
        end
        local si = 0
        for _, s in ipairs(segs) do
            local sa, ona = camera:WorldToViewportPoint(s[1])
            local sb, onb = camera:WorldToViewportPoint(s[2])
            si = si + 1
            local f = skSeg(objs, si)
            if ona and onb then drawSeg(f, sa.X, sa.Y, sb.X, sb.Y, col)
            else f.Visible = false end
        end
        for i = si + 1, #objs.sk do objs.sk[i].Visible = false end
        local di = 0
        for _, p in ipairs(dots) do
            local sp, on = camera:WorldToViewportPoint(p)
            di = di + 1
            local d = skDot(objs, di)
            if on then
                d.Position = UDim2.new(0, sp.X, 0, sp.Y)
                d.BackgroundColor3 = col d.Visible = true
            else d.Visible = false end
        end
        for i = di + 1, #(objs.skj or {}) do objs.skj[i].Visible = false end
    else hideSk(objs) end
end
TCONN(Players.PlayerRemoving:Connect(function(plr)
    if not dead then clearESP(plr) espCharOf[plr] = nil end
end))

--// Loop principal: FOV + ESP + asistencia
local espFrame = 0
local espDiagLast = 0
local espErr = nil
TCONN(RunService.RenderStepped:Connect(function(dt)
    if dead then return end
    local freshCam = workspace.CurrentCamera
    if freshCam then camera = freshCam end
    if not camera then return end
    local okLoop, errLoop = pcall(function()
        -- FOV
        local ml = nil
        if isTouch then
            local vs = camera.ViewportSize
            ml = Vector2.new(vs.X / 2, vs.Y / 2)
        else
            ml = UserInputService:GetMouseLocation()
        end
        local wantFov = settings.aimEnabled and settings.showFov
        fovFrame.Visible = wantFov
        aimBtn.Visible = settings.aimEnabled and isTouch
        if wantFov then
            fovFrame.Position = UDim2.new(0, ml.X, 0, ml.Y)
            fovFrame.Size = UDim2.new(0, settings.fovRadius * 2, 0, settings.fovRadius * 2)
            fovStroke.Thickness = 1.6
        end
        -- ESP: cuerpos custom (busqueda profunda + fallback)
        espFrame = espFrame + 1
        if settings.espEnabled then
            local targets = {}
            for _, m in ipairs(collectBodies()) do
                targets[#targets + 1] = {key = m, char = m, label = "Jugador"}
            end
            for i, t in ipairs(targets) do
                if (i + espFrame) % 2 == 0 then
                    local okE, errE = pcall(updateESP, t.key, t.char, t.label)
                    if not okE and not espErr then espErr = errE end
                end
            end
            local nowE = tick()
            if nowE - espDiagLast > 0.5 then
                espDiagLast = nowE
                if espErr then
                    espStatus.Text = "Radar err: " .. tostring(espErr):sub(1, 90)
                    espStatus.TextColor3 = Color3.fromRGB(255, 110, 120)
                    radarCountLbl.Text = "Cuerpos: err"
                    espErr = nil
                else
                    espStatus.Text = string.format("Radar: %d", #targets)
                    espStatus.TextColor3 = (#targets > 0) and Color3.fromRGB(80, 255, 130) or Color3.fromRGB(255, 200, 80)
                    radarCountLbl.Text = string.format("Cuerpos: %d", #targets)
                end
            end
        else
            espStatus.Text = ""
            radarCountLbl.Text = "Cuerpos: 0"
            for k, _ in pairs(espData) do clearESP(k) end
        end
        -- Asistencia estilo cámara
        do
            local aiming = (_G.__TR_AIMPC or aimingMobile) or settings.aimAuto
            if not settings.aimEnabled then
                aimStatus.Text = ""
            elseif not aiming then
                aimStatus.Text = "Listo - mantén click derecho"
                aimStatus.TextColor3 = COLOR_SUBTEXT
            else
                local myP = ownPos()
                local bestPart, bestD, bestName = nil, settings.fovRadius, ""
                local cAlive, cScreen = 0, 0
                local camP = camera.CFrame.Position
                local function consider(model, label)
                    if not model or not model.Parent then return end
                    cAlive = cAlive + 1
                    local tp = findPart(model, settings.targetPart)
                        or findPart(model, "Head") or findPart(model, "Torso")
                    if not tp then return end
                    local dp = (myP - tp.Position).Magnitude
                    if dp < 5 or dp > settings.maxDistance then return end
                    local sp, on = camera:WorldToViewportPoint(tp.Position)
                    if not on then return end
                    cScreen = cScreen + 1
                    local d = (Vector2.new(sp.X, sp.Y) - ml).Magnitude
                    if d <= settings.fovRadius and d < bestD then
                        bestD = d bestPart = tp bestName = label
                    end
                end
                if myP then
                    for _, m in ipairs(collectBodies()) do
                        consider(m, "Jugador")
                    end
                end
                if bestPart then
                    aimStatus.Text = "● " .. tostring(bestName)
                    aimStatus.TextColor3 = Color3.fromRGB(80, 255, 130)
                    if bestD > (settings.aimDeadzone or 0) then
                        local alpha = math.clamp(settings.smoothing / 100, 0.05, 1)
                        pcall(function()
                            camera.CFrame = camera.CFrame:Lerp(
                                CFrame.new(camera.CFrame.Position, bestPart.Position), alpha)
                        end)
                    end
                else
                    aimStatus.Text = string.format("● 0 (%d vivos %d pant)", cAlive, cScreen)
                    aimStatus.TextColor3 = Color3.fromRGB(255, 200, 80)
                end
            end
        end
    end)
    if not okLoop then
        -- silencioso a propósito (la consola la lee el anticheat)
    end
end))

--// Entrada: click derecho PC
TCONN(UserInputService.InputBegan:Connect(function(inp, gp)
    if dead then return end
    if inp.UserInputType == Enum.UserInputType.Keyboard then
        if gp then return end
    end
end))

--// Mostrar
mainFrame.Visible = true
