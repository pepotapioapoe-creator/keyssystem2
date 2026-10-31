-- Script path: game:GetService("Workspace").mmggy1767.ACS_Client
-- Decompile time: 97.36 ms

repeat
    wait()
until game.Players.LocalPlayer.Character

local LocalPlayer = game.Players.LocalPlayer
local Character = LocalPlayer.Character
local CurrentCamera_2 = workspace.CurrentCamera

LocalPlayer:GetMouse()

local u15 = nil
local u16 = nil
local u17 = nil
local u18 = nil
local u19 = nil
local v1 = game:GetService("ContextActionService")

local function isJugg() -- Line: 19; upvalues: LocalPlayer (val)
    return LocalPlayer:GetAttribute("Juggernaut") == true
end

local ACS_Engine = game.ReplicatedStorage:WaitForChild("ACS_Engine")
local Eventos = ACS_Engine:WaitForChild("Eventos")
local Modulos = ACS_Engine:WaitForChild("Modulos")
local HUD = ACS_Engine:WaitForChild("HUD")
local FX = ACS_Engine:WaitForChild("FX")
local GunMods = ACS_Engine:WaitForChild("GunMods")
local GunModels = ACS_Engine:WaitForChild("GunModels")
local Client = GunModels:WaitForChild("Client")

GunModels:WaitForChild("Server")

local Utilities = require(Modulos:WaitForChild("Utilities"))
local u77 = require(Modulos:WaitForChild("SetupModule"))
local Hitmarker = require(Modulos:WaitForChild("Hitmarker"))
local Spring = require(Modulos:WaitForChild("Spring"))
local Config = require(ACS_Engine.ServerConfigs:WaitForChild("Config"))
local u102 = workspace:WaitForChild("ACS_WorkSpace")
local u103 = nil
local u104 = nil
local u105 = nil
local LocalPlayer_2 = game.Players.LocalPlayer
local Character_2 = LocalPlayer_2.Character
local Humanoid = Character_2:WaitForChild("Humanoid")
local Mouse_2 = LocalPlayer_2:GetMouse()
local UserInputService = game:GetService("UserInputService")
local CurrentCamera = workspace.CurrentCamera
local u124 = false
local u125 = false
local Saude = Character_2:WaitForChild("Saude")
local Correndo = Saude.Stances:WaitForChild("Correndo")
local u136 = CFrame.new()
local u137 = nil
local u138 = nil
local u139 = nil
local u140 = nil
local u141 = nil
local u142 = nil
local u143 = nil
local u144 = nil
local u145 = nil
local u146 = nil
local u147 = nil
local u148 = nil
local u149 = nil
local u150 = nil
local u151 = nil
local u152 = nil
local u153 = nil
local u154 = nil
local u155 = nil
local u156 = false
local u158 = time()
local u159 = nil
local u160 = true
local u161 = 1
local u162 = 0
local u163 = false
local u164 = false
local u165 = false
local u166 = true
local u167 = false
local u168 = false
local u169 = false
local u170 = nil
local u171 = true
local ModStorage = LocalPlayer_2.PlayerGui:FindFirstChild("ModStorage")

if not ModStorage then
    ModStorage = Instance.new("Folder")
end

ModStorage.Parent = LocalPlayer_2.PlayerGui
ModStorage.Name = "ModStorage"
local u184 = false
local u185 = false
local u186 = 0
local u187 = false
local u188 = false
local u189 = false
local u190 = nil
local u191 = false
local u192 = false
local u193 = false
local u194 = nil
local u195 = nil
local u196 = nil
local u197 = nil
local u198 = 999
local u199 = nil
local u200 = nil
local u201 = nil
local u202 = nil
local u211 = nil
local u212 = nil
local u215 = nil
local u217 = nil
local u218 = nil
local abs = math.abs
local floor = math.floor
local v2 = math.ceil
local v3 = math.rad
local v4 = math.sin
local v5 = math.cos
local v6 = math.tan
local v7 = Vector2.new
local new = Vector3.new
local v8 = CFrame.new
local v9 = CFrame.Angles
v9 = table.insert
local u232 = false
v9 = Instance.new
local new_2 = CFrame.new
local Angles = CFrame.Angles
v7 = math.asin
v7 = math.abs
v7 = math.min
v7 = math.max
v7 = math.random
local u242 = tick()
local u243 = 0
v7 = Spring.new((new()))
local u254 = Spring.new((new()))
local u259 = Spring.new((new()))
local u260 = 1
u259.s = 10
u259.d = 1
v7.s = 10
v7.d = 0.15
u254.s = 10
u254.d = 1
local u267 = 0.25
local u269 = new_2()
local u275 = game:GetService("TweenService")

game:GetService("RunService")

local u287 = Character:WaitForChild("Humanoid")
Character:WaitForChild("Head")

v3 = Character:WaitForChild("Torso")
local u302 = Character:WaitForChild("HumanoidRootPart")

u302:WaitForChild("RootJoint")
v3:WaitForChild("Neck")
v3:WaitForChild("Right Shoulder")
v3:WaitForChild("Left Shoulder")
v3:WaitForChild("Right Hip")
v3:WaitForChild("Left Hip")

local u333 = {}
local u339 = game:GetService("Debris")
local u345 = u102:FindFirstChild("Server")
local u350 = u102:FindFirstChild("Client")
local u354 = {Character_2, u345, CurrentCamera, u350, {"Ignorable", "Glass"}}
CurrentCamera.CameraType = Enum.CameraType.Custom
CurrentCamera.CameraSubject = u287
local u366 = Instance.new("Part")
u366.Name = "BasePart"
u366.Parent = CurrentCamera
u366.Anchored = true
u366.CanCollide = false
u366.Transparency = 1
u366.Size = Vector3.new(0.10000000149011612, 0.10000000149011612, 0.10000000149011612)
HeadBaseAtt = Instance.new("Attachment")
HeadBaseAtt.Parent = u366
local v10 = HUD:WaitForChild("StatusUI")
local StatusUI = LocalPlayer.PlayerGui:FindFirstChild("StatusUI")

if not StatusUI then
    StatusUI = v10:Clone()
    StatusUI.Parent = LocalPlayer.PlayerGui
end

if Config.EnableHunger then
    StatusUI.FomeSede.Disabled = false
end

if Config.EnableGPS then
    local v11 = HUD:WaitForChild("GPShud"):Clone()
    v11.Parent = LocalPlayer.PlayerGui
    v11.GPS.Disabled = false
end

function ResetWorkspace() -- Line: 222; upvalues: u345 (val), u350 (val)
    u345:ClearAllChildren()
    u350:ClearAllChildren()
    workspace.Terrain:ClearAllChildren()
end

ResetWorkspace()

Eventos.Hit.OnClientEvent:Connect(function(a1, a2, a3, a4, a5, a6)
    -- Line: 230
    -- upvalues: LocalPlayer (val), Hitmarker (val), u354 (ref), u102 (val)
    if a1 ~= LocalPlayer then
        Hitmarker.HitEffect(u354, u102, a2, a3, a4, a5, a6)
    end
end)

Eventos.HeadRot.OnClientEvent:Connect(function(a1, a2, a3, a4) -- Line: 236; upvalues: LocalPlayer (val)
    if a1 ~= LocalPlayer
        and a1.Character
        and a1.Character:FindFirstChild("HumanoidRootPart") ~= nil then
        local v1 = a1.Character.HumanoidRootPart.CFrame * CFrame.new(0, 1.5, 0)
            * CFrame.new(a3)
        local Neck = a1.Character.Torso:WaitForChild("Neck")
        Neck.C0 = a1.Character.Torso.CFrame:toObjectSpace(v1)
        local Neck_2 = a1.Character.Torso:WaitForChild("Neck")
        Neck_2.C1 = CFrame.Angles(a2, 0, 0)
    end
end)

Eventos.Atirar.OnClientEvent:Connect(function(a1, a2, a3, a4) -- Line: 244; upvalues: LocalPlayer (val), u275 (val)
    if a1 ~= LocalPlayer then
        if a1.Character:FindFirstChild("S" .. a4.Name) ~= nil
            and a1.Character["S" .. a4.Name].Grip:FindFirstChild("Muzzle") ~= nil then
            local Muzzle = a1.Character["S" .. a4.Name].Grip:FindFirstChild("Muzzle")
            local v1 = a1.Character["S" .. a4.Name]

            if v1:FindFirstChild("Silenciador") == nil
                or a1.Character["S" .. a4.Name].Silenciador.Transparency ~= 0 then
                local FlashFX_2 = Muzzle:FindFirstChild("FlashFX")
                FlashFX_2.Brightness = 5
                v1 = Muzzle:FindFirstChild("FlashFX[Flash]")
                v1.Rate = 1000
            else
                local FlashFX = Muzzle:FindFirstChild("FlashFX")
                FlashFX.Brightness = 0
                v1 = Muzzle:FindFirstChild("FlashFX[Flash]")
                v1.Rate = 0
            end

            for k, v in pairs(Muzzle:GetChildren()) do
                if v.Name:sub(1, 7) == "FlashFX" or v.Name:sub(1, 7) == "Smoke" then
                    v.Enabled = true
                end
            end

            delay(
                0.03333333333333333,
                function() -- Line: 266; upvalues: Muzzle (val)
                    for k, v in pairs(Muzzle:GetChildren()) do
                        if v.Name:sub(1, 7) == "FlashFX" or v.Name:sub(1, 7) == "Smoke" then
                            v.Enabled = false
                        end
                    end
                end
            )
        end

        if a1.Character:FindFirstChild("AnimBase") ~= nil
            and a1.Character.AnimBase:FindFirstChild("AnimBaseW") then
            local AnimBaseW = (a1.Character:WaitForChild("AnimBase")):WaitForChild("AnimBaseW")
            u275:Create(
                AnimBaseW,
                TweenInfo.new(a2),
                {C1 = a3.ShootPos}
            ):Play()

            wait(a2 * 2)

            u275:Create(
                AnimBaseW,
                TweenInfo.new(0.2),
                {C1 = CFrame.new()}
            ):Play()
        end
    end
end)

function Setup(a1)
    -- Line: 286
    -- upvalues: Character_2 (val), u17 (ref), u18 (ref), Client (val), u103 (ref), u104 (ref), u105 (ref), u137 (ref)
    -- upvalues: u138 (ref), u139 (ref), u140 (ref), u141 (ref), u142 (ref), u143 (ref), u190 (ref), u144 (ref)
    -- upvalues: u145 (ref), u146 (ref), u150 (ref), u153 (ref), u151 (ref), u147 (ref), u149 (ref), u148 (ref)
    -- upvalues: u152 (ref), u154 (ref), u155 (ref), Eventos (val), u215 (ref), CurrentCamera (val), u211 (ref)
    -- upvalues: u212 (ref), u366 (ref), u217 (ref), Utilities (val), u201 (ref), u202 (ref), u200 (ref), u199 (ref)
    -- upvalues: u77 (val), u124 (ref)
    Character_2:FindFirstChild("Torso")
    Character_2:FindFirstChild("Head")
    Character_2:FindFirstChild("HumanoidRootPart")

    u17 = a1
    u18 = Client:WaitForChild(u17.Name):Clone()
    u103 = a1.ACS_Modulo.Variaveis
    u104 = require(u103:WaitForChild("Settings"))
    u105 = require(u103:WaitForChild("Animations"))
    u137 = math.random(u104.VRecoil[1], u104.VRecoil[2]) / 1000
    u138 = math.random(u104.HRecoil[1], u104.HRecoil[2]) / 1000
    u139 = u104.VPunchBase
    u140 = u104.HPunchBase
    u141 = u104.DPunchBase
    u142 = u104.MinRecoilPower
    u143 = u104.MinSpread
    u190 = u103.Suppressor
    local Ammo = u103.Ammo
    local StoredAmmo = u103.StoredAmmo
    local LauncherAmmo = u103.LauncherAmmo
    u144 = Ammo
    u145 = StoredAmmo
    u146 = LauncherAmmo
    local Chambered = u103.Chambered
    local Emperrado = u103.Emperrado
    local GLChambered = u103.GLChambered
    u150 = Chambered
    u153 = Emperrado
    u151 = GLChambered
    u147 = 1 / (u104.FireRate / 60)
    u149 = math.max(u147, u104.ShotCooldown or 0)
    u148 = 1 / (u104.BurstFireRate / 60)
    u152 = u104.ModoTreino
    u154 = u103.Sens
    u155 = u103.Zeroing

    Eventos.Equipar:FireServer(u17, u104)

    u215 = Instance.new("Model", CurrentCamera)
    u215.Name = a1.Name
    u211 = Instance.new("Part", u215)
    u211.FormFactor = "Custom"
    u211.CanCollide = false
    u211.Transparency = 1
    u211.Anchored = true
    u211.Name = "AnimBase"
    u211.Size = Vector3.new(0.10000000149011612, 0.10000000149011612, 0.10000000149011612)
    u212 = Instance.new("Motor6D")
    u212.Part0 = u211
    u212.Part1 = u366
    u212.Parent = u211
    u212.Name = "AnimBaseW"
    u211.Anchored = false
    u217 = Instance.new("Motor6D")
    u217.Name = "Clone"
    u217.Parent = u211
    u217.Part0 = u211
    u217.Part1 = u366
    u18.Parent = u215

    for k, v in pairs(u18:GetChildren()) do
        if v:IsA("BasePart") and v.Name ~= "Handle" then
            if v.Name ~= "Bolt" and v.Name ~= "Lid" then
                Utilities.Weld(v, u18:WaitForChild("Handle"))
            end

            if v.Name == "Bolt" or v.Name == "Slide" then
                Utilities.WeldComplex(u18:WaitForChild("Handle"), v, v.Name)
            end

            if v.Name == "Lid" then
                if not u18:FindFirstChild("LidHinge") then
                    Utilities.Weld(v, u18:WaitForChild("Handle"))
                else
                    Utilities.Weld(v, u18:WaitForChild("LidHinge"))
                end
            end
        end
    end

    for k2, i in pairs(u18:GetChildren()) do
        if i:IsA("BasePart") and i.Name ~= "Grip" then
            i.Anchored = false
            i.CanCollide = false
        end
    end

    local v1, v2, v3, v4, v5, v6 = u77(u215, Utilities, Character_2, u201, u202, u200, u199, u211, u212, u104, u18)
    u201 = v1
    u202 = v2
    u200 = v3
    u199 = v4
    u211 = v5
    u212 = v6
    u124 = true

    if u18:FindFirstChild("Silenciador") ~= nil then
        if u190.Value == true then
            u18.Silenciador.Transparency = 0
            u18.SmokePart.FlashFX.Brightness = 0
            v1 = u18.SmokePart:FindFirstChild("FlashFX[Flash]")
            v1.Rate = 0

            Eventos.SilencerEquip:FireServer(u17, u190.Value)

            return
        end

        u18.Silenciador.Transparency = 1
        u18.SmokePart.FlashFX.Brightness = 5
        v1 = u18.SmokePart:FindFirstChild("FlashFX[Flash]")
        v1.Rate = 1000

        Eventos.SilencerEquip:FireServer(u17, u190.Value)
    end
end

function Unset()
    -- Line: 395
    -- upvalues: u17 (ref), Eventos (val), u104 (ref), u215 (ref), u124 (ref), u184 (ref), u167 (ref), u188 (ref)
    -- upvalues: u191 (ref), u193 (ref), u192 (ref), u169 (ref), u185 (ref), u165 (ref), u164 (ref)
    -- upvalues: UserInputService (val), CurrentCamera (val), LocalPlayer_2 (val), u161 (ref), u186 (ref), u275 (val)
    -- upvalues: StatusUI (ref), u159 (ref), u333 (ref), u232 (ref)
    if u17 then
        Eventos.Desequipar:FireServer(u17, u104)
    end

    UnloadClientMods()

    if u215 then
        u215:Destroy()
    end

    u124 = false
    u184 = false
    u167 = false
    u188 = false
    u191 = false
    u193 = false
    u192 = false
    u169 = false
    u185 = false
    u165 = false
    u164 = false
    UserInputService.MouseIconEnabled = true
    local UserInputService_2 = game:GetService("UserInputService")
    UserInputService_2.MouseDeltaSensitivity = 1
    CurrentCamera.CameraType = Enum.CameraType.Custom
    LocalPlayer_2.CameraMode = Enum.CameraMode.Classic
    u161 = 1
    u186 = 0

    tweenFoV(70, 15)

    u275:Create(
        StatusUI.Efeitos.Aim,
        TweenInfo.new(0.3),
        {ImageTransparency = 1}
    ):Play()

    local v1 = u193
    Eventos.SVLaser:FireServer(Vector3.new(0, 0, 0), 2, nil, u17, v1)

    if u159 then
        u159.Visible = false
    end

    for k, v in pairs(u333) do
        v:disconnect()
    end

    u333 = {}
    u232 = false
    a = false
    d = false
end

function Update_Gui()
    -- Line: 439
    -- upvalues: u160 (ref), u18 (ref), u159 (ref), u104 (ref), u144 (ref), u151 (ref), u167 (ref), u150 (ref)
    -- upvalues: u153 (ref), u154 (ref), u155 (ref), u145 (ref), u146 (ref), u190 (ref), u192 (ref), u193 (ref)
    -- upvalues: u191 (ref)
    if u160 then
        if u18:FindFirstChild("BipodPoint") == nil then
            u159.Bipod.Visible = false
        else
            u159.Bipod.Visible = true
        end

        if u104.ArcadeMode ~= true then
            u159.Ammo.Visible = false
        else
            u159.Ammo.Visible = true
            u159.Ammo.AText.Text = u144.Value .. "|" .. u104.Ammo
        end

        if u104.FireModes.Explosive ~= true then
            if u104.FireModes.Explosive ~= true then
                if u104.FireModes.Explosive == false then
                    u159.E.Visible = false
                end
            elseif u151.Value == false then
                u159.E.ImageColor3 = Color3.fromRGB(255, 0, 0)
                u159.E.Visible = true
            elseif u104.FireModes.Explosive == false then
                u159.E.Visible = false
            end
        elseif u151.Value == true then
            u159.E.ImageColor3 = Color3.fromRGB(255, 255, 255)
            u159.E.Visible = true
        elseif u104.FireModes.Explosive ~= true then
            if u104.FireModes.Explosive == false then
                u159.E.Visible = false
            end
        elseif u151.Value == false then
            u159.E.ImageColor3 = Color3.fromRGB(255, 0, 0)
            u159.E.Visible = true
        elseif u104.FireModes.Explosive == false then
            u159.E.Visible = false
        end

        if u167 ~= true then
            u159.A.Visible = false
        else
            u159.A.Visible = true
        end

        if u150.Value ~= true or not (0 < u144.Value) then
            if u150.Value ~= true or not (0 < u144.Value) or u153.Value ~= true then
                u159.B.Visible = false
            else
                u159.B.Visible = true
                u159.B.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
            end
        elseif u153.Value == false then
            u159.B.Visible = true
            u159.B.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        elseif u150.Value ~= true or not (0 < u144.Value) or u153.Value ~= true then
            u159.B.Visible = false
        else
            u159.B.Visible = true
            u159.B.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
        end

        u159.FText.Text = u104.Mode

        if u104.Mode == "Explosive" then
            u159.BText.Text = "HEDP"
        else
            u159.BText.Text = u104.BulletType
        end

        u159.Sens.Text = u154.Value / 100
        u159.ZeText.Text = u155.Value .. " m"
        u159.NText.Text = u104.Name

        if u104.Mode == "Explosive" then
            u159.SAText.Text = u146.Value
        elseif not u104.MagCount then
            u159.SAText.Text = u145.Value
        else
            u159.SAText.Text = math.ceil(u145.Value / u104.Ammo)
        end

        if u190.Value ~= true then
            u159.Silencer.Visible = false
        else
            u159.Silencer.Visible = true
        end

        if u192 ~= true then
            u159.Laser.Visible = false
        else
            u159.Laser.Visible = true

            if not u193 then
                u159.Laser.ImageColor3 = Color3.new(255, 255, 255)
            else
                u159.Laser.ImageColor3 = Color3.new(0, 255, 0)
            end
        end

        if u191 == true then
            u159.Flash.Visible = true
            return
        end

        u159.Flash.Visible = false
    end
end

function CheckMagFunction() -- Line: 527; upvalues: u160 (ref), u159 (ref), u144 (ref), u104 (ref), u275 (val)
    if u160 then
        u159.CMText.TextTransparency = 0
        u159.CMText.TextStrokeTransparency = 0.9
        local Value = u144.Value

        if not (u104.Ammo <= Value) then
            local Value_4, Value_6
            local Value_2 = u144.Value

            if not (math.floor(u104.Ammo * 0.75) < Value_2) then
                if u144.Value < math.floor(u104.Ammo * 0.75) then
                    Value_4 = u144.Value

                    if math.floor(u104.Ammo * 0.5) < Value_4 then
                        u159.CMText.Text = "Almost half"
                    elseif u144.Value ~= math.floor(u104.Ammo * 0.5) then
                        Value_6 = u144.Value

                        if not (math.ceil(u104.Ammo * 0.25) < Value_6) then
                            if not (u144.Value < math.ceil(u104.Ammo * 0.25)) then
                                if u144.Value == 0 then
                                    u159.CMText.Text = "Empty"
                                end
                            elseif 0 < u144.Value then
                                u159.CMText.Text = "Almost empty"
                            elseif u144.Value == 0 then
                                u159.CMText.Text = "Empty"
                            end
                        elseif u144.Value < math.floor(u104.Ammo * 0.5) then
                            u159.CMText.Text = "Less than half"
                        elseif not (u144.Value < math.ceil(u104.Ammo * 0.25)) then
                            if u144.Value == 0 then
                                u159.CMText.Text = "Empty"
                            end
                        elseif 0 < u144.Value then
                            u159.CMText.Text = "Almost empty"
                        elseif u144.Value == 0 then
                            u159.CMText.Text = "Empty"
                        end
                    else
                        u159.CMText.Text = "Half"
                    end
                elseif u144.Value ~= math.floor(u104.Ammo * 0.5) then
                    Value_6 = u144.Value

                    if not (math.ceil(u104.Ammo * 0.25) < Value_6) then
                        if not (u144.Value < math.ceil(u104.Ammo * 0.25)) then
                            if u144.Value == 0 then
                                u159.CMText.Text = "Empty"
                            end
                        elseif 0 < u144.Value then
                            u159.CMText.Text = "Almost empty"
                        elseif u144.Value == 0 then
                            u159.CMText.Text = "Empty"
                        end
                    elseif u144.Value < math.floor(u104.Ammo * 0.5) then
                        u159.CMText.Text = "Less than half"
                    elseif not (u144.Value < math.ceil(u104.Ammo * 0.25)) then
                        if u144.Value == 0 then
                            u159.CMText.Text = "Empty"
                        end
                    elseif 0 < u144.Value then
                        u159.CMText.Text = "Almost empty"
                    elseif u144.Value == 0 then
                        u159.CMText.Text = "Empty"
                    end
                else
                    u159.CMText.Text = "Half"
                end
            elseif u144.Value < u104.Ammo then
                u159.CMText.Text = "Nearly full"
            elseif u144.Value < math.floor(u104.Ammo * 0.75) then
                Value_4 = u144.Value

                if math.floor(u104.Ammo * 0.5) < Value_4 then
                    u159.CMText.Text = "Almost half"
                elseif u144.Value ~= math.floor(u104.Ammo * 0.5) then
                    Value_6 = u144.Value

                    if not (math.ceil(u104.Ammo * 0.25) < Value_6) then
                        if not (u144.Value < math.ceil(u104.Ammo * 0.25)) then
                            if u144.Value == 0 then
                                u159.CMText.Text = "Empty"
                            end
                        elseif 0 < u144.Value then
                            u159.CMText.Text = "Almost empty"
                        elseif u144.Value == 0 then
                            u159.CMText.Text = "Empty"
                        end
                    elseif u144.Value < math.floor(u104.Ammo * 0.5) then
                        u159.CMText.Text = "Less than half"
                    elseif not (u144.Value < math.ceil(u104.Ammo * 0.25)) then
                        if u144.Value == 0 then
                            u159.CMText.Text = "Empty"
                        end
                    elseif 0 < u144.Value then
                        u159.CMText.Text = "Almost empty"
                    elseif u144.Value == 0 then
                        u159.CMText.Text = "Empty"
                    end
                else
                    u159.CMText.Text = "Half"
                end
            elseif u144.Value ~= math.floor(u104.Ammo * 0.5) then
                Value_6 = u144.Value

                if not (math.ceil(u104.Ammo * 0.25) < Value_6) then
                    if not (u144.Value < math.ceil(u104.Ammo * 0.25)) then
                        if u144.Value == 0 then
                            u159.CMText.Text = "Empty"
                        end
                    elseif 0 < u144.Value then
                        u159.CMText.Text = "Almost empty"
                    elseif u144.Value == 0 then
                        u159.CMText.Text = "Empty"
                    end
                elseif u144.Value < math.floor(u104.Ammo * 0.5) then
                    u159.CMText.Text = "Less than half"
                elseif not (u144.Value < math.ceil(u104.Ammo * 0.25)) then
                    if u144.Value == 0 then
                        u159.CMText.Text = "Empty"
                    end
                elseif 0 < u144.Value then
                    u159.CMText.Text = "Almost empty"
                elseif u144.Value == 0 then
                    u159.CMText.Text = "Empty"
                end
            else
                u159.CMText.Text = "Half"
            end
        else
            u159.CMText.Text = "Full"
        end

        u275:Create(
            u159.CMText,
            TweenInfo.new(10),
            {TextTransparency = 1, TextStrokeTransparency = 1}
        ):Play()
    end
end

Eventos.Stance.OnClientEvent:Connect(function(a1, a2, a3, a4) -- Line: 550; upvalues: u275 (val)
    if 0 < a1.Character.Humanoid.Health
        and a1.Character.AnimBase:FindFirstChild("RAW") ~= nil
        and a1.Character.AnimBase:FindFirstChild("LAW") ~= nil then
        local RAW = a1.Character.AnimBase:WaitForChild("RAW")
        local LAW = a1.Character.AnimBase:WaitForChild("LAW")

        if a2 == 0 then
            u275:Create(
                RAW,
                TweenInfo.new(0.3),
                {C0 = a3.RightArmPos}
            ):Play()

            u275:Create(
                LAW,
                TweenInfo.new(0.3),
                {C0 = a3.LeftArmPos}
            ):Play()

            return
        end

        if a2 == 2 then
            u275:Create(
                RAW,
                TweenInfo.new(0.3),
                {C0 = a4.RightAim}
            ):Play()

            u275:Create(
                LAW,
                TweenInfo.new(0.3),
                {C0 = a4.LeftAim}
            ):Play()

            return
        end

        if a2 == 1 then
            u275:Create(
                RAW,
                TweenInfo.new(0.3),
                {C0 = a4.RightHighReady}
            ):Play()

            u275:Create(
                LAW,
                TweenInfo.new(0.3),
                {C0 = a4.LeftHighReady}
            ):Play()

            return
        end

        if a2 == -1 then
            u275:Create(
                RAW,
                TweenInfo.new(0.3),
                {C0 = a4.RightLowReady}
            ):Play()

            u275:Create(
                LAW,
                TweenInfo.new(0.3),
                {C0 = a4.LeftLowReady}
            ):Play()

            return
        end

        if a2 == -2 then
            u275:Create(
                RAW,
                TweenInfo.new(0.3),
                {C0 = a4.RightPatrol}
            ):Play()

            u275:Create(
                LAW,
                TweenInfo.new(0.3),
                {C0 = a4.LeftPatrol}
            ):Play()

            return
        end

        if a2 == 3 then
            u275:Create(
                RAW,
                TweenInfo.new(0.3),
                {C0 = a4.RightSprint}
            ):Play()

            u275:Create(
                LAW,
                TweenInfo.new(0.3),
                {C0 = a4.LeftSprint}
            ):Play()
        end
    end
end)

function Sprint()
    -- Line: 590
    -- upvalues: u124 (ref), u16 (ref), u162 (ref), u170 (ref), u184 (ref), u18 (ref), u275 (val), StatusUI (ref)
    -- upvalues: u167 (ref), u168 (ref), u186 (ref), Eventos (val), u104 (ref), u105 (ref)
    if u124 then
        if u16 and u162 > 0 then
            u170 = false

            if u184 then
                local UserInputService = game:GetService("UserInputService")
                UserInputService.MouseDeltaSensitivity = 1

                u18.Handle.AimUp:Play()
                tweenFoV(70, 120)

                u184 = false
                u275:Create(
                    StatusUI.Efeitos.Aim,
                    TweenInfo.new(0.3),
                    {ImageTransparency = 1}
                ):Play()
            end

            if not u167 and not u168 then
                u186 = 3
                Eventos.Stance:FireServer(u186, u104, u105)
                SprintAnim()

                return
            end

            return
        end

        if u16 and u162 ~= 0 then
            return
        end

        if not u167 and not u168 then
            if u184 then
                u186 = 2
                Eventos.Stance:FireServer(u186, u104, u105)
                IdleAnim()

                return
            end

            u186 = 0
            Eventos.Stance:FireServer(u186, u104, u105)
            IdleAnim()
        end
    end
end

Correndo.Changed:connect(function(a1) -- Line: 622; upvalues: u16 (ref)
    u16 = a1
    Sprint()
end)

local rad = math.rad
local sin = math.sin
local v12 = math.atan2
local cos = math.cos

function RAND(a1, a2, a3) -- Line: 635
    local v1 = 1 / (a3 or 1)
    return math.random(a1 * v1, a2 * v1) / v1
end

local u715 = nil

function ScopeOverlay(a1) -- Line: 644; upvalues: u104 (ref), u715 (ref)
    local v1 = false

    if u104 and u104.ScopeOnly and u104.ChangeFOV then
        if a1 == u104.ChangeFOV[1] or a1 == u104.ChangeFOV[2] then
            v1 = true
        end
    end

    local LocalPlayer = game:GetService("Players").LocalPlayer

    if u715 and u715.Parent then
        if v1 and LocalPlayer:FindFirstChild("PlayerGui") then
            u715.Parent = LocalPlayer.PlayerGui
        end

        u715.Enabled = v1

        return
    end

    if not v1 then
        return
    end

    u715 = Instance.new("ScreenGui")
    u715.Name = "ScopeOverlay"
    u715.IgnoreGuiInset = true
    u715.ResetOnSpawn = false
    u715.DisplayOrder = 10
    u715.Enabled = false
    local Frame = Instance.new("Frame")
    Frame.BackgroundTransparency = 1
    Frame.AnchorPoint = Vector2.new(0.5, 0.5)
    Frame.Position = UDim2.fromScale(0.5, 0.5)
    Frame.Size = UDim2.fromScale(0.85, 0.85)
    Frame.Parent = u715
    local UIAspectRatioConstraint = Instance.new("UIAspectRatioConstraint")
    UIAspectRatioConstraint.AspectRatio = 1
    UIAspectRatioConstraint.Parent = Frame

    local function block(a1, a2, a3) -- Line: 669; upvalues: Frame (val)
        local Frame_2 = Instance.new("Frame")
        Frame_2.BorderSizePixel = 0
        Frame_2.BackgroundColor3 = Color3.new(0, 0, 0)
        Frame_2.AnchorPoint = a1
        Frame_2.Position = a2
        Frame_2.Size = a3
        Frame_2.Parent = Frame
    end

    local v2 = Vector2.new(0.5, 1)
    local v3 = UDim2.fromScale(0.5, 0)
    local v4 = UDim2.fromScale(12, 12)
    local Frame_2 = Instance.new("Frame")
    Frame_2.BorderSizePixel = 0
    Frame_2.BackgroundColor3 = Color3.new(0, 0, 0)
    Frame_2.AnchorPoint = v2
    Frame_2.Position = v3
    Frame_2.Size = v4
    Frame_2.Parent = Frame
    v2 = Vector2.new(0.5, 0)
    v3 = UDim2.fromScale(0.5, 1)
    v4 = UDim2.fromScale(12, 12)
    local Frame_3 = Instance.new("Frame")
    Frame_3.BorderSizePixel = 0
    Frame_3.BackgroundColor3 = Color3.new(0, 0, 0)
    Frame_3.AnchorPoint = v2
    Frame_3.Position = v3
    Frame_3.Size = v4
    Frame_3.Parent = Frame
    v2 = Vector2.new(1, 0.5)
    v3 = UDim2.fromScale(0, 0.5)
    v4 = UDim2.fromScale(12, 1)
    local Frame_4 = Instance.new("Frame")
    Frame_4.BorderSizePixel = 0
    Frame_4.BackgroundColor3 = Color3.new(0, 0, 0)
    Frame_4.AnchorPoint = v2
    Frame_4.Position = v3
    Frame_4.Size = v4
    Frame_4.Parent = Frame
    v2 = Vector2.new(0, 0.5)
    v3 = UDim2.fromScale(1, 0.5)
    v4 = UDim2.fromScale(12, 1)
    local Frame_5 = Instance.new("Frame")
    Frame_5.BorderSizePixel = 0
    Frame_5.BackgroundColor3 = Color3.new(0, 0, 0)
    Frame_5.AnchorPoint = v2
    Frame_5.Position = v3
    Frame_5.Size = v4
    Frame_5.Parent = Frame
    local Frame_6 = Instance.new("Frame")
    Frame_6.BackgroundTransparency = 1
    Frame_6.Size = UDim2.fromScale(1, 1)
    Frame_6.Parent = Frame
    local UICorner = Instance.new("UICorner")
    UICorner.CornerRadius = UDim.new(0.5, 0)
    UICorner.Parent = Frame_6
    local UIStroke = Instance.new("UIStroke")
    UIStroke.Color = Color3.new(0, 0, 0)
    UIStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
    UIStroke.Parent = Frame_6

    ;(Frame:GetPropertyChangedSignal("AbsoluteSize")):Connect(function()
        -- Line: 694
        -- upvalues: UIStroke (val), Frame (val)
        UIStroke.Thickness = math.max(50, Frame.AbsoluteSize.X * 0.3)
    end)

    UIStroke.Thickness = math.max(50, Frame.AbsoluteSize.X * 0.3)

    if v1 and LocalPlayer:FindFirstChild("PlayerGui") then
        u715.Parent = LocalPlayer.PlayerGui
    end

    u715.Enabled = v1
end

function tweenFoV(a1, a2) -- Line: 706; upvalues: u218 (ref), CurrentCamera (val)
    pcall(ScopeOverlay, a1)

    coroutine.resume(
        coroutine.create(function() -- Line: 708; upvalues: u218 (upval), a2 (val), CurrentCamera (upval), a1 (val)
            u218 = u218 and u218 + 1 or 0

            for i = 1, a2 do
                if u218 ~= u218 then
                    break
                end

                CurrentCamera.FieldOfView = CurrentCamera.FieldOfView
                    + (a1 - CurrentCamera.FieldOfView) * (i / a2)
                game:GetService("RunService").RenderStepped:wait()
            end
        end)
    )
end

function Lerp(a1, a2, a3) -- Line: 719
    return a1 + (a2 - a1) * a3
end

local u727 = game:GetService("RunService")

function tweenJoint(a1, a2, a3, a4, a5) -- Line: 725; upvalues: u727 (val), u124 (ref)
    spawn(function()
        -- Line: 726
        -- upvalues: a1 (val), a5 (val), a2 (val), a3 (val), u727 (upval), u124 (upval), a4 (val)
        local tweenCode
        local v1 = math.random(-1000000000, 1000000000)

        if a1:findFirstChild("tweenCode") then
            a1.tweenCode.Value = v1
        else
            tweenCode = Instance.new("IntValue")
            tweenCode.Name = "tweenCode"
            tweenCode.Value = v1
            tweenCode.Parent = a1
        end

        if not (a5 <= 0) then
            local v2
            local v3 = 1.5 / a5
            local v4 = 0

            repeat
                u727.RenderStepped:wait()

                v2 = v4 + v3
                v4 = if not (v2 > 90) then v2 else 90

                if tweenCode.Value ~= v1 or not u124 then
                    break
                end

                if a2 then
                    a1.C0 = a1.C0:lerp(a2, (a4(v4)))
                end

                if a3 then
                    a1.C1 = a1.C1:lerp(a3, (a4(v4)))
                end
            until v4 == 90
        else
            if a2 then
                a1.C0 = a2
            end

            if a3 then
                a1.C1 = a3
            end
        end

        if tweenCode.Value == v1 then
            tweenCode:Destroy()
        end
    end)
end

function LoadClientMods() -- Line: 765; upvalues: GunMods (val), ModStorage (val)
    local v1

    for k, v in pairs(GunMods:GetChildren()) do
        if v:IsA("LocalScript") then
            v1 = v:clone()
            v1.Parent = ModStorage
            v1.Disabled = false
        end
    end
end

function UnloadClientMods() -- Line: 775; upvalues: ModStorage (val)
    for k, v in pairs(ModStorage:GetChildren()) do
        if v:IsA("LocalScript") then
            v:Destroy()
        end
    end
end

function CheckForHumanoid(a1) -- Line: 783
    local v1 = false
    local v2 = nil

    if a1 then
        if not a1.Parent:FindFirstChildOfClass("Humanoid")
            and not a1.Parent.Parent:FindFirstChildOfClass("Humanoid") then
            return false, v2
        end

        v1 = true

        if a1.Parent:FindFirstChildOfClass("Humanoid") then
            return v1, (a1.Parent:FindFirstChildOfClass("Humanoid"))
        end

        if a1.Parent.Parent:FindFirstChildOfClass("Humanoid") then
            return v1, (a1.Parent.Parent:FindFirstChildOfClass("Humanoid"))
        end
    end

    return v1, v2
end

function CreateShell() -- Line: 801; upvalues: FX (val), LocalPlayer (val), u339 (val)
    delay(
        math.random(4, 8) / 10,
        function() -- Line: 802; upvalues: FX (upval), LocalPlayer (upval), u339 (upval)
            if FX:FindFirstChild("ShellCasing") then
                local v1 = FX.ShellCasing:clone()
                v1.Parent = LocalPlayer.PlayerGui
                v1.PlaybackSpeed = math.random(30, 50) / 40
                v1.PlayOnRemove = true

                u339:AddItem(v1, 0)
            end
        end
    )
end

local u747 = 1

function TracerCalculation() -- Line: 814; upvalues: u104 (ref), u747 (ref)
    if u104.RandomTracer then
        if (math.random(1, 100)) <= u104.TracerChance then
            return true
        end

        return false
    end

    local v1 = u747

    if u104.TracerEveryXShots <= v1 then
        u747 = 1
        return true
    end

    u747 = u747 + 1

    return nil
end

function CreateBullet(a1)
    -- Line: 833
    -- upvalues: LocalPlayer_2 (val), u104 (ref), u18 (ref), u155 (ref), u162 (ref), Saude (val), rad (val), u350 (val)
    -- upvalues: Config (val), Eventos (val), u354 (ref)
    local Part = Instance.new("Part")
    Part.Name = LocalPlayer_2.Name .. "_Bullet"
    Part.CanCollide = false
    Part.Transparency = 1
    Part.FormFactor = "Custom"
    Part.Size = Vector3.new(1, 1, 1)
    local v1 = Vector3.new(0, Part:GetMass() * 196.2 - u104.BDrop * 196.2, 0)
    local v2 = Instance.new("BodyForce")
    v2.force = v1
    v2.Parent = Part
    local Position = u18.SmokePart.Position
    v2 = u18.SmokePart.CFrame.lookVector
        + u18.SmokePart.CFrame.upVector
            * (u104.BDrop * u155.Value / 2.8 / u104.BSpeed)
            / 2
    local v3 = CFrame.new(Position, Position + v2)
    v2 = CFrame.Angles(rad(RAND(-a1 - u162 / Saude.Stances.Mobility.Value * u104.WalkMultiplier, a1 + u162 / Saude.Stances.Mobility.Value * u104.WalkMultiplier) / 20), rad(RAND(-a1 - u162 / Saude.Stances.Mobility.Value * u104.WalkMultiplier, a1 + u162 / Saude.Stances.Mobility.Value * u104.WalkMultiplier) / 20), (rad(RAND(-a1 - u162 / Saude.Stances.Mobility.Value * u104.WalkMultiplier, a1 + u162 / Saude.Stances.Mobility.Value * u104.WalkMultiplier) / 20)))
        * v2
    Part.Parent = u350
    Part.CFrame = v3 + v2
    Part.Velocity = v2 * u104.BSpeed
    v1 = Color3.fromRGB(math.random(0, 255), math.random(0, 255), math.random(0, 255))
    local v4 = TracerCalculation()

    if u104.BulletFlare == true and v4 then
        local v5 = Instance.new("BillboardGui", Part)
        v5.Adornee = Part
        v5.Enabled = false
        local v6 = math.random(275, 375) / 10
        v5.Size = UDim2.new(v6, 0, v6, 0)
        v5.LightInfluence = 0
        v6 = Instance.new("ImageLabel", v5)
        v6.BackgroundTransparency = 1
        v6.Size = UDim2.new(1, 0, 1, 0)
        v6.Position = UDim2.new(0, 0, 0, 0)
        v6.Image = "http://www.roblox.com/asset/?id=1047066405"

        if u104.RainbowMode ~= true then
            v6.ImageColor3 = u104.BulletFlareColor
        else
            v6.ImageColor3 = v1
        end

        v6.ImageTransparency = math.random(2, 5) / 15
        spawn(function() -- Line: 883; upvalues: Part (val)
            wait(0.2)

            if Part:FindFirstChild("BillboardGui") ~= nil then
                Part.BillboardGui.Enabled = true
            end
        end)
    end

    if u104.Tracer == true and v4 then
        local Attachment = Instance.new("Attachment")
        Attachment.Name = "At1"
        Attachment.Position = Vector3.new(-u104.TracerWidth, 0, 0)
        Attachment.Parent = Part
        local Attachment_2 = Instance.new("Attachment")
        Attachment_2.Name = "At2"
        Attachment_2.Position = Vector3.new(u104.TracerWidth, 0, 0)
        Attachment_2.Parent = Part
        local Trail = Instance.new("Trail")
        Trail.Transparency = NumberSequence.new({NumberSequenceKeypoint.new(0, 0, 0), (NumberSequenceKeypoint.new(1, 1))})
        Trail.WidthScale = NumberSequence.new({NumberSequenceKeypoint.new(0, 2, 0), (NumberSequenceKeypoint.new(1, 1))})

        if u104.RainbowMode ~= true then
            Trail.Color = ColorSequence.new(u104.TracerColor)
        else
            Trail.Color = ColorSequence.new(v1)
        end

        Trail.Texture = "rbxassetid://232918622"
        Trail.TextureMode = Enum.TextureMode.Stretch
        Trail.FaceCamera = true
        Trail.LightEmission = u104.TracerLightEmission
        Trail.LightInfluence = u104.TracerLightInfluence
        Trail.Lifetime = u104.TracerLifeTime
        Trail.Attachment0 = Attachment
        Trail.Attachment1 = Attachment_2
        Trail.Parent = Part
    end

    if u104.BulletLight == true and v4 then
        local PointLight = Instance.new("PointLight")
        PointLight.Parent = Part
        PointLight.Brightness = u104.BulletLightBrightness

        if u104.RainbowMode ~= true then
            PointLight.Color = u104.BulletLightColor
        else
            PointLight.Color = v1
        end

        PointLight.Range = u104.BulletLightRange
        PointLight.Shadows = true
    end

    CreateShell()

    if v4 and Config.ReplicatedBullets then
        Eventos.ServerBullet:FireServer(v3, u104.Tracer, u104.BDrop, u104.BSpeed, v2, u104.TracerColor, u354, u104.BulletFlare, u104.BulletFlareColor)
    end

    game.Debris:AddItem(Part, 5)

    return Part
end

function CalcularDano(a1, a2, a3, a4) -- Line: 961; upvalues: u104 (ref)
    local v1 = 0
    local v2 = 0
    local v3 = 0
    local v4 = a1 - math.ceil(a2) / 40 * u104.FallOfDamage

    if a3.Parent:FindFirstChild("Saude") == nil then
        v1 = v4
    else
        local VestVida = a3.Parent.Saude.Protecao.VestVida
        local VestProtect = a3.Parent.Saude.Protecao.VestProtect
        local HelmetVida = a3.Parent.Saude.Protecao.HelmetVida
        local HelmetProtect = a3.Parent.Saude.Protecao.HelmetProtect

        if a4 ~= "Head" then
            if not (0 < VestVida.Value) then
                if not (0 < VestVida.Value) then
                    if VestVida.Value <= 0 then
                        v1 = v4
                    end
                elseif VestProtect.Value <= u104.BulletPenetration then
                    v1 = v4
                    v2 = v4 * ((100 - u104.BulletPenetration) / VestProtect.Value)

                    if v2 <= 0 then
                        v2 = 1
                    end
                elseif VestVida.Value <= 0 then
                    v1 = v4
                end
            elseif u104.BulletPenetration < VestProtect.Value then
                v1 = v4 * (u104.BulletPenetration / VestProtect.Value)
                v2 = v4 * ((100 - u104.BulletPenetration) / VestProtect.Value)

                if v2 <= 0 then
                    v2 = 0.5
                end
            elseif not (0 < VestVida.Value) then
                if VestVida.Value <= 0 then
                    v1 = v4
                end
            elseif VestProtect.Value <= u104.BulletPenetration then
                v1 = v4
                v2 = v4 * ((100 - u104.BulletPenetration) / VestProtect.Value)

                if v2 <= 0 then
                    v2 = 1
                end
            elseif VestVida.Value <= 0 then
                v1 = v4
            end
        elseif not (0 < HelmetVida.Value) then
            if not (0 < HelmetVida.Value) then
                if HelmetVida.Value <= 0 then
                    v1 = v4
                end
            elseif HelmetProtect.Value <= u104.BulletPenetration then
                v1 = v4
                v3 = v4 * ((100 - u104.BulletPenetration) / HelmetProtect.Value)

                if v3 <= 0 then
                    v3 = 1
                end
            elseif HelmetVida.Value <= 0 then
                v1 = v4
            end
        elseif u104.BulletPenetration < HelmetProtect.Value then
            v1 = v4 * (u104.BulletPenetration / HelmetProtect.Value)
            v3 = v4 * ((100 - u104.BulletPenetration) / HelmetProtect.Value)

            if v3 <= 0 then
                v3 = 0.5
            end
        elseif not (0 < HelmetVida.Value) then
            if HelmetVida.Value <= 0 then
                v1 = v4
            end
        elseif HelmetProtect.Value <= u104.BulletPenetration then
            v1 = v4
            v3 = v4 * ((100 - u104.BulletPenetration) / HelmetProtect.Value)

            if v3 <= 0 then
                v3 = 1
            end
        elseif HelmetVida.Value <= 0 then
            v1 = v4
        end
    end

    if v1 <= 0 then
        v1 = 1
    end

    return v1, v2, v3
end

local u756 = {"342190005", "342190012", "342190017", "342190024"}

Eventos.Whizz.OnClientEvent:connect(function() -- Line: 1029; upvalues: LocalPlayer (val), u756 (val)
    local Sound = Instance.new("Sound")
    Sound.Parent = LocalPlayer.PlayerGui
    Sound.SoundId = "rbxassetid://" .. u756[math.random(1, 4)]
    Sound.Volume = 2
    Sound.PlayOnRemove = true

    Sound:Destroy()
end)

Eventos.Suppression.OnClientEvent:Connect(function(a1, a2, a3)
    -- Line: 1040
    -- upvalues: Config (val), LocalPlayer (val), Humanoid (val), u275 (val), StatusUI (ref)
    if Config.EnableStatusUI and LocalPlayer.Character and 0 < Humanoid.Health and a1 == 1 then
        u275:Create(
            StatusUI.Efeitos.Suppress,
            TweenInfo.new(0.1),
            {ImageTransparency = 0, Size = UDim2.fromScale(1, 1.15)}
        ):Play()

        delay(
            0.1,
            function() -- Line: 1045; upvalues: u275 (upval), StatusUI (upval)
                u275:Create(
                    StatusUI.Efeitos.Suppress,
                    TweenInfo.new(1, Enum.EasingStyle.Exponential, Enum.EasingDirection.InOut, 0, false, 0.15),
                    {ImageTransparency = 1, Size = UDim2.fromScale(2, 2)}
                ):Play()
            end
        )
    end
end)

function CastRay(a1)
    -- Line: 1067
    -- upvalues: u18 (ref), u727 (val), u354 (ref), LocalPlayer_2 (val), u104 (ref), Eventos (val), Hitmarker (val)
    -- upvalues: u102 (val), Config (val), FX (val), u339 (val)
    local Position, Position_2, Position_3, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13, v14, v15
    local dispatch = 0

    while true do
        if dispatch < 80 then
            if dispatch < 44 then
                if not (dispatch < 26) then
                    dispatch = if dispatch < 35 then
                        if dispatch < 30 then
                            if dispatch < 28 then
                                if dispatch < 27 then
                                    if v2.Parent.Name == "Olho" then 38 else 27
                                else
                                    if v2.Parent.Name == "Headset" then 38 else 28
                            else
                                if dispatch < 29 then
                                    if v2.Parent.Name == "Numero" then 38 else 29
                                else
                                    if v2.Parent.Name == "Vest" then 38 else 30
                        else
                            if dispatch < 32 then
                                if dispatch < 31 then
                                    if v2.Parent.Name == "Chest" then 38 else 31
                                else
                                    if v2.Parent.Name == "Waist" then 38 else 32
                            else
                                if dispatch < 33 then
                                    if v2.Parent.Name == "Back" then 38 else 33
                                else
                                    if dispatch < 34 then
                                        if v2.Parent.Name == "Belt" then 38 else 34
                                    else
                                        if v2.Parent.Name == "Leg1" then 38 else 35
                    else
                        if dispatch < 39 then
                            if dispatch < 37 then
                                if dispatch < 36 then
                                    if v2.Parent.Name == "Leg2" then 38 else 36
                                else
                                    if v2.Parent.Name == "Arm1" then 38 else 37
                            else
                                if dispatch < 38 then
                                    if v2.Parent.Name ~= "Arm2" then 45 else 38
                                else
                                    if v2.Name == "Right Arm" then 45 else 39
                        else
                            if dispatch < 41 then
                                if dispatch < 40 then
                                    if v2.Name == "Left Arm" then 45 else 40
                                else
                                    if v2.Name == "Right Leg" then 45 else 41
                            else
                                if dispatch < 42 then
                                    if v2.Name == "Left Leg" then 45 else 42
                                else
                                    if dispatch < 43 then
                                        if v2.Name == "Armor" then 45 else 43
                                    else
                                        if v2.Name == "EShield" then 45 else 44
                elseif not (dispatch < 17) then
                    dispatch = if dispatch < 21 then
                        if dispatch < 19 then
                            if dispatch < 18 then
                                if 1 <= v2.Transparency then 38 else 18
                            else
                                if v2.CanCollide == false then 38 else 19
                        else
                            if dispatch < 20 then
                                if v2.Name == "Ignorable" then 38 else 20
                            else
                                if v2.Name == "Glass" then 38 else 21
                    else
                        if dispatch < 23 then
                            if dispatch < 22 then
                                if v2.Parent.Name == "Top" then 38 else 22
                            else
                                if v2.Parent.Name == "Helmet" then 38 else 23
                        else
                            if dispatch < 24 then
                                if v2.Parent.Name == "Up" then 38 else 24
                            else
                                if dispatch < 25 then
                                    if v2.Parent.Name == "Down" then 38 else 25
                                else
                                    if v2.Parent.Name == "Face" then 38 else 26
                elseif not (dispatch < 13) then
                    dispatch = if dispatch < 15 then
                        if dispatch < 14 then if not v2 then 49 else 14 else if v5 then 49 else 15
                    else
                        if dispatch < 16 then if not v2 then 45 else 16 else if not v2 then 18 else 17
                elseif not (dispatch < 11) then
                    if not (dispatch < 12) then
                        v1:Destroy()
                        return
                    end

                    dispatch = if not (u104.Distance < v3) then 13 else 12
                elseif dispatch < 1 then
                    Position = u18.SmokePart.Position
                    Position_2 = a1.Position
                    v3 = 0
                    v4 = false
                    v5 = nil
                    v1 = a1
                    dispatch = 1
                else
                    u727.Heartbeat:wait()

                    Position_3 = v1.Position
                    v3 = v3 + (Position_3 - Position).magnitude
                    v6, v7, v8, v9 = workspace:FindPartOnRayWithIgnoreList(Ray.new(Position, (Position_3 - Position) * 20), u354, false, true)
                    v2 = v6
                    v6, v7, v8, v9 = workspace:FindPartOnRayWithIgnoreList(Ray.new(Position, Position_3 - Position), u354, false, true)
                    v12 = v6
                    v13 = v7
                    v14 = v8
                    v15 = v9
                    local dispatchExit = nil

                    for k2, i in pairs(game.Players:GetChildren()) do
                        local dispatch2 = 2

                        while true do
                            if dispatch2 < 6 then
                                if dispatch2 < 4 then
                                    if dispatch2 < 3 then
                                        if not i:IsA("Player") then
                                            break
                                        else
                                            dispatch2 = 3
                                        end
                                    elseif i == LocalPlayer_2 then
                                        break
                                    else
                                        dispatch2 = 4
                                    end
                                elseif dispatch2 < 5 then
                                    if not i.Character then
                                        break
                                    else
                                        dispatch2 = 5
                                    end
                                elseif not i.Character:FindFirstChild("Head") then
                                    break
                                else
                                    dispatch2 = 6
                                end
                            elseif not (dispatch2 < 8) then
                                if not (dispatch2 < 9) then
                                    Eventos.Whizz:FireServer(i)
                                    Eventos.Suppression:FireServer(i)

                                    v4 = true
                                    break
                                end

                                if v4 then
                                    break
                                else
                                    dispatch2 = 9
                                end
                            elseif dispatch2 < 7 then
                                if not ((i.Character.Head.Position - v13).magnitude
                                    <= u104.SuppressMaxDistance) then
                                    break
                                else
                                    dispatch2 = 7
                                end
                            elseif not u104.BulletWhiz then
                                break
                            else
                                dispatch2 = 8
                            end
                        end

                        if dispatchExit then
                            break
                        end
                    end

                    dispatch = 11
                end
            elseif dispatch < 62 then
                if dispatch < 53 then
                    if dispatch < 49 then
                        if dispatch < 46 then
                            if dispatch < 45 then
                                table.insert(u354, v2)

                                v5 = true
                                dispatch = 45
                            else
                                dispatch = if not v5 then 49 else 46
                            end
                        elseif dispatch < 48 then
                            v6, v7, v8, v9 = workspace:FindPartOnRayWithIgnoreList(Ray.new(Position, (Position_3 - Position) * 20), u354, false, true)
                            v2 = v6
                            v6, v7, v8, v9 = workspace:FindPartOnRayWithIgnoreList(Ray.new(Position, Position_3 - Position), u354, false, true)
                            v12 = v6
                            v13 = v7
                            v14 = v8
                            v15 = v9
                            v5 = false
                            dispatch = 48
                        else
                            dispatch = 14
                        end
                    elseif dispatch < 51 then
                        dispatch = if dispatch < 50 then
                            if not v12 then 149 else 50
                        else
                            if v5 then 149 else 51
                    elseif dispatch < 52 then
                        v1:Destroy()

                        v4 = true
                        v6, v7 = CheckForHumanoid(v12)

                        Hitmarker.HitEffect(u354, u102, v13, v12, v14, v15, u104)
                        Eventos.Hit:FireServer(v13, v12, v14, v15, u104, v3)

                        dispatch = if v6 ~= true then 149 else 52
                    else
                        dispatch = if not (0 < v7.Health) then 149 else 53
                    end
                elseif dispatch < 57 then
                    if dispatch < 55 then
                        if dispatch < 54 then
                            dispatch = if not Config.HitmarkerSound then 55 else 54
                        else
                            v8 = FX.Hitmarker:Clone()
                            v8.Parent = LocalPlayer_2.PlayerGui
                            v8.Volume = 2
                            v8.PlayOnRemove = true

                            u339:AddItem(v8, 0)

                            dispatch = 55
                        end
                    elseif dispatch < 56 then
                        dispatch = if u104.ModoTreino then 128 else 56
                    else
                        Eventos.CreateOwner:FireServer(v7)

                        dispatch = if game.Players:FindFirstChild(v7.Parent.Name) ~= nil then
                            64
                        else
                            57
                    end
                elseif dispatch < 59 then
                    if not (dispatch < 58) then
                        v8 = math.random(u104.HeadDamage[1], u104.HeadDamage[2])
                        v9, v10, v11 = CalcularDano(v8, v3, v7, "Head")

                        Eventos.Damage:FireServer(v7, v9, v10, v11)

                        return
                    end

                    dispatch = if v12.Name ~= "Head" then 59 else 58
                else
                    dispatch = if dispatch < 60 then
                        if v12.Name == "Torso" then 62 else 60
                    else
                        if dispatch < 61 then
                            if v12.Parent.Name == "UpperTorso" then 62 else 61
                        else
                            if v12.Parent.Name ~= "LowerTorso" then 63 else 62
                end
            elseif dispatch < 71 then
                if dispatch < 66 then
                    if dispatch < 64 then
                        if not (dispatch < 63) then
                            v8 = math.random(u104.LimbsDamage[1], u104.LimbsDamage[2])
                            v9, v10, v11 = CalcularDano(v8, v3, v7, "Body")

                            Eventos.Damage:FireServer(v7, v9, v10, v11)

                            return
                        end

                        v8 = math.random(u104.TorsoDamage[1], u104.TorsoDamage[2])
                        v9, v10, v11 = CalcularDano(v8, v3, v7, "Body")

                        Eventos.Damage:FireServer(v7, v9, v10, v11)

                        return
                    else
                        dispatch = if dispatch < 65 then
                            if Config.TeamKill then 87 else 65
                        else
                            if not game.Players:FindFirstChild(v7.Parent.Name) then 67 else 66
                    end
                else
                    dispatch = if not (dispatch < 68) then
                        if dispatch < 69 then
                            if v12.Name == "Head" then 74 else 69
                        else
                            if dispatch < 70 then
                                if v12.Parent.Name == "Top" then 74 else 70
                            else
                                if v12.Parent.Name == "Headset" then 74 else 71
                    else
                        if dispatch < 67 then
                            if game.Players:FindFirstChild(v7.Parent.Name).Team
                                ~= LocalPlayer_2.Team then
                                68
                            else
                                67
                        else
                            if game.Players:FindFirstChild(v7.Parent.Name) ~= nil then
                                150
                            else
                                68
                end
            elseif dispatch < 75 then
                if dispatch < 73 then
                    dispatch = if dispatch < 72 then
                        if v12.Parent.Name == "Olho" then 74 else 72
                    else
                        if v12.Parent.Name == "Face" then 74 else 73
                else
                    if not (dispatch < 74) then
                        v8 = math.random(u104.HeadDamage[1], u104.HeadDamage[2])
                        v9, v10, v11 = CalcularDano(v8, v3, v7, "Head")

                        Eventos.Damage:FireServer(v7, v9, v10, v11)

                        return
                    end

                    dispatch = if v12.Parent.Name ~= "Numero" then 75 else 74
                end
            elseif dispatch < 77 then
                dispatch = if dispatch < 76 then
                    if v12.Parent:IsA("Accessory") then 77 else 76
                else
                    if not v12.Parent:IsA("Hat") then 78 else 77
            elseif dispatch < 78 then
                v8 = math.random(u104.HeadDamage[1], u104.HeadDamage[2])
                v9, v10, v11 = CalcularDano(v8, v3, v7, "Head")

                Eventos.Damage:FireServer(v7, v9, v10, v11)

                return
            else
                dispatch = if dispatch < 79 then
                    if v12.Name == "Torso" then 81 else 79
                else
                    if v12.Parent.Name == "Chest" then 81 else 80
            end
        elseif dispatch < 115 then
            if dispatch < 97 then
                if dispatch < 88 then
                    if dispatch < 84 then
                        if dispatch < 82 then
                            if not (dispatch < 81) then
                                v8 = math.random(u104.TorsoDamage[1], u104.TorsoDamage[2])
                                v9, v10, v11 = CalcularDano(v8, v3, v7, "Body")

                                Eventos.Damage:FireServer(v7, v9, v10, v11)

                                return
                            end

                            dispatch = if v12.Parent.Name ~= "Waist" then 82 else 81
                        else
                            dispatch = if dispatch < 83 then
                                if v12.Name == "Right Arm" then 86 else 83
                            else
                                if v12.Name == "Right Leg" then 86 else 84
                        end
                    elseif dispatch < 86 then
                        dispatch = if dispatch < 85 then
                            if v12.Name == "Left Leg" then 86 else 85
                        else
                            if v12.Name ~= "Left Arm" then 150 else 86
                    elseif dispatch < 87 then
                        v8 = math.random(u104.LimbsDamage[1], u104.LimbsDamage[2])
                        v9, v10, v11 = CalcularDano(v8, v3, v7, "Body")

                        Eventos.Damage:FireServer(v7, v9, v10, v11)

                        return
                    else
                        dispatch = if not game.Players:FindFirstChild(v7.Parent.Name) then
                            89
                        else
                            88
                    end
                elseif dispatch < 92 then
                    dispatch = if not (dispatch < 90) then
                        if dispatch < 91 then
                            if v12.Name == "Head" then 96 else 91
                        else
                            if v12.Parent.Name == "Top" then 96 else 92
                    else
                        if dispatch < 89 then
                            if game.Players:FindFirstChild(v7.Parent.Name).Team
                                ~= LocalPlayer_2.Team then
                                90
                            else
                                89
                        else
                            if game.Players:FindFirstChild(v7.Parent.Name) ~= nil then
                                109
                            else
                                90
                elseif dispatch < 94 then
                    dispatch = if dispatch < 93 then
                        if v12.Parent.Name == "Headset" then 96 else 93
                    else
                        if v12.Parent.Name == "Olho" then 96 else 94
                elseif dispatch < 95 then
                    dispatch = if v12.Parent.Name == "Face" then 96 else 95
                else
                    if not (dispatch < 96) then
                        v8 = math.random(u104.HeadDamage[1], u104.HeadDamage[2])
                        v9, v10, v11 = CalcularDano(v8, v3, v7, "Head")

                        Eventos.Damage:FireServer(v7, v9, v10, v11)

                        return
                    end

                    dispatch = if v12.Parent.Name ~= "Numero" then 97 else 96
                end
            elseif dispatch < 106 then
                if dispatch < 101 then
                    if dispatch < 99 then
                        dispatch = if dispatch < 98 then
                            if v12.Parent:IsA("Accessory") then 99 else 98
                        else
                            if not v12.Parent:IsA("Hat") then 100 else 99
                    elseif dispatch < 100 then
                        v8 = math.random(u104.HeadDamage[1], u104.HeadDamage[2])
                        v9, v10, v11 = CalcularDano(v8, v3, v7, "Head")

                        Eventos.Damage:FireServer(v7, v9, v10, v11)

                        return
                    else
                        dispatch = if v12.Name == "Torso" then 103 else 101
                    end
                elseif dispatch < 103 then
                    dispatch = if dispatch < 102 then
                        if v12.Parent.Name == "Chest" then 103 else 102
                    else
                        if v12.Parent.Name ~= "Waist" then 104 else 103
                elseif dispatch < 104 then
                    v8 = math.random(u104.TorsoDamage[1], u104.TorsoDamage[2])
                    v9, v10, v11 = CalcularDano(v8, v3, v7, "Body")

                    Eventos.Damage:FireServer(v7, v9, v10, v11)

                    return
                else
                    dispatch = if dispatch < 105 then
                        if v12.Name == "Right Arm" then 108 else 105
                    else
                        if v12.Name == "Right Leg" then 108 else 106
                end
            elseif not (dispatch < 110) then
                dispatch = if dispatch < 112 then
                    if dispatch < 111 then
                        if v12.Parent.Name == "Top" then 115 else 111
                    else
                        if v12.Parent.Name == "Headset" then 115 else 112
                else
                    if dispatch < 113 then
                        if v12.Parent.Name == "Olho" then 115 else 113
                    else
                        if dispatch < 114 then
                            if v12.Parent.Name == "Face" then 115 else 114
                        else
                            if v12.Parent.Name ~= "Numero" then 116 else 115
            elseif dispatch < 108 then
                dispatch = if dispatch < 107 then
                    if v12.Name == "Left Leg" then 108 else 107
                else
                    if v12.Name ~= "Left Arm" then 150 else 108
            elseif dispatch < 109 then
                v8 = math.random(u104.LimbsDamage[1], u104.LimbsDamage[2])
                v9, v10, v11 = CalcularDano(v8, v3, v7, "Body")

                Eventos.Damage:FireServer(v7, v9, v10, v11)

                return
            else
                dispatch = if v12.Name == "Head" then 115 else 110
            end
        elseif dispatch < 133 then
            if dispatch < 124 then
                if dispatch < 119 then
                    if not (dispatch < 117) then
                        if not (dispatch < 118) then
                            v8 = (math.random(u104.HeadDamage[1], u104.HeadDamage[2]))
                                * Config.TeamDamageMultiplier
                            v9, v10, v11 = CalcularDano(v8, v3, v7, "Head")

                            Eventos.Damage:FireServer(v7, v9, v10, v11)

                            return
                        end

                        dispatch = if not v12.Parent:IsA("Hat") then 119 else 118
                    elseif dispatch < 116 then
                        v8 = (math.random(u104.HeadDamage[1], u104.HeadDamage[2]))
                            * Config.TeamDamageMultiplier
                        v9, v10, v11 = CalcularDano(v8, v3, v7, "Head")

                        Eventos.Damage:FireServer(v7, v9, v10, v11)

                        return
                    else
                        dispatch = if v12.Parent:IsA("Accessory") then 118 else 117
                    end
                elseif dispatch < 121 then
                    dispatch = if dispatch < 120 then
                        if v12.Name == "Torso" then 122 else 120
                    else
                        if v12.Parent.Name == "Chest" then 122 else 121
                elseif dispatch < 122 then
                    dispatch = if v12.Parent.Name ~= "Waist" then 123 else 122
                elseif dispatch < 123 then
                    v8 = (math.random(u104.TorsoDamage[1], u104.TorsoDamage[2]))
                        * Config.TeamDamageMultiplier
                    v9, v10, v11 = CalcularDano(v8, v3, v7, "Body")

                    Eventos.Damage:FireServer(v7, v9, v10, v11)

                    return
                else
                    dispatch = if v12.Name == "Right Arm" then 127 else 124
                end
            elseif not (dispatch < 128) then
                dispatch = if dispatch < 130 then
                    if dispatch < 129 then
                        if v12.Name == "Head" then 148 else 129
                    else
                        if v12.Parent.Name == "Top" then 148 else 130
                else
                    if dispatch < 131 then
                        if v12.Parent.Name == "Headset" then 148 else 131
                    else
                        if dispatch < 132 then
                            if v12.Parent.Name == "Olho" then 148 else 132
                        else
                            if v12.Parent.Name == "Face" then 148 else 133
            elseif dispatch < 126 then
                dispatch = if dispatch < 125 then
                    if v12.Name == "Right Leg" then 127 else 125
                else
                    if v12.Name == "Left Leg" then 127 else 126
            else
                if not (dispatch < 127) then
                    v8 = (math.random(u104.LimbsDamage[1], u104.LimbsDamage[2]))
                        * Config.TeamDamageMultiplier
                    v9, v10, v11 = CalcularDano(v8, v3, v7, "Body")

                    Eventos.Damage:FireServer(v7, v9, v10, v11)

                    return
                end

                dispatch = if v12.Name ~= "Left Arm" then 150 else 127
            end
        elseif dispatch < 142 then
            dispatch = if dispatch < 137 then
                if dispatch < 135 then
                    if dispatch < 134 then
                        if v12.Parent.Name == "Numero" then 148 else 134
                    else
                        if v12.Parent:IsA("Accessory") then 148 else 135
                else
                    if dispatch < 136 then
                        if v12.Parent:IsA("Hat") then 148 else 136
                    else
                        if v12.Name == "Torso" then 148 else 137
            else
                if dispatch < 139 then
                    if dispatch < 138 then
                        if v12.Parent.Name == "Chest" then 148 else 138
                    else
                        if v12.Parent.Name == "Waist" then 148 else 139
                else
                    if dispatch < 140 then
                        if v12.Name == "Right Arm" then 148 else 140
                    else
                        if dispatch < 141 then
                            if v12.Name == "Left Arm" then 148 else 141
                        else
                            if v12.Name == "Right Leg" then 148 else 142
        elseif dispatch < 146 then
            dispatch = if dispatch < 144 then
                if dispatch < 143 then
                    if v12.Name == "Left Leg" then 148 else 143
                else
                    if v12.Parent.Name == "Back" then 148 else 144
            else
                if dispatch < 145 then
                    if v12.Parent.Name == "Leg1" then 148 else 145
                else
                    if v12.Parent.Name == "Leg2" then 148 else 146
        elseif dispatch < 148 then
            dispatch = if dispatch < 147 then
                if v12.Parent.Name == "Arm1" then 148 else 147
            else
                if v12.Parent.Name ~= "Arm2" then 150 else 148
        elseif dispatch < 149 then
            Eventos.Treino:FireServer(v7)
            return
        else
            if not (dispatch < 150) then
                return
            end

            Position = Position_3
            dispatch = 1
        end
    end
end

Humanoid.Running:connect(function(a1) -- Line: 1224; upvalues: u124 (ref), u162 (ref), u232 (ref)
    if u124 then
        u162 = a1
        Sprint()

        if a1 > 1 then
            u232 = true
            return
        end

        u232 = false
    end
end)

Mouse_2.KeyDown:connect(function(a1) -- Line: 1237; upvalues: u124 (ref)
    if u124 then
        if a1 == "w" and not w then
            w = true
        end

        if a1 == "a" and not a then
            a = true
        end

        if a1 == "s" and not s then
            s = true
        end

        if a1 == "d" and not d then
            d = true
        end
    end
end)

Mouse_2.KeyUp:connect(function(a1) -- Line: 1262; upvalues: u124 (ref)
    if u124 then
        if a1 == "w" and w then
            w = false
        end

        if a1 == "a" and a then
            a = false
        end

        if a1 == "s" and s then
            s = false
        end

        if a1 == "d" and d then
            d = false
        end
    end
end)

function SlideEx() -- Line: 1289; upvalues: u18 (ref), u104 (ref), u147 (ref), u144 (ref), u150 (ref), u165 (ref)
    tweenJoint(
        u18.Handle:WaitForChild("Slide"),
        (CFrame.new(u104.SlideExtend)) * CFrame.Angles(0, 0, 0),
        nil,
        function(a1) -- Line: 1290
            return (math.sin((math.rad(a1))))
        end,
        1 * (u147 / 2)
    )

    if u104.MoveBolt == true then
        tweenJoint(
            u18.Handle:WaitForChild("Bolt"),
            (CFrame.new(u104.BoltExtend)) * CFrame.Angles(0, 0, 0),
            nil,
            function(a1) -- Line: 1292
                return (math.sin((math.rad(a1))))
            end,
            1 * (u147 / 2)
        )
    end

    delay(
        u147 / 2,
        function()
            -- Line: 1294
            -- upvalues: u144 (upval), u18 (upval), u147 (upval), u104 (upval), u150 (upval), u165 (upval)
            if 1 <= u144.Value then
                tweenJoint(
                    u18.Handle:WaitForChild("Slide"),
                    (CFrame.new(0, 0, 0)) * CFrame.Angles(0, 0, 0),
                    nil,
                    function(a1) -- Line: 1296
                        return (math.sin((math.rad(a1))))
                    end,
                    1 * (u147 / 2)
                )

                if u104.MoveBolt ~= true then
                    return
                end

                tweenJoint(
                    u18.Handle:WaitForChild("Bolt"),
                    (CFrame.new(0, 0, 0)) * CFrame.Angles(0, 0, 0),
                    nil,
                    function(a1) -- Line: 1298
                        return (math.sin((math.rad(a1))))
                    end,
                    1 * (u147 / 2)
                )

                return
            end

            if u144.Value < 1 and u104.SlideLock == true then
                u150.Value = false

                if u104.MoveBolt == true and u104.BoltLock == false then
                    tweenJoint(
                        u18.Handle:WaitForChild("Bolt"),
                        (CFrame.new(0, 0, 0)) * CFrame.Angles(0, 0, 0),
                        nil,
                        function(a1) -- Line: 1303
                            return (math.sin((math.rad(a1))))
                        end,
                        1 * (u147 / 2)
                    )
                end

                u18.Handle.Click:Play()

                u165 = true

                return
            end

            if u144.Value < 1 and u104.SlideLock == false then
                tweenJoint(
                    u18.Handle:WaitForChild("Slide"),
                    (CFrame.new(0, 0, 0)) * CFrame.Angles(0, 0, 0),
                    nil,
                    function(a1) -- Line: 1308
                        return (math.sin((math.rad(a1))))
                    end,
                    1 * (u147 / 2)
                )

                if u104.MoveBolt == true then
                    tweenJoint(
                        u18.Handle:WaitForChild("Bolt"),
                        (CFrame.new(0, 0, 0)) * CFrame.Angles(0, 0, 0),
                        nil,
                        function(a1) -- Line: 1310
                            return (math.sin((math.rad(a1))))
                        end,
                        1 * (u147 / 2)
                    )
                end

                u150.Value = false
                u18.Handle.Click:Play()
            end
        end
    )
end

function recoil()
    -- Line: 1317
    -- upvalues: u188 (ref), u137 (ref), u138 (ref), CurrentCamera (val), u104 (ref), u139 (ref), u140 (ref), u141 (ref)
    -- upvalues: u184 (ref), u136 (ref), u142 (ref), rad (val), u18 (ref), u190 (ref), Character_2 (val)
    spawn(function()
        -- Line: 1318
        -- upvalues: u188 (upval), u137 (upval), u138 (upval), CurrentCamera (upval), u104 (upval), u139 (upval)
        -- upvalues: u140 (upval), u141 (upval), u184 (upval), u136 (upval), u142 (upval), rad (upval)
        local v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11

        if u188 then
            v1 = u137 / 5
            v2 = u138 * math.random(-1, 1) / 5
            CurrentCamera.CFrame = CurrentCamera.CFrame * CFrame.Angles(v1, v2, 0)
            v7 = -v1 / 30
            v1 = -v2 / 30
            v8 = if u104.GunType ~= 0 then u139 * 10 / 100 else u139
            v2 = math.random(-u140 * 25, u140 * 25) / 100
            v9 = u141 * math.random(-1, 1)

            if u184 then
                v10 = u136
                v11 = u136 * CFrame.new(0, 0, u104.RecoilPunch / 2)
                local Angles_2 = CFrame.Angles
                v4 = v8 * u142 * 0.25
                v3 = rad(v4)
                v5 = v2 * u142 * 0.25
                v4 = rad(v5)
                v6 = v9 * u142 * 0.25
                u136 = v10:lerp(v11 * Angles_2(v3, v4, (rad(v6))), 1)
            else
                v10 = u136
                v11 = u136 * CFrame.new(0, 0, u104.RecoilPunch / 2)
                local Angles = CFrame.Angles
                v4 = v8 * u142 * 0.25
                v3 = rad(v4)
                v5 = v2 * u142 * 0.25
                v4 = rad(v5)
                v6 = v9 * u142 * 0.25
                u136 = v10:lerp(v11 * Angles(v3, v4, (rad(v6))), 1)
            end

            for j = 1, 30 do
                CurrentCamera.CoordinateFrame = (CFrame.new(CurrentCamera.Focus.p))
                    * (CurrentCamera.CoordinateFrame - CurrentCamera.CoordinateFrame.p)
                    * CFrame.Angles(v7, v1, 0)
                    * CFrame.new(0, 0, (CurrentCamera.Focus.p - CurrentCamera.CoordinateFrame.p).magnitude)
                wait()
            end

            return
        end

        v1 = u137
        v2 = u138 * math.random(-1, 1)
        CurrentCamera.CFrame = CurrentCamera.CFrame * CFrame.Angles(v1, v2, 0)
        v7 = -v1 / 30
        v1 = -v2 / 30
        v8 = if u104.GunType ~= 0 then
            math.random(-u139 * 50, u139 * 100) / 100
        else
            u139
        v2 = math.random(-u140 * 100, u140 * 100) / 100
        v9 = u141 * math.random(-1, 1)

        if u184 then
            v10 = u136
            v11 = u136 * CFrame.new(0, 0, u104.RecoilPunch / 2)
            local Angles_4 = CFrame.Angles
            v4 = v8 * u142 / u104.AimRecoilReduction
            v3 = rad(v4)
            v5 = v2 * u142 / u104.AimRecoilReduction
            v4 = rad(v5)
            v6 = v9 * u142 / u104.AimRecoilReduction
            u136 = v10:lerp(v11 * Angles_4(v3, v4, (rad(v6))), 1)
        else
            v10 = u136
            v11 = u136 * CFrame.new(0, 0, u104.RecoilPunch)
            local Angles_3 = CFrame.Angles
            v4 = v8 * u142
            v3 = rad(v4)
            v5 = v2 * u142
            v4 = rad(v5)
            v6 = v9 * u142
            u136 = v10:lerp(v11 * Angles_3(v3, v4, (rad(v6))), 1)
        end

        v10 = 30 * u104.AimRecover

        for i = 1, v10 do
            CurrentCamera.CoordinateFrame = (CFrame.new(CurrentCamera.Focus.p))
                * (CurrentCamera.CoordinateFrame - CurrentCamera.CoordinateFrame.p)
                * CFrame.Angles(v7, v1, 0)
                * CFrame.new(0, 0, (CurrentCamera.Focus.p - CurrentCamera.CoordinateFrame.p).magnitude)
            wait()
        end
    end)

    for k, v in pairs(u18.SmokePart:GetChildren()) do
        if v.Name:sub(1, 7) == "FlashFX" or v.Name:sub(1, 7) == "Smoke" then
            v.Enabled = true
        end
    end

    for k2, i in pairs(u18.Chamber:GetChildren()) do
        if i.Name:sub(1, 7) == "FlashFX" or i.Name:sub(1, 7) == "Smoke" then
            i.Enabled = true
        end
    end

    delay(
        0.03333333333333333,
        function() -- Line: 1396; upvalues: u18 (upval)
            for k, v in pairs(u18.SmokePart:GetChildren()) do
                if v.Name:sub(1, 7) == "FlashFX" or v.Name:sub(1, 7) == "Smoke" then
                    v.Enabled = false
                end
            end

            for k2, i in pairs(u18.Chamber:GetChildren()) do
                if i.Name:sub(1, 7) == "FlashFX" or i.Name:sub(1, 7) == "Smoke" then
                    i.Enabled = false
                end
            end
        end
    )

    if u190.Value ~= true then
        ((Character_2:WaitForChild("S" .. u18.Name)):WaitForChild("Grip")):WaitForChild("Fire"):Play()
        ;((Character_2:WaitForChild("S" .. u18.Name)):WaitForChild("Grip")):WaitForChild("Echo"):Play()
    else
        ((Character_2:WaitForChild("S" .. u18.Name)):WaitForChild("Grip")):WaitForChild("Supressor"):Play()
    end

    SlideEx()
end

function Emperrar()
    -- Line: 1422
    -- upvalues: LocalPlayer (val), u104 (ref), u150 (ref), u144 (ref), u153 (ref), u18 (ref)
    if LocalPlayer:GetAttribute("Juggernaut") == true then
        return
    end

    if u104.CanBreak == true
        and u150.Value == true
        and 0 < u144.Value - 1
        and (math.random(u104.JamChance)) <= 2 then
        u153.Value = true
        u18.Handle:WaitForChild("Click"):Play()
    end
end

function HalfStepFunc(a1) -- Line: 1434; upvalues: u171 (ref), u19 (ref), Humanoid (val), Eventos (val), u124 (ref)
    if u171 then
        Eventos.HeadRot:FireServer(a1, Humanoid.CameraOffset, u124)
    end

    u171 = not u171
end

oldtick = tick()
xTilt = 0
yTilt = 0
lastPitch = 0
lastYaw = 0
local u819 = 0
local u820 = nil

Character.ChildAdded:connect(function(a1)
    -- Line: 1450
    -- upvalues: u287 (val), Character (val), u125 (ref), u820 (ref), u124 (ref), UserInputService (val)
    -- upvalues: LocalPlayer_2 (val), u354 (ref), Character_2 (val), u345 (val), CurrentCamera (val), u350 (val)
    -- upvalues: u159 (ref), StatusUI (ref), u160 (ref), u104 (ref), u161 (ref)
    if a1:IsA("Tool")
        and a1:FindFirstChild("ACS_Modulo")
        and a1.ACS_Modulo:FindFirstChild("ACS_Setup")
        and 0 < u287.Health
        and require(a1.ACS_Modulo.ACS_Setup).Type == "Gun" then
        local v1 = true

        if not Character:WaitForChild("Humanoid").Sit then
            if not Character:WaitForChild("Humanoid").Sit then
                if u125 then
                    v1 = false
                end
            elseif Character.Humanoid.SeatPart:IsA("VehicleSeat") or u125 then
                v1 = false
            end
        elseif Character.Humanoid.SeatPart:IsA("VehicleSeat") then
            v1 = false
        elseif not Character:WaitForChild("Humanoid").Sit then
            if u125 then
                v1 = false
            end
        elseif Character.Humanoid.SeatPart:IsA("VehicleSeat") or u125 then
            v1 = false
        end

        if v1 then
            if not u124 then
                UserInputService.MouseIconEnabled = false
                LocalPlayer_2.CameraMode = Enum.CameraMode.LockFirstPerson

                Setup(a1)
                LoadClientMods()

                u354 = {Character_2, u345, CurrentCamera, u350}
                u159 = StatusUI:WaitForChild("GunHUD")
                u159.Visible = true
                u160 = true

                Update_Gui()
                EquipAnim()

                if u104.ZoomAnim and u161 == 2 then
                    ZoomAnim()
                end

                Sprint()

                return
            end

            if u124 then
                Unset()
                Setup(a1)
                LoadClientMods()
            end
        end
    end
end)

Humanoid.Seated:Connect(function(a1, a2) -- Line: 1485; upvalues: u287 (val), LocalPlayer (val), Config (val)
    if a1 and a2:IsA("VehicleSeat") then
        Unset()
        u287:UnequipTools()

        LocalPlayer.CameraMaxZoomDistance = Config.VehicleMaxZoom

        return
    end

    LocalPlayer.CameraMaxZoomDistance = game.StarterPlayer.CameraMaxZoomDistance
end)

LocalPlayer.Backpack.ChildRemoved:connect(function(a1) -- Line: 1495; upvalues: Eventos (val)
    Eventos.Holster:FireServer(a1)
end)

Character.ChildRemoved:connect(function(a1) -- Line: 1499; upvalues: u17 (ref), u124 (ref), u15 (ref)
    if a1 == u17 and u124 then
        if u15 then
            u15:Destroy()
        end

        Unset()
    end
end)

u727.RenderStepped:connect(function(a1)
    -- Line: 1510
    -- upvalues: u124 (ref), u366 (ref), CurrentCamera (val), u136 (ref), u104 (ref), u18 (ref), u354 (ref), u254 (val)
    -- upvalues: u819 (ref), new (val), u243 (ref), sin (val), u162 (ref), Config (val), u267 (ref), cos (val)
    -- upvalues: u259 (val), u217 (ref), u184 (ref), u232 (ref), u260 (ref), Humanoid (val), u242 (ref), Angles (val)
    -- upvalues: u269 (ref), new_2 (val), u164 (ref), u166 (ref), u143 (ref), u158 (ref), u147 (ref), u142 (ref)
    -- upvalues: u187 (ref), u161 (ref), u188 (ref), u186 (ref), u159 (ref), u189 (ref), Character (val), u192 (ref)
    -- upvalues: u195 (ref), u194 (ref), u193 (ref), u211 (ref), u197 (ref), u198 (ref), Eventos (val), u17 (ref)
    local v1, v2, v3

    if not u124 then
        u366.CFrame = CurrentCamera.CFrame * CFrame.new(0, 0, -0.5)
        return
    end

    Update_Gui()
    HalfStepFunc(-math.asin(CurrentCamera.CoordinateFrame.lookVector.y))

    u136 = u136:lerp(CFrame.new(), u104.PunchRecover)
    local v4 = Ray.new(u18.Handle.Position, CurrentCamera.CFrame.LookVector * u104.GunSize)
    local v5, v6 = workspace:FindPartOnRayWithIgnoreList(v4, u354, false, true)
    local lookVector_2 = CurrentCamera.CoordinateFrame.lookVector
    local X = lookVector_2.X
    local Y = lookVector_2.Y
    local Z = lookVector_2.Z
    local v7 = math.asin(Y)
    local v8 = -math.atan(X / Z)
    local v9 = lastPitch - v7
    local v10 = lastYaw - v8
    v9 = v9 * (if not ((math.abs(v9)) < 1) then 0 else 1)
    v10 = v10 * (if not ((math.abs(v10)) < 1) then 0 else 1)
    yTilt = yTilt * 0.5 + v9
    xTilt = xTilt * 0.5 + v10
    lastPitch = v7
    lastYaw = v8
    u254.t = new(xTilt, yTilt, u819)
    local p = u254.p
    local z = p.z
    v9 = p.X * 5
    v10 = p.Y * 5
    v8 = (sin(u243 * 3)) * (u162 / Config.RunWalkSpeed * (u267 + 1))
    local v11 = (cos(u243 * 3)) * (u162 / Config.RunWalkSpeed * (u267 + 1))
    v4 = (sin(u243 * 1.75)) * (u162 / Config.RunWalkSpeed * (u267 + 1))
    local v12 = (cos(u243 * 3.5)) * (u162 / Config.RunWalkSpeed * (u267 + 1))
    u259.t = Vector3.new(v8, v11, u267)
    local p_2 = u259.p
    v11 = p_2.X / 3
    v11 = p_2.Y / 3
    v11 = p_2.Z / 10
    local v13 = p_2.X / 1
    local v14 = p_2.Y / 1

    if u217 then
        if not u184 then end

        if not u232 then
            u260 = u162 / Config.RunWalkSpeed + 0.5
            u267 = Lerp(0, 0, 10)
        else
            u260 = Humanoid.WalkSpeed / 3
            u819 = if a then
                Lerp(0, u162 * -0.2 / Config.RunWalkSpeed, 10)
            else
                if not d then
                    Lerp(0, 0, 10)
                else
                    Lerp(0, u162 * 0.2 / Config.RunWalkSpeed, 10)
        end

        v8 = tick()
        u243 = u243 + (v8 - u242) * u260
        u242 = v8
        v8 = Angles(v10 * 0.08726646259971647, -v9 * 0.08726646259971647, -v9 * 0)
        u269 = u269:lerp((new_2(v13 / 220, -v14 / 180, 0)) * new_2(v4 / 220, -v12 / 180, 0) * Angles(0, 0, v11 / 5) * Angles(0, 0, z / 2 / 10), 1)
        u217.C0 = u217.C0:lerp(u269 * v8, 1)
    end

    if u164 and u166 then
        delay(
            5,
            function() -- Line: 1589; upvalues: u166 (upval), u164 (upval)
                if u166 then
                    u164 = false
                end
            end
        )
    end

    if u143 then
        v14 = time()
        v1 = v14 - u158

        if u147 * 2 < v1 then
            u158 = v14
            u143 = math.max(u104.MinSpread, u143 - u104.AimInaccuracyStepAmount / 5)
            u142 = math.max(u104.MinRecoilPower, u142 - u104.RecoilPowerStepAmount / 4)
        end
    end

    if not u164 then
        u18.SmokePart.OverHeat.Enabled = false
    else
        u18.SmokePart.OverHeat.Enabled = true
    end

    if not u184 then
        if not v5 or u186 ~= 0 or u188 ~= false then
            u217.C1 = u217.C1:Lerp((u217.C0:inverse()) * u136 * CFrame.new(), 0.15)
        else
            u217.C1 = u217.C1:Lerp((u217.C0:inverse()) * u136 * CFrame.new(0, 0, ((u18.Handle.Position - v6).magnitude / u104.GunSize - 1) * -u104.GunFOVReduction), 0.15)
        end
    elseif not u187 then
        if u161 ~= 1 then
            if u161 ~= 2 or u18:FindFirstChild("AimPart2") == nil then
                u217.C1 = u217.C1:Lerp(u217.C1 * u217.C0:inverse() * u136 * u18.AimPart.CFrame:toObjectSpace(u366.CFrame), 0.15)
            else
                u217.C1 = u217.C1:Lerp(u217.C1 * u217.C0:inverse() * u136 * u18.AimPart2.CFrame:toObjectSpace(u366.CFrame), 0.15)
            end
        elseif u18:FindFirstChild("AimPart2") ~= nil then
            u217.C1 = u217.C1:Lerp(u217.C1 * u217.C0:inverse() * u136 * CFrame.new() * u18.AimPart.CFrame:toObjectSpace(u366.CFrame), 0.15)
        elseif u161 ~= 2 or u18:FindFirstChild("AimPart2") == nil then
            u217.C1 = u217.C1:Lerp(u217.C1 * u217.C0:inverse() * u136 * u18.AimPart.CFrame:toObjectSpace(u366.CFrame), 0.15)
        else
            u217.C1 = u217.C1:Lerp(u217.C1 * u217.C0:inverse() * u136 * u18.AimPart2.CFrame:toObjectSpace(u366.CFrame), 0.15)
        end
    elseif u18.AimPart:FindFirstChild("NVAim") ~= nil then
        if u188 then
            u184 = false
            u186 = 0
        else
            u217.C1 = u217.C1:Lerp(u217.C1 * u217.C0:inverse() * u136 * CFrame.new() * (u18.AimPart.CFrame * u18.AimPart.NVAim.CFrame):toObjectSpace(u366.CFrame), 0.15)
        end
    elseif u161 ~= 1 then
        if u161 ~= 2 or u18:FindFirstChild("AimPart2") == nil then
            u217.C1 = u217.C1:Lerp(u217.C1 * u217.C0:inverse() * u136 * u18.AimPart.CFrame:toObjectSpace(u366.CFrame), 0.15)
        else
            u217.C1 = u217.C1:Lerp(u217.C1 * u217.C0:inverse() * u136 * u18.AimPart2.CFrame:toObjectSpace(u366.CFrame), 0.15)
        end
    elseif u18:FindFirstChild("AimPart2") ~= nil then
        u217.C1 = u217.C1:Lerp(u217.C1 * u217.C0:inverse() * u136 * CFrame.new() * u18.AimPart.CFrame:toObjectSpace(u366.CFrame), 0.15)
    elseif u161 ~= 2 or u18:FindFirstChild("AimPart2") == nil then
        u217.C1 = u217.C1:Lerp(u217.C1 * u217.C0:inverse() * u136 * u18.AimPart.CFrame:toObjectSpace(u366.CFrame), 0.15)
    else
        u217.C1 = u217.C1:Lerp(u217.C1 * u217.C0:inverse() * u136 * u18.AimPart2.CFrame:toObjectSpace(u366.CFrame), 0.15)
    end

    if u18:FindFirstChild("BipodPoint") == nil then
        u159.Bipod.ImageColor3 = Color3.fromRGB(255, 0, 0)
        local v15 = u104.SwayBase
            + (1
                - Character.Saude.Variaveis.Stamina.Value
                    / Character.Saude.Variaveis.Stamina.MaxValue)
                * u104.MaxSway
        u366.CFrame = CurrentCamera.CFrame * CFrame.new(0, 0, -0.5)
            * CFrame.Angles(math.rad(v15 * (math.sin((tick()) * 2.5))), math.rad(v15 * (math.sin((tick()) * 1.25))), 0)
    else
        v13 = Ray.new(u18.BipodPoint.Position, u18.BipodPoint.CFrame.UpVector * -1.75)
        v1, v2 = workspace:FindPartOnRayWithIgnoreList(v13, u354, false, true)

        if not v1 then
            u159.Bipod.ImageColor3 = Color3.fromRGB(255, 0, 0)
            u188 = false
            u189 = false
            v13 = u104.SwayBase
                + (1
                    - Character.Saude.Variaveis.Stamina.Value
                        / Character.Saude.Variaveis.Stamina.MaxValue)
                    * u104.MaxSway
            u366.CFrame = CurrentCamera.CFrame * CFrame.new(0, 0, -0.5)
                * CFrame.Angles(math.rad(v13 * (math.sin((tick()) * 2.5))), math.rad(v13 * (math.sin((tick()) * 1.25))), 0)
        elseif u186 == 0 then
            u159.Bipod.ImageColor3 = Color3.fromRGB(255, 255, 0)
            u189 = true

            if not u189 or not u188 then
                u159.Bipod.ImageColor3 = Color3.fromRGB(255, 255, 0)
                v3 = u104.SwayBase
                    + (1
                        - Character.Saude.Variaveis.Stamina.Value
                            / Character.Saude.Variaveis.Stamina.MaxValue)
                        * u104.MaxSway
                u366.CFrame = CurrentCamera.CFrame * CFrame.new(0, 0, -0.5)
                    * CFrame.Angles(math.rad(v3 * (math.sin((tick()) * 2.5))), math.rad(v3 * (math.sin((tick()) * 1.25))), 0)
            else
                u159.Bipod.ImageColor3 = Color3.fromRGB(255, 255, 255)
                u366.CFrame = CurrentCamera.CFrame * CFrame.new(0, 0, -0.5)
                    * CFrame.Angles(math.rad((math.sin((tick()) * 2.5)) * 0), math.rad((math.sin((tick()) * 1.25)) * 0), 0)

                if u186 == 0 and not u184 then
                    u217.C1 = u217.C1:Lerp((u217.C0:inverse()) * u136 * CFrame.new(0, ((u18.BipodPoint.Position - v2).magnitude - 1) * -1.5, 0), 0.15)
                end
            end
        elseif u186 ~= 2 then
            u159.Bipod.ImageColor3 = Color3.fromRGB(255, 0, 0)
            u188 = false
            u189 = false
            v13 = u104.SwayBase
                + (1
                    - Character.Saude.Variaveis.Stamina.Value
                        / Character.Saude.Variaveis.Stamina.MaxValue)
                    * u104.MaxSway
            u366.CFrame = CurrentCamera.CFrame * CFrame.new(0, 0, -0.5)
                * CFrame.Angles(math.rad(v13 * (math.sin((tick()) * 2.5))), math.rad(v13 * (math.sin((tick()) * 1.25))), 0)
        else
            u159.Bipod.ImageColor3 = Color3.fromRGB(255, 255, 0)
            u189 = true

            if not u189 or not u188 then
                u159.Bipod.ImageColor3 = Color3.fromRGB(255, 255, 0)
                v3 = u104.SwayBase
                    + (1
                        - Character.Saude.Variaveis.Stamina.Value
                            / Character.Saude.Variaveis.Stamina.MaxValue)
                        * u104.MaxSway
                u366.CFrame = CurrentCamera.CFrame * CFrame.new(0, 0, -0.5)
                    * CFrame.Angles(math.rad(v3 * (math.sin((tick()) * 2.5))), math.rad(v3 * (math.sin((tick()) * 1.25))), 0)
            else
                u159.Bipod.ImageColor3 = Color3.fromRGB(255, 255, 255)
                u366.CFrame = CurrentCamera.CFrame * CFrame.new(0, 0, -0.5)
                    * CFrame.Angles(math.rad((math.sin((tick()) * 2.5)) * 0), math.rad((math.sin((tick()) * 1.25)) * 0), 0)

                if u186 == 0 and not u184 then
                    u217.C1 = u217.C1:Lerp((u217.C0:inverse()) * u136 * CFrame.new(0, ((u18.BipodPoint.Position - v2).magnitude - 1) * -1.5, 0), 0.15)
                end
            end
        end
    end

    if u124 and u192 then
        if not u187 then
            if Config.RealisticLaser then
                u194.Enabled = false
            else
                u194.Enabled = true
            end

            if not u193 then
                u195.Transparency = 0
            else
                u195.Transparency = 1
            end
        else
            u195.Transparency = 0
            u194.Enabled = true
        end

        v12 = Ray.new(u18.LaserPoint.Position, u211.CFrame.lookVector * 999)
        v1, v2, v3 = workspace:FindPartOnRayWithIgnoreList(v12, u354, false, true)
        u197.CFrame = CFrame.new(0, 0, -u198)
        u195.CFrame = CFrame.new(v2, v2 + v3)
        u198 = if not v1 then 999 else (u18.LaserPoint.Position - v2).magnitude
        local v16 = u193

        Eventos.SVLaser:FireServer(v2, 1, u18.LaserPoint.Color, u17, v16)
    end
end)

Eventos.SVFlash.OnClientEvent:Connect(function(a1, a2, a3, a4, a5, a6, a7) -- Line: 1709; upvalues: LocalPlayer (val)
    if a1 ~= LocalPlayer
        and a1.Character["S" .. a3.Name].Grip:FindFirstChild("Flash") ~= nil then
        local v1 = a1.Character["S" .. a3.Name]
        local SpotLight = Instance.new("SpotLight")
        local BillboardGui = Instance.new("BillboardGui")

        if a2 == true then
            SpotLight.Parent = v1.Grip.Flash
            SpotLight.Angle = a4
            SpotLight.Brightness = a5
            SpotLight.Range = a7
            SpotLight.Color = a6
            BillboardGui.Parent = v1.Grip.Flash
            BillboardGui.Adornee = v1.Grip.Flash
            BillboardGui.Size = UDim2.new(10, 0, 10, 0)
            local v2 = Instance.new("ImageLabel", BillboardGui)
            v2.BackgroundTransparency = 1
            v2.Size = UDim2.new(1, 20, 1, 20)
            v2.AnchorPoint = Vector2.new(0.5, 0.5)
            v2.Position = UDim2.new(0.5, 0, 0.5, 0)
            v2.Image = "http://www.roblox.com/asset/?id=1847258023"
            v2.ImageColor3 = a6
            v2.ImageTransparency = 0.25
            v2.Rotation = math.random(-45, 45)

            return
        end

        if v1.Grip.Flash:FindFirstChild("SpotLight") ~= nil then
            v1.Grip.Flash:FindFirstChild("SpotLight"):Destroy()
        end

        if v1.Grip.Flash:FindFirstChild("BillboardGui") ~= nil then
            v1.Grip.Flash:FindFirstChild("BillboardGui"):Destroy()
        end
    end
end)

Eventos.SVLaser.OnClientEvent:Connect(function(a1, a2, a3, a4, a5, a6)
    -- Line: 1748
    -- upvalues: LocalPlayer (val), u350 (val), u187 (ref)
    if a1 ~= LocalPlayer then
        if u350:FindFirstChild(a1.Name .. "_Laser") == nil then
            local Part = Instance.new("Part")
            local Attachment = Instance.new("Attachment")
            Attachment.Name = "Att0"
            Attachment.Parent = Part
            Part.Name = a1.Name .. "_Laser"
            Part.Parent = u350
            Part.Transparency = 1

            if a1.Character
                and a1.Character:FindFirstChild("S" .. a5.Name) ~= nil
                and ((a1.Character:WaitForChild("S" .. a5.Name)):WaitForChild("Grip")):FindFirstChild("Laser")
                    ~= nil then
                local Laser = ((a1.Character:WaitForChild("S" .. a5.Name)):WaitForChild("Grip")):WaitForChild("Laser")
                local Beam = Instance.new("Beam")
                Beam.Parent = Part
                Beam.Transparency = NumberSequence.new(0)
                Beam.LightEmission = 1
                Beam.LightInfluence = 0
                Beam.Attachment0 = Attachment
                Beam.Attachment1 = Laser
                Beam.Color = ColorSequence.new(a4)
                Beam.FaceCamera = true
                Beam.Width0 = 0.01
                Beam.Width1 = 0.01

                if not u187 then
                    Beam.Enabled = false
                end
            end
        end

        if a3 ~= 1 then
            if a3 == 2 and u350:FindFirstChild(a1.Name .. "_Laser") ~= nil then
                u350:FindFirstChild(a1.Name .. "_Laser"):Destroy()
            end
        elseif u350:FindFirstChild(a1.Name .. "_Laser") ~= nil then
            local v1 = u350:FindFirstChild(a1.Name .. "_Laser")
            v1.Shape = "Ball"
            v1.Size = Vector3.new(0.20000000298023224, 0.20000000298023224, 0.20000000298023224)
            v1.CanCollide = false
            v1.Anchored = true
            v1.Color = a4
            v1.Material = Enum.Material.Neon
            v1.Position = a2

            if not u187 then
                if a1.Character
                    and a1.Character:FindFirstChild("S" .. a5.Name) ~= nil
                    and ((a1.Character:WaitForChild("S" .. a5.Name)):WaitForChild("Grip")):FindFirstChild("Laser")
                        ~= nil then
                    if not a6 then
                        v1.Transparency = 0
                    else
                        v1.Transparency = 1
                    end
                end

                if v1:FindFirstChild("Beam") ~= nil then
                    v1.Beam.Enabled = false
                end
            else
                v1.Transparency = 0

                if v1:FindFirstChild("Beam") ~= nil then
                    v1.Beam.Enabled = true
                end
            end
        end
    end
end)

function Launcher()
    -- Line: 1828
    -- upvalues: u104 (ref), Character_2 (val), u18 (ref), u350 (val), u727 (val), u354 (ref), Eventos (val)
    -- upvalues: Hitmarker (val), u339 (val)
    local Attachment, Explosion, Part, Position, Position_2, Position_3, SmokePart2, Trail, WeldConstraint, u123, v1,
        v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12
    local dispatch = 0

    while true do
        if dispatch < 30 then
            if not (dispatch < 17) then
                dispatch = if dispatch < 23 then
                    if dispatch < 20 then
                        if dispatch < 18 then
                            if v4 then 52 else 18
                        else
                            if dispatch < 19 then
                                if not v10 then 48 else 19
                            else
                                if not v10 then 21 else 20
                    else
                        if dispatch < 21 then
                            if 1 <= v10.Transparency then 41 else 21
                        else
                            if dispatch < 22 then
                                if v10.CanCollide == false then 41 else 22
                            else
                                if v10.Name == "Ignorable" then 41 else 23
                else
                    if dispatch < 26 then
                        if dispatch < 24 then
                            if v10.Name == "Glass" then 41 else 24
                        else
                            if dispatch < 25 then
                                if v10.Parent.Name == "Top" then 41 else 25
                            else
                                if v10.Parent.Name == "Helmet" then 41 else 26
                    else
                        if dispatch < 28 then
                            if dispatch < 27 then
                                if v10.Parent.Name == "Up" then 41 else 27
                            else
                                if v10.Parent.Name == "Down" then 41 else 28
                        else
                            if dispatch < 29 then
                                if v10.Parent.Name == "Face" then 41 else 29
                            else
                                if v10.Parent.Name == "Olho" then 41 else 30
            elseif dispatch < 6 then
                if dispatch < 3 then
                    if dispatch < 1 then
                        dispatch = if u104.FireModes.Explosive ~= true then 56 else 1
                    elseif dispatch < 2 then
                        ((Character_2:WaitForChild("S" .. u18.Name)):WaitForChild("Grip")):WaitForChild("Fire2"):Play()

                        SmokePart2 = u18:FindFirstChild("SmokePart2")
                        dispatch = if SmokePart2 then 3 else 2
                    else
                        SmokePart2 = u18:FindFirstChild("FirePart")
                        dispatch = 3
                    end
                elseif dispatch < 4 then
                    Part = Instance.new("Part")
                    Part.Shape = "Ball"
                    Part.CanCollide = false
                    Part.Size = Vector3.new(0.25, 0.25, 0.25)
                    Part.Material = Enum.Material.Metal
                    Part.Color = Color3.fromRGB(27, 42, 53)
                    Part.Parent = u350
                    Part.CFrame = SmokePart2.CFrame
                    Part.Velocity = SmokePart2.CFrame.lookVector * 403.8
                    v1 = u18:FindFirstChild("Mag")
                    dispatch = if not v1 then 13 else 4
                else
                    dispatch = if dispatch < 5 then
                        if not u104.Name then 13 else 5
                    else
                        if not string.find(u104.Name, "RPG") then 13 else 6
                end
            elseif dispatch < 14 then
                if dispatch < 12 then
                    v1.Transparency = 1
                    u123 = v1:Clone()
                    u123.Name = "RocketV"
                    u123.Transparency = 0
                    u123.CanCollide = false
                    u123.CanTouch = false
                    u123.CanQuery = false
                    u123.Massless = true
                    u123.Anchored = false
                    local dispatchExit = nil

                    for i2, i3 in ipairs(u123:GetChildren()) do
                        local dispatch2 = 7

                        while true do
                            if dispatch2 < 9 then
                                dispatch2 = if dispatch2 < 8 then
                                    if i3:IsA("Constraint") then 10 else 8
                                else
                                    if i3:IsA("Motor6D") then 10 else 9
                            else
                                if not (dispatch2 < 10) then
                                    i3:Destroy()
                                    break
                                end

                                if not i3:IsA("Weld") then
                                    break
                                else
                                    dispatch2 = 10
                                end
                            end
                        end

                        if dispatchExit then
                            break
                        end
                    end

                    dispatch = 12
                elseif dispatch < 13 then
                    u123.CFrame = Part.CFrame * CFrame.Angles(0, -1.5707963267948966, 0)
                    u123.Parent = u350
                    WeldConstraint = Instance.new("WeldConstraint")
                    WeldConstraint.Part0 = Part
                    WeldConstraint.Part1 = u123
                    WeldConstraint.Parent = Part
                    Part.Transparency = 1

                    task.delay(
                        8,
                        function() -- Line: 1869; upvalues: u123 (val)
                            if u123 then
                                u123:Destroy()
                            end
                        end
                    )

                    dispatch = 13
                else
                    v1 = Instance.new("Attachment")
                    v1.Name = "At1"
                    v1.Position = Vector3.new(-0.15000000596046448, 0, 0)
                    v1.Parent = Part
                    Attachment = Instance.new("Attachment")
                    Attachment.Name = "At2"
                    Attachment.Position = Vector3.new(0.15000000596046448, 0, 0)
                    Attachment.Parent = Part
                    Trail = Instance.new("Trail")
                    Trail.Transparency = NumberSequence.new({
                        NumberSequenceKeypoint.new(0, 0, 0),
                        (NumberSequenceKeypoint.new(1, 1)),
                    })
                    Trail.WidthScale = NumberSequence.new({
                        NumberSequenceKeypoint.new(0, 2, 0),
                        (NumberSequenceKeypoint.new(1, 1)),
                    })
                    Trail.Texture = "rbxassetid://232918622"
                    Trail.TextureMode = Enum.TextureMode.Stretch
                    Trail.FaceCamera = true
                    Trail.LightEmission = 0
                    Trail.LightInfluence = 1
                    Trail.Lifetime = 0.2
                    Trail.Attachment0 = v1
                    Trail.Attachment1 = Attachment
                    Trail.Parent = Part
                    v9 = u18:FindFirstChild("SmokePart2")
                    dispatch = if v9 then 15 else 14
                end
            elseif dispatch < 15 then
                v9 = u18:FindFirstChild("FirePart")
                dispatch = 15
            elseif dispatch < 16 then
                Position = v9.Position
                Position_2 = Part.Position
                v4 = nil
                dispatch = 16
            else
                u727.Heartbeat:wait()

                Position_3 = Part.Position
                v5, v6, v7, v8 = workspace:FindPartOnRayWithIgnoreList(Ray.new(Position, (Position_3 - Position) * 20), u354, false, true)
                v10 = v5
                v5, v6, v7, v8 = workspace:FindPartOnRayWithIgnoreList(Ray.new(Position, Position_3 - Position), u354, false, true)
                v11 = v5
                v12 = v6
                v2 = v7
                v3 = v8
                dispatch = if not v10 then 52 else 17
            end
        elseif dispatch < 43 then
            dispatch = if dispatch < 36 then
                if dispatch < 33 then
                    if dispatch < 31 then
                        if v10.Parent.Name == "Headset" then 41 else 31
                    else
                        if dispatch < 32 then
                            if v10.Parent.Name == "Numero" then 41 else 32
                        else
                            if v10.Parent.Name == "Vest" then 41 else 33
                else
                    if dispatch < 34 then
                        if v10.Parent.Name == "Chest" then 41 else 34
                    else
                        if dispatch < 35 then
                            if v10.Parent.Name == "Waist" then 41 else 35
                        else
                            if v10.Parent.Name == "Back" then 41 else 36
            else
                if dispatch < 39 then
                    if dispatch < 37 then
                        if v10.Parent.Name == "Belt" then 41 else 37
                    else
                        if dispatch < 38 then
                            if v10.Parent.Name == "Leg1" then 41 else 38
                        else
                            if v10.Parent.Name == "Leg2" then 41 else 39
                else
                    if dispatch < 41 then
                        if dispatch < 40 then
                            if v10.Parent.Name == "Arm1" then 41 else 40
                        else
                            if v10.Parent.Name ~= "Arm2" then 48 else 41
                    else
                        if dispatch < 42 then
                            if v10.Name == "Right Arm" then 48 else 42
                        else
                            if v10.Name == "Left Arm" then 48 else 43
        elseif dispatch < 49 then
            if dispatch < 46 then
                dispatch = if dispatch < 44 then
                    if v10.Name == "Right Leg" then 48 else 44
                else
                    if dispatch < 45 then
                        if v10.Name == "Left Leg" then 48 else 45
                    else
                        if v10.Name == "Armor" then 48 else 46
            elseif dispatch < 47 then
                dispatch = if v10.Name == "EShield" then 48 else 47
            elseif dispatch < 48 then
                table.insert(u354, v10)

                v4 = true
                dispatch = 48
            else
                dispatch = if not v4 then 52 else 49
            end
        elseif dispatch < 53 then
            if dispatch < 51 then
                v5, v6, v7, v8 = workspace:FindPartOnRayWithIgnoreList(Ray.new(Position, (Position_3 - Position) * 20), u354, false, true)
                v10 = v5
                v5, v6, v7, v8 = workspace:FindPartOnRayWithIgnoreList(Ray.new(Position, Position_3 - Position), u354, false, true)
                v11 = v5
                v12 = v6
                v2 = v7
                v3 = v8
                v4 = false
                dispatch = 51
            else
                dispatch = if dispatch < 52 then 17 else if not v11 then 55 else 53
            end
        elseif dispatch < 55 then
            if not (dispatch < 54) then
                Eventos.LauncherHit:FireServer(v12, v11, v2, v3)
                Hitmarker.Explosion(v12, v11, v2)
                Part:remove()

                v1 = Instance.new("Attachment")
                v1.CFrame = CFrame.new(v12, v12 + v2)
                v1.Parent = workspace.Terrain

                u339:AddItem(v1, 5)

                Explosion = Instance.new("Explosion")
                Explosion.BlastPressure = 0
                Explosion.BlastRadius = u104.LauncherRadius
                Explosion.DestroyJointRadiusPercent = 0
                Explosion.Position = v1.Position
                Explosion.Parent = v1
                Explosion.Visible = false

                Explosion.Hit:connect(function(a1, a2)
                    -- Line: 1960
                    -- upvalues: u104 (upval), Explosion (val), Eventos (upval)
                    local v1, v2 = CheckForHumanoid(a1)
                    local v3 = math.random(u104.LauncherDamage[1], u104.LauncherDamage[2])

                    if v1 == true and 0 < v2.Health then
                        local v4 = 1 - a2 / Explosion.BlastRadius

                        if v4 > 0 then
                            Eventos.Damage:FireServer(v2, v3 * v4, 0, 0)
                        end
                    end
                end)

                return
            end

            dispatch = if v4 then 55 else 54
        else
            if not (dispatch < 56) then
                return
            end

            Position = Position_3
            dispatch = 16
        end
    end
end

Eventos.LauncherHit.OnClientEvent:Connect(function(a1, a2, a3, a4)
    -- Line: 1980
    -- upvalues: LocalPlayer (val), Hitmarker (val)
    if a1 ~= LocalPlayer then
        Hitmarker.Explosion(a2, a3, a4)
    end
end)

function Shoot()
    -- Line: 1986
    -- upvalues: u124 (ref), u170 (ref), u104 (ref), u165 (ref), u150 (ref), u153 (ref), u18 (ref), u151 (ref)
    -- upvalues: u146 (ref), u166 (ref), u185 (ref), u167 (ref), u16 (ref), u144 (ref), Eventos (val), u147 (ref)
    -- upvalues: u105 (ref), u17 (ref), u15 (ref), u143 (ref), u156 (ref), u142 (ref), u164 (ref), u149 (ref)
    -- upvalues: u148 (ref), u184 (ref)
    local Bullets, Bullets_2, Bullets_3, Bullets_4, BurstShot, v1, v2
    local dispatch = 0

    while true do
        if dispatch < 38 then
            if dispatch < 18 then
                if dispatch < 9 then
                    if dispatch < 4 then
                        if not (dispatch < 2) then
                            dispatch = if dispatch < 3 then
                                if u165 then 5 else 3
                            else
                                if not u150.Value then 5 else 4
                        elseif dispatch < 1 then
                            dispatch = if not u124 then 87 else 1
                        else
                            u170 = true
                            dispatch = if u104.Mode == "Explosive" then 7 else 2
                        end
                    elseif dispatch < 7 then
                        if not (dispatch < 5) then
                            u18.Handle.Click:Play()
                            return
                        end

                        dispatch = if u153.Value ~= true then 11 else 5
                    else
                        dispatch = if dispatch < 8 then
                            if u104.Mode ~= "Explosive" then 9 else 8
                        else
                            if u151.Value == false then 10 else 9
                    end
                elseif dispatch < 13 then
                    if dispatch < 11 then
                        if not (dispatch < 10) then
                            u18.Handle.Click:Play()
                            return
                        end

                        dispatch = if not (u146.Value <= 0) then 11 else 10
                    else
                        dispatch = if dispatch < 12 then
                            if not u166 then 87 else 12
                        else
                            if u185 then 87 else 13
                    end
                elseif dispatch < 15 then
                    dispatch = if dispatch < 14 then if u167 then 87 else 14 else if u16 then 87 else 15
                elseif dispatch < 16 then
                    u166 = false
                    dispatch = if u104.Mode ~= "Semi" then 27 else 16
                else
                    dispatch = if dispatch < 17 then
                        if not (0 < u144.Value) then 27 else 17
                    else
                        if u153.Value ~= false then 27 else 18
                end
            elseif dispatch < 28 then
                if dispatch < 23 then
                    if dispatch < 21 then
                        if dispatch < 20 then
                            Eventos.Atirar:FireServer(u147, u105, u17)

                            Bullets = u104.Bullets
                            local dispatchExit = nil

                            for i11 = 1, Bullets do
                                coroutine.resume(
                                    coroutine.create(function() -- Line: 2007; upvalues: u15 (upval), u143 (upval)
                                        u15 = CreateBullet(u143)
                                        CastRay(u15)
                                    end)
                                )
                            end

                            dispatch = 20
                        else
                            recoil()
                            Emperrar()

                            dispatch = 21
                        end
                    elseif dispatch < 22 then
                        u144.Value = u144.Value - 1
                        dispatch = if not u143 then 24 else 22
                    else
                        dispatch = if u156 then 24 else 23
                    end
                elseif dispatch < 25 then
                    if dispatch < 24 then
                        u143 = math.min(u104.MaxSpread, u143 + u104.AimInaccuracyStepAmount)
                        u142 = math.min(u104.MaxRecoilPower, u142 + u104.RecoilPowerStepAmount)
                        dispatch = 24
                    else
                        u156 = not u156
                        v1 = u143
                        dispatch = if not (u104.MaxSpread <= v1) then 26 else 25
                    end
                elseif dispatch < 26 then
                    u164 = true
                    dispatch = 26
                elseif dispatch < 27 then
                    wait(u149)

                    dispatch = 86
                else
                    dispatch = if u104.Mode ~= "Auto" then 43 else 28
                end
            elseif dispatch < 32 then
                dispatch = if dispatch < 30 then
                    if dispatch < 29 then if not u170 then 86 else 29 else if not u124 then 86 else 30
                else
                    if dispatch < 31 then
                        if u166 then 86 else 31
                    else
                        if u153.Value ~= false then 86 else 32
            elseif dispatch < 35 then
                if dispatch < 33 then
                    dispatch = if not (0 < u144.Value) then 86 else 33
                else
                    Eventos.Atirar:FireServer(u147, u105, u17)

                    Bullets_2 = u104.Bullets
                    local dispatchExit2 = nil
                    
                    for i12 = 1, Bullets_2 do
                        coroutine.resume(
                            coroutine.create(function() -- Line: 2033; upvalues: u15 (upval), u143 (upval)
                                u15 = CreateBullet(u143)
                                CastRay(u15)
                            end)
                        )
                    end

                    dispatch = 35
                end
            elseif dispatch < 36 then
                recoil()
                Emperrar()

                dispatch = 36
            elseif dispatch < 37 then
                u144.Value = u144.Value - 1
                dispatch = if not u143 then 39 else 37
            else
                dispatch = if u156 then 39 else 38
            end
        elseif dispatch < 70 then
            if dispatch < 60 then
                if dispatch < 43 then
                    if dispatch < 40 then
                        if dispatch < 39 then
                            u143 = math.min(u104.MaxSpread, u143 + u104.AimInaccuracyStepAmount)
                            u142 = math.min(u104.MaxRecoilPower, u142 + u104.RecoilPowerStepAmount)
                            dispatch = 39
                        else
                            u156 = not u156
                            v1 = u143
                            dispatch = if not (u104.MaxSpread <= v1) then 41 else 40
                        end
                    elseif dispatch < 41 then
                        u164 = true
                        dispatch = 41
                    else
                        wait(u147)

                        dispatch = 28
                    end
                elseif dispatch < 45 then
                    dispatch = if dispatch < 44 then
                        if u104.Mode ~= "Burst" then 60 else 44
                    else
                        if not (0 < u144.Value) then 60 else 45
                elseif dispatch < 59 then
                    BurstShot = u104.BurstShot
                    local dispatchExit3 = nil

                    for i13 = 1, BurstShot do
                        local dispatch2 = 46

                        while true do
                            if dispatch2 < 55 then
                                if dispatch2 < 53 then
                                    Bullets_3 = u104.Bullets
                                    local dispatchExit4 = nil

                                    for i14 = 1, Bullets_3 do
                                        local dispatch3 = 47

                                        while true do
                                            if dispatch3 < 49 then
                                                if dispatch3 < 48 then
                                                    if not u170 then
                                                        break
                                                    else
                                                        dispatch3 = 48
                                                    end
                                                elseif not (0 < u144.Value) then
                                                    break
                                                else
                                                    dispatch3 = 49
                                                end
                                            elseif not (dispatch3 < 50) then
                                                if not (dispatch3 < 51) then
                                                    u144.Value = u144.Value - 1
                                                    break
                                                end

                                                Eventos.Atirar:FireServer(u147, u105, u17)

                                                coroutine.resume(
                                                    coroutine.create(function()
                                                        -- Line: 2061
                                                        -- upvalues: u15 (upval), u143 (upval)
                                                        u15 = CreateBullet(u143)
                                                        CastRay(u15)
                                                    end)
                                                )

                                                recoil()
                                                Emperrar()

                                                dispatch3 = 51
                                            elseif u153.Value ~= false then
                                                break
                                            else
                                                dispatch3 = 50
                                            end
                                        end

                                        if dispatchExit4 then
                                            break
                                        end
                                    end

                                    dispatch2 = 53
                                else
                                    dispatch2 = if dispatch2 < 54 then
                                        if not u143 then 56 else 54
                                    else
                                        if u156 then 56 else 55
                                end
                            elseif dispatch2 < 56 then
                                u143 = math.min(u104.MaxSpread, u143 + u104.AimInaccuracyStepAmount)
                                u142 = math.min(u104.MaxRecoilPower, u142 + u104.RecoilPowerStepAmount)
                                dispatch2 = 56
                            else
                                if not (dispatch2 < 57) then
                                    u164 = true
                                    break
                                end

                                u156 = not u156
                                v2 = u143

                                if not (u104.MaxSpread <= v2) then
                                    break
                                else
                                    dispatch2 = 57
                                end
                            end
                        end

                        if dispatchExit3 then
                            break
                        end

                        wait(u148)
                    end

                    dispatch = 59
                else
                    dispatch = 86
                end
            elseif dispatch < 64 then
                dispatch = if dispatch < 62 then
                    if dispatch < 61 then
                        if u104.Mode == "Bolt-Action" then 64 else 61
                    else
                        if u104.Mode ~= "Pump-Action" then 81 else 62
                else
                    if dispatch < 63 then
                        if not (0 < u144.Value) then 81 else 63
                    else
                        if u153.Value ~= false then 81 else 64
            elseif dispatch < 67 then
                if dispatch < 66 then
                    Eventos.Atirar:FireServer(u147, u105, u17)

                    Bullets_4 = u104.Bullets
                    local dispatchExit5 = nil

                    for i15 = 1, Bullets_4 do
                        coroutine.resume(
                            coroutine.create(function() -- Line: 2090; upvalues: u15 (upval), u143 (upval)
                                u15 = CreateBullet(u143)
                                CastRay(u15)
                            end)
                        )
                    end

                    dispatch = 66
                else
                    recoil()

                    dispatch = if not (0 < u144.Value - 1) then 68 else 67
                end
            elseif dispatch < 68 then
                u153.Value = true
                dispatch = 68
            elseif dispatch < 69 then
                dispatch = 69
            else
                u144.Value = u144.Value - 1
                dispatch = if not u143 then 72 else 70
            end
        elseif dispatch < 79 then
            if dispatch < 74 then
                if dispatch < 72 then
                    if dispatch < 71 then
                        dispatch = if u156 then 72 else 71
                    else
                        u143 = math.min(u104.MaxSpread, u143 + u104.AimInaccuracyStepAmount)
                        u142 = math.min(u104.MaxRecoilPower, u142 + u104.RecoilPowerStepAmount)
                        dispatch = 72
                    end
                elseif dispatch < 73 then
                    u156 = not u156
                    v1 = u143
                    dispatch = if not (u104.MaxSpread <= v1) then 74 else 73
                else
                    u164 = true
                    dispatch = 74
                end
            elseif dispatch < 76 then
                dispatch = if dispatch < 75 then
                    if not u104.AutoChamber then 80 else 75
                else
                    if not u184 then 78 else 76
            elseif dispatch < 77 then
                dispatch = if not u104.ChamberWhileAim then 78 else 77
            elseif dispatch < 78 then
                u170 = false
                u166 = false
                u185 = true

                ChamberAnim()
                Sprint()

                u166 = true
                u185 = false
                dispatch = 80
            else
                dispatch = if u184 then 80 else 79
            end
        elseif dispatch < 83 then
            if not (dispatch < 81) then
                dispatch = if dispatch < 82 then
                    if u104.Mode ~= "Explosive" then 86 else 82
                else
                    if not (0 < u146.Value) then 86 else 83
            elseif dispatch < 80 then
                u170 = false
                u166 = false
                u185 = true

                ChamberAnim()
                Sprint()

                u166 = true
                u185 = false
                dispatch = 80
            else
                wait(u147)

                dispatch = 86
            end
        elseif dispatch < 85 then
            dispatch = if dispatch < 84 then
                if u151.Value ~= true then 86 else 84
            else
                if u16 then 86 else 85
        elseif dispatch < 86 then
            u151.Value = false
            u146.Value = u146.Value - 1

            coroutine.resume(
                coroutine.create(function() -- Line: 2137
                    Launcher()
                end)
            )

            dispatch = 86
        else
            if not (dispatch < 87) then
                return
            end

            u166 = true
            Update_Gui()

            dispatch = 87
        end
    end
end

if not UserInputService.TouchEnabled then
    Mouse_2.Button1Down:connect(function() -- Line: 2152
        Shoot()
    end)

    Mouse_2.Button1Up:connect(function() -- Line: 2156; upvalues: u124 (ref), u170 (ref)
        if u124 then
            u170 = false
        end
    end)
end

Mouse_2.WheelForward:connect(function()
    -- Line: 2167
    -- upvalues: u124 (ref), u184 (ref), u185 (ref), u16 (ref), u170 (ref), u186 (ref), u167 (ref), Eventos (val)
    -- upvalues: u104 (ref), u105 (ref), u154 (ref)
    if u124 and not u184 and not u185 and not u16 then
        u170 = false

        if u186 == 0 then
            u167 = true
            u186 = 1

            Eventos.Stance:FireServer(u186, u104, u105)
            StanceUp()
        elseif u186 == -1 then
            u167 = false
            u186 = 0

            Eventos.Stance:FireServer(u186, u104, u105)
            IdleAnim()
        elseif u186 == -2 then
            u167 = true
            u186 = -1

            Eventos.Stance:FireServer(u186, u104, u105)
            StanceDown()
        end

        Update_Gui()
    end

    if u124 and u184 and u154.Value < 100 then
        u154.Value = u154.Value + 5
        Update_Gui()

        local UserInputService = game:GetService("UserInputService")
        UserInputService.MouseDeltaSensitivity = u154.Value / 100
    end
end)

Mouse_2.WheelBackward:connect(function()
    -- Line: 2197
    -- upvalues: u124 (ref), u184 (ref), u185 (ref), u16 (ref), u170 (ref), u186 (ref), u167 (ref), Eventos (val)
    -- upvalues: u104 (ref), u105 (ref), u154 (ref)
    if u124 and not u184 and not u185 and not u16 then
        u170 = false

        if u186 == 0 then
            u167 = true
            u186 = -1

            Eventos.Stance:FireServer(u186, u104, u105)
            StanceDown()
        elseif u186 == -1 then
            u167 = true
            u186 = -2

            Eventos.Stance:FireServer(u186, u104, u105)
            Patrol()
        elseif u186 == 1 then
            u167 = false
            u186 = 0

            Eventos.Stance:FireServer(u186, u104, u105)
            IdleAnim()
        end

        Update_Gui()
    end

    if u124 and u184 and 5 < u154.Value then
        u154.Value = u154.Value - 5
        Update_Gui()

        local UserInputService = game:GetService("UserInputService")
        UserInputService.MouseDeltaSensitivity = u154.Value / 100
    end
end)

function OnMB2Down()
    -- Line: 2227
    -- upvalues: LocalPlayer (val), u124 (ref), u186 (ref), u184 (ref), CurrentCamera (val), u16 (ref), u187 (ref)
    -- upvalues: u18 (ref), u188 (ref), u167 (ref), Eventos (val), u104 (ref), u105 (ref), u154 (ref), u161 (ref)
    -- upvalues: u275 (val), StatusUI (ref)
    if LocalPlayer:GetAttribute("Juggernaut") == true then
        return
    end

    if u124
        and u186 > -2
        and not u184
        and (CurrentCamera.Focus.p - CurrentCamera.CFrame.p).magnitude < 1
        and not u16 then
        if u187 and u18.AimPart:FindFirstChild("NVAim") ~= nil and u188 then
            return
        end

        if u167 then
            u167 = false
            IdleAnim()
            Update_Gui()
        end

        u186 = 2
        Eventos.Stance:FireServer(u186, u104, u105)

        u184 = true
        local UserInputService = game:GetService("UserInputService")
        UserInputService.MouseDeltaSensitivity = u154.Value / 100

        u18.Handle.AimDown:Play()

        if u187 and u18.AimPart:FindFirstChild("NVAim") ~= nil then
            tweenFoV(70, 120)

            u275:Create(
                StatusUI.Efeitos.Aim,
                TweenInfo.new(0.3),
                {ImageTransparency = 1}
            ):Play()

            return
        end

        if u18:FindFirstChild("AimPart2") ~= nil then
            if u161 == 1 then
                tweenFoV(u104.ChangeFOV[1], 120)

                if u104.FocusOnSight then
                    u275:Create(
                        StatusUI.Efeitos.Aim,
                        TweenInfo.new(0.75),
                        {ImageTransparency = 0}
                    ):Play()
                    return
                end

                u275:Create(
                    StatusUI.Efeitos.Aim,
                    TweenInfo.new(0.3),
                    {ImageTransparency = 1}
                ):Play()

                return
            end

            if u161 ~= 2 then
                return
            end

            tweenFoV(u104.ChangeFOV[2], 120)

            if u104.FocusOnSight2 then
                u275:Create(
                    StatusUI.Efeitos.Aim,
                    TweenInfo.new(0.75),
                    {ImageTransparency = 0}
                ):Play()
                return
            end

            u275:Create(
                StatusUI.Efeitos.Aim,
                TweenInfo.new(0.3),
                {ImageTransparency = 1}
            ):Play()

            return
        end

        if u161 == 1 then
            tweenFoV(u104.ChangeFOV[1], 120)

            if u104.FocusOnSight then
                u275:Create(
                    StatusUI.Efeitos.Aim,
                    TweenInfo.new(0.75),
                    {ImageTransparency = 0}
                ):Play()
                return
            end

            u275:Create(
                StatusUI.Efeitos.Aim,
                TweenInfo.new(0.3),
                {ImageTransparency = 1}
            ):Play()

            return
        end

        if u161 ~= 2 then
            return
        end

        tweenFoV(u104.ChangeFOV[2], 120)

        if u104.FocusOnSight2 then
            u275:Create(
                StatusUI.Efeitos.Aim,
                TweenInfo.new(0.75),
                {ImageTransparency = 0}
            ):Play()
            return
        end

        u275:Create(
            StatusUI.Efeitos.Aim,
            TweenInfo.new(0.3),
            {ImageTransparency = 1}
        ):Play()

        return
    end

    if u184 and u124 then
        u186 = 0
        Eventos.Stance:FireServer(u186, u104, u105)

        local UserInputService_2 = game:GetService("UserInputService")
        UserInputService_2.MouseDeltaSensitivity = 1

        u18.Handle.AimUp:Play()
        tweenFoV(70, 120)

        u184 = false
        u275:Create(
            StatusUI.Efeitos.Aim,
            TweenInfo.new(0.3),
            {ImageTransparency = 1}
        ):Play()
    end
end

Mouse_2.Button2Down:connect(function() -- Line: 2293
    OnMB2Down()
end)

Humanoid.Died:connect(function() -- Line: 2297; upvalues: Humanoid (val), Eventos (val)
    ResetWorkspace()
    Humanoid:UnequipTools()
    Eventos.Rappel.CutEvent:FireServer()
    Unset()
end)

function onStateChanged(a1, a2)
    -- Line: 2305
    -- upvalues: u125 (ref), u124 (ref), u287 (val), Config (val), LocalPlayer (val), u163 (ref), u302 (val), FX (val)
    -- upvalues: LocalPlayer_2 (val), Humanoid (val), u339 (val), Eventos (val)
    if a2 ~= Enum.HumanoidStateType.Swimming then
        u125 = false
    else
        u125 = true

        if u124 then
            Unset()
            u287:UnequipTools()
        end
    end

    if Config.EnableFallDamage then
        local v1 = LocalPlayer:GetAttribute("Juggernaut") == true

        if not v1 then
            if a2 == Enum.HumanoidStateType.Freefall and not u163 then
                u163 = true
                local magnitude = 0
                local v2 = 0

                while u163 do
                    magnitude = u302.Velocity.magnitude
                    v2 = v2 + 1

                    wait()
                end

                local v3 = (magnitude - Config.MaxVelocity) * Config.DamageMult

                if v3 > 5 and v2 > 20 then
                    v1 = FX.FallDamage:Clone()
                    v1.Parent = LocalPlayer_2.PlayerGui
                    v1.Volume = v3 / Humanoid.MaxHealth

                    v1:Play()
                    u339:AddItem(v1, v1.TimeLength)
                    Eventos.Damage:FireServer(Humanoid, v3, 0, 0)

                    return
                end

                return
            end

            if a2 == Enum.HumanoidStateType.Landed or a2 == Enum.HumanoidStateType.Dead then
                u163 = false
            end
        end
    end
end

Eventos.ServerBullet.OnClientEvent:Connect(function(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11)
    -- Line: 2342
    -- upvalues: LocalPlayer (val), u339 (val), u727 (val)
    if a1 ~= LocalPlayer and a1.Character then
        local v1, v2
        local Part = Instance.new("Part")
        Part.Parent = workspace.ACS_WorkSpace.Server
        Part.Name = a1.Name .. "_Bullet"

        u339:AddItem(Part, 5)

        Part.Shape = "Ball"
        Part.Size = Vector3.new(1, 1, 1)
        Part.CanCollide = false
        Part.CFrame = a2
        Part.Transparency = 1
        local Mass = Part:GetMass()
        local v3 = Instance.new("BodyForce", Part)
        v3.Force = Vector3.new(0, Mass * 196.2 - a4 * 196.2, 0)
        Part.Velocity = a6 * a5
        v3 = Instance.new("Attachment", Part)
        v3.Position = Vector3.new(0.10000000149011612, 0, 0)
        local v4 = Instance.new("Attachment", Part)
        v4.Position = Vector3.new(-0.10000000149011612, 0, 0)

        if a3 then
            v1 = Instance.new("Trail", Part)
            v1.Attachment0 = v3
            v1.Attachment1 = v4
            v1.Transparency = NumberSequence.new({NumberSequenceKeypoint.new(0, 0, 0), (NumberSequenceKeypoint.new(1, 1))})
            v1.WidthScale = NumberSequence.new({NumberSequenceKeypoint.new(0, 2, 0), (NumberSequenceKeypoint.new(1, 0))})
            v1.Texture = "rbxassetid://232918622"
            v1.TextureMode = Enum.TextureMode.Stretch
            v1.LightEmission = 1
            v1.Lifetime = 0.2
            v1.FaceCamera = true
            v1.Color = ColorSequence.new(a7)
        end

        if a9 then
            v3 = Instance.new("BillboardGui", Part)
            v3.Adornee = Part
            v4 = math.random(375, 475) / 10
            v3.Size = UDim2.new(v4, 0, v4, 0)
            v3.LightInfluence = 0
            v4 = Instance.new("ImageLabel", v3)
            v4.BackgroundTransparency = 1
            v4.Size = UDim2.new(1, 0, 1, 0)
            v4.Position = UDim2.new(0, 0, 0, 0)
            v4.Image = "http://www.roblox.com/asset/?id=1047066405"
            v4.ImageColor3 = a10
            v4.ImageTransparency = math.random(2, 5) / 15

            if Part:FindFirstChild("BillboardGui") ~= nil then
                Part.BillboardGui.Enabled = true
            end
        end

        v1 = {a1.Character, Part, workspace.ACS_WorkSpace}

        repeat
            u727.Heartbeat:wait()

            v2 = Ray.new(Part.Position, Part.CFrame.LookVector * 25)
        until (workspace:FindPartOnRayWithIgnoreList(v2, v1, false, true))

        game.Debris:AddItem(Part, 0)
        game.Debris:AddItem(Part, 0)

        return Part
    end
end)

Humanoid.StateChanged:connect(onStateChanged)

Eventos.ACS_AI.AIBullet.OnClientEvent:Connect(function(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11)
    -- Line: 2426
    -- upvalues: LocalPlayer (val), u339 (val), u727 (val)
    local v1, v2

    if a1 == LocalPlayer then
        return
    end

    local Part = Instance.new("Part")
    Part.Parent = workspace.ACS_WorkSpace.Server
    Part.Name = "AI_Bullet"

    u339:AddItem(Part, 5)

    Part.Shape = "Ball"
    Part.Size = Vector3.new(1, 1, 1)
    Part.CanCollide = false
    Part.CFrame = a2
    Part.Transparency = 1
    local Mass = Part:GetMass()
    local v3 = Instance.new("BodyForce", Part)
    v3.Force = Vector3.new(0, Mass * 196.2 - a4 * 196.2, 0)
    Part.Velocity = a6 * a5
    v3 = Instance.new("Attachment", Part)
    v3.Position = Vector3.new(0.10000000149011612, 0, 0)
    local v4 = Instance.new("Attachment", Part)
    v4.Position = Vector3.new(-0.10000000149011612, 0, 0)

    if a3 then
        v1 = Instance.new("Trail", Part)
        v1.Attachment0 = v3
        v1.Attachment1 = v4
        v1.Transparency = NumberSequence.new({NumberSequenceKeypoint.new(0, 0, 0), (NumberSequenceKeypoint.new(1, 1))})
        v1.WidthScale = NumberSequence.new({NumberSequenceKeypoint.new(0, 2, 0), (NumberSequenceKeypoint.new(1, 0))})
        v1.Texture = "rbxassetid://232918622"
        v1.TextureMode = Enum.TextureMode.Stretch
        v1.LightEmission = 1
        v1.Lifetime = 0.2
        v1.FaceCamera = true
        v1.Color = ColorSequence.new(a7)
    end

    if a9 then
        v3 = Instance.new("BillboardGui", Part)
        v3.Adornee = Part
        v4 = math.random(375, 475) / 10
        v3.Size = UDim2.new(v4, 0, v4, 0)
        v3.LightInfluence = 0
        v4 = Instance.new("ImageLabel", v3)
        v4.BackgroundTransparency = 1
        v4.Size = UDim2.new(1, 0, 1, 0)
        v4.Position = UDim2.new(0, 0, 0, 0)
        v4.Image = "http://www.roblox.com/asset/?id=1047066405"
        v4.ImageColor3 = a10
        v4.ImageTransparency = math.random(2, 5) / 15

        if Part:FindFirstChild("BillboardGui") ~= nil then
            Part.BillboardGui.Enabled = true
        end
    end

    v1 = {Part, workspace.ACS_WorkSpace}

    repeat
        u727.Heartbeat:wait()

        v2 = Ray.new(Part.Position, Part.CFrame.LookVector * 25)
    until (workspace:FindPartOnRayWithIgnoreList(v2, v1, false, true))

    game.Debris:AddItem(Part, 0)
    game.Debris:AddItem(Part, 0)

    return Part
end)

Eventos.ACS_AI.AIShoot.OnClientEvent:Connect(function(a1) -- Line: 2508
    for k, v in pairs(a1.Muzzle:GetChildren()) do
        if v.Name:sub(1, 7) == "FlashFX" or v.Name:sub(1, 7) == "Smoke" then
            v.Enabled = true
        end
    end

    delay(
        0.03333333333333333,
        function() -- Line: 2516; upvalues: a1 (val)
            for k, v in pairs(a1.Muzzle:GetChildren()) do
                if v.Name:sub(1, 7) == "FlashFX" or v.Name:sub(1, 7) == "Smoke" then
                    v.Enabled = false
                end
            end
        end
    )
end)

function Reload()
    -- Line: 2530
    -- upvalues: LocalPlayer (val), u169 (ref), u145 (ref), u104 (ref), u185 (ref), u144 (ref), u150 (ref), u170 (ref)
    -- upvalues: u166 (ref), u167 (ref), u186 (ref), Eventos (val), u105 (ref), u165 (ref), u168 (ref), u146 (ref)
    -- upvalues: u151 (ref)
    if LocalPlayer:GetAttribute("Juggernaut") == true then
        return
    end

    u169 = false

    if 0 < u145.Value
        and u104.Mode ~= "Explosive"
        and not u185
        and u104.ReloadType == 1 then
        if u104.IncludeChamberedBullet and u144.Value == u104.Ammo + 1 then
            return
        end

        if not u104.IncludeChamberedBullet
            and u144.Value == u104.Ammo
            and u150.Value == true then
            return
        end

        u170 = false
        u166 = false
        u185 = true

        if u167 then
            u167 = false
            u186 = 0

            Eventos.Stance:FireServer(u186, u104, u105)
            IdleAnim()
            Update_Gui()
            wait(0.25)
        end

        ReloadAnim()

        if u150.Value ~= false or u165 ~= true then
            if u150.Value == false and u165 == false and u104.FastReload == true then
                ChamberAnim()
            end
        elseif u104.FastReload == true then
            ChamberBKAnim()
        elseif u150.Value == false and u165 == false and u104.FastReload == true then
            ChamberAnim()
        end

        Sprint()
        Update_Gui()

        u166 = true
        u185 = false

        return
    end

    if 0 < u145.Value
        and u104.Mode ~= "Explosive"
        and not u185
        and u104.ReloadType == 2 then
        if u104.IncludeChamberedBullet and u144.Value == u104.Ammo + 1 then
            Sprint()
            Update_Gui()

            return
        end

        if not u104.IncludeChamberedBullet
            and u144.Value == u104.Ammo
            and u150.Value == true then
            Sprint()
            Update_Gui()

            return
        end

        if u169 then
            Sprint()
            Update_Gui()

            return
        end

        u170 = false
        u166 = false
        u185 = true

        if u167 then
            u167 = false
            u186 = 0

            Eventos.Stance:FireServer(u186)
            Sprint()
            Update_Gui()
            wait(0.25)
        end

        local v1 = u104.Ammo - u144.Value

        for i = 1, v1 do
            if 0 < u145.Value and not u169 and u144.Value < u104.Ammo and not u168 then
                ShellInsertAnim()
            end
        end

        if u150.Value ~= false or u165 ~= true then
            if u150.Value == false and u165 == false and u104.FastReload == true then
                ChamberAnim()
            end
        elseif u104.FastReload == true then
            ChamberBKAnim()
        elseif u150.Value == false and u165 == false and u104.FastReload == true then
            ChamberAnim()
        end

        Update_Gui()
        Sprint()

        u169 = false
        u166 = true
        u185 = false

        return
    end

    if 0 < u145.Value
        and u104.Mode ~= "Explosive"
        and u185
        and u104.ReloadType == 2
        and u168 then
        if u169 then
            return
        end

        u169 = true
        Sprint()
        Update_Gui()
        wait(0.25)

        return
    end

    if not u185
        and 0 < u146.Value
        and u104.Mode == "Explosive"
        and u151.Value == false then
        u170 = false
        u166 = false
        u185 = true

        GLReloadAnim()

        u151.Value = true
        Sprint()
        Update_Gui()

        u166 = true
        u185 = false
    end
end

function Chamber()
    -- Line: 2614
    -- upvalues: LocalPlayer (val), u170 (ref), u166 (ref), u185 (ref), u167 (ref), u186 (ref), Eventos (val)
    -- upvalues: u104 (ref), u105 (ref), u165 (ref)
    if LocalPlayer:GetAttribute("Juggernaut") == true then
        return
    end

    u170 = false
    u166 = false
    u185 = true

    if u167 then
        u167 = false
        u186 = 0

        Eventos.Stance:FireServer(u186, u104, u105)
        IdleAnim()
        Update_Gui()
    end

    if u165 then
        ChamberBKAnim()
    else
        ChamberAnim()
    end

    Sprint()
    Update_Gui()

    u166 = true
    u185 = false
end

function FireMode() -- Line: 2642; upvalues: u18 (ref), u104 (ref), u159 (ref)
    local dispatch = 0

    while true do
        if dispatch < 24 then
            if dispatch < 12 then
                if dispatch < 6 then
                    if not (dispatch < 3) then
                        dispatch = if dispatch < 4 then
                            if u104.Mode ~= "Semi" then 7 else 4
                        else
                            if dispatch < 5 then
                                if u104.FireModes.Burst ~= false then 7 else 5
                            else
                                if u104.FireModes.Auto ~= true then 7 else 6
                    elseif dispatch < 1 then
                        u18.Handle.SafetyClick:Play()

                        dispatch = if u104.Mode ~= "Semi" then 3 else 1
                    elseif dispatch < 2 then
                        dispatch = if u104.FireModes.Burst ~= true then 3 else 2
                    else
                        u159.FText.Text = "Burst"
                        u104.Mode = "Burst"
                        dispatch = 48
                    end
                elseif dispatch < 9 then
                    if dispatch < 7 then
                        u159.FText.Text = "Auto"
                        u104.Mode = "Auto"
                        dispatch = 48
                    else
                        dispatch = if dispatch < 8 then
                            if u104.Mode ~= "Semi" then 12 else 8
                        else
                            if u104.FireModes.Burst ~= false then 12 else 9
                    end
                elseif dispatch < 10 then
                    dispatch = if u104.FireModes.Auto ~= false then 12 else 10
                elseif dispatch < 11 then
                    dispatch = if u104.FireModes.Explosive ~= true then 12 else 11
                else
                    u159.FText.Text = "Explosive"
                    u104.Mode = "Explosive"
                    dispatch = 48
                end
            elseif dispatch < 18 then
                if not (dispatch < 15) then
                    dispatch = if dispatch < 16 then
                        if u104.Mode ~= "Burst" then 19 else 16
                    else
                        if dispatch < 17 then
                            if u104.FireModes.Explosive ~= true then 19 else 17
                        else
                            if u104.FireModes.Auto ~= false then 19 else 18
                elseif dispatch < 13 then
                    dispatch = if u104.Mode ~= "Burst" then 15 else 13
                elseif dispatch < 14 then
                    dispatch = if u104.FireModes.Auto ~= true then 15 else 14
                else
                    u159.FText.Text = "Auto"
                    u104.Mode = "Auto"
                    dispatch = 48
                end
            elseif dispatch < 21 then
                if dispatch < 19 then
                    u159.FText.Text = "Explosive"
                    u104.Mode = "Explosive"
                    dispatch = 48
                else
                    dispatch = if dispatch < 20 then
                        if u104.Mode ~= "Burst" then 24 else 20
                    else
                        if u104.FireModes.Semi ~= true then 24 else 21
                end
            elseif dispatch < 22 then
                dispatch = if u104.FireModes.Auto ~= false then 24 else 22
            elseif dispatch < 23 then
                dispatch = if u104.FireModes.Explosive ~= false then 24 else 23
            else
                u159.FText.Text = "Semi"
                u104.Mode = "Semi"
                dispatch = 48
            end
        elseif dispatch < 36 then
            if dispatch < 30 then
                if not (dispatch < 27) then
                    dispatch = if dispatch < 28 then
                        if u104.Mode ~= "Auto" then 31 else 28
                    else
                        if dispatch < 29 then
                            if u104.FireModes.Semi ~= true then 31 else 29
                        else
                            if u104.FireModes.Explosive ~= false then 31 else 30
                elseif dispatch < 25 then
                    dispatch = if u104.Mode ~= "Auto" then 27 else 25
                elseif dispatch < 26 then
                    dispatch = if u104.FireModes.Explosive ~= true then 27 else 26
                else
                    u159.FText.Text = "Explosive"
                    u104.Mode = "Explosive"
                    dispatch = 48
                end
            elseif dispatch < 33 then
                if dispatch < 31 then
                    u159.FText.Text = "Semi"
                    u104.Mode = "Semi"
                    dispatch = 48
                else
                    dispatch = if dispatch < 32 then
                        if u104.Mode ~= "Auto" then 36 else 32
                    else
                        if u104.FireModes.Semi ~= false then 36 else 33
                end
            elseif dispatch < 34 then
                dispatch = if u104.FireModes.Burst ~= true then 36 else 34
            elseif dispatch < 35 then
                dispatch = if u104.FireModes.Explosive ~= false then 36 else 35
            else
                u159.FText.Text = "Burst"
                u104.Mode = "Burst"
                dispatch = 48
            end
        elseif dispatch < 42 then
            if not (dispatch < 39) then
                dispatch = if dispatch < 40 then
                    if u104.Mode ~= "Explosive" then 43 else 40
                else
                    if dispatch < 41 then
                        if u104.FireModes.Semi ~= false then 43 else 41
                    else
                        if u104.FireModes.Burst ~= true then 43 else 42
            elseif dispatch < 37 then
                dispatch = if u104.Mode ~= "Explosive" then 39 else 37
            elseif dispatch < 38 then
                dispatch = if u104.FireModes.Semi ~= true then 39 else 38
            else
                u159.FText.Text = "Semi"
                u104.Mode = "Semi"
                dispatch = 48
            end
        elseif dispatch < 45 then
            if dispatch < 43 then
                u159.FText.Text = "Burst"
                u104.Mode = "Burst"
                dispatch = 48
            else
                dispatch = if dispatch < 44 then
                    if u104.Mode ~= "Explosive" then 48 else 44
                else
                    if u104.FireModes.Semi ~= false then 48 else 45
            end
        elseif dispatch < 47 then
            dispatch = if dispatch < 46 then
                if u104.FireModes.Burst ~= false then 48 else 46
            else
                if u104.FireModes.Auto ~= true then 48 else 47
        else
            if not (dispatch < 48) then
                Update_Gui()
                return
            end

            u159.FText.Text = "Auto"
            u104.Mode = "Auto"
            dispatch = 48
        end
    end
end

local u1049 = false

Mouse_2.KeyDown:connect(function(a1)
    -- Line: 2700
    -- upvalues: u124 (ref), u104 (ref), u187 (ref), u18 (ref), u184 (ref), u161 (ref), u275 (val), StatusUI (ref)
    -- upvalues: u155 (ref), u186 (ref), u185 (ref), LocalPlayer (val), u170 (ref), u166 (ref), u167 (ref)
    -- upvalues: Eventos (val), u105 (ref), Config (val), u192 (ref), u193 (ref), u17 (ref), u195 (ref), u196 (ref)
    -- upvalues: u197 (ref), u194 (ref), u191 (ref), u190 (ref), u189 (ref), u188 (ref), u1049 (ref)
    -- upvalues: LocalPlayer_2 (val)
    if a1 == "v" and u124 and u104.FireModes.ChangeFiremode then
        FireMode()
    end

    if a1 == "t" and u124 then
        if not u187 or u18.AimPart:FindFirstChild("NVAim") == nil then
            if not u184 then
                if u161 == 1 then
                    u161 = 2

                    if not u104.FocusOnSight2 or not u184 then
                        u275:Create(
                            StatusUI.Efeitos.Aim,
                            TweenInfo.new(0.3),
                            {ImageTransparency = 1}
                        ):Play()
                    else
                        u275:Create(
                            StatusUI.Efeitos.Aim,
                            TweenInfo.new(0.75),
                            {ImageTransparency = 0}
                        ):Play()
                    end

                    if u104.ZoomAnim then
                        ZoomAnim()
                        Sprint()
                    end
                elseif u161 == 2 then
                    u161 = 1

                    if not u104.FocusOnSight or not u184 then
                        u275:Create(
                            StatusUI.Efeitos.Aim,
                            TweenInfo.new(0.3),
                            {ImageTransparency = 1}
                        ):Play()
                    else
                        u275:Create(
                            StatusUI.Efeitos.Aim,
                            TweenInfo.new(0.75),
                            {ImageTransparency = 0}
                        ):Play()
                    end

                    if u104.ZoomAnim then
                        UnZoomAnim()
                        Sprint()
                    end
                end
            else
                if u18:FindFirstChild("AimPart2") == nil then end

                if u161 == 1 then
                    u161 = 2
                    tweenFoV(u104.ChangeFOV[2], 120)

                    if not u104.FocusOnSight2 or not u184 then
                        u275:Create(
                            StatusUI.Efeitos.Aim,
                            TweenInfo.new(0.3),
                            {ImageTransparency = 1}
                        ):Play()
                    else
                        u275:Create(
                            StatusUI.Efeitos.Aim,
                            TweenInfo.new(0.75),
                            {ImageTransparency = 0}
                        ):Play()
                    end

                    if u104.ZoomAnim then
                        ZoomAnim()
                        Sprint()
                    end
                elseif u161 == 2 then
                    u161 = 1
                    tweenFoV(u104.ChangeFOV[1], 120)

                    if not u104.FocusOnSight or not u184 then
                        u275:Create(
                            StatusUI.Efeitos.Aim,
                            TweenInfo.new(0.3),
                            {ImageTransparency = 1}
                        ):Play()
                    else
                        u275:Create(
                            StatusUI.Efeitos.Aim,
                            TweenInfo.new(0.75),
                            {ImageTransparency = 0}
                        ):Play()
                    end

                    if u104.ZoomAnim then
                        UnZoomAnim()
                        Sprint()
                    end
                end
            end
        end
    end

    if a1 == "[" and u124 then
        local Value = u155.Value

        if u155.MinValue < Value then
            u155.Value = u155.Value - 50
            u18.Handle.Click:play()
            Update_Gui()
        end
    end

    if a1 == "]" and u124 and u155.Value < u155.MaxValue then
        u155.Value = u155.Value + 50
        u18.Handle.Click:play()
        Update_Gui()
    end

    if a1 == "r" and u124 and u186 > -2 then
        Reload()
    end

    if a1 == "f" and u124 and not u185 and u186 > -2 then
        Chamber()
    end

    if a1 == "m"
        and u124
        and u104.CanCheckMag
        and not u185
        and u186 > -2
        and not (LocalPlayer:GetAttribute("Juggernaut") == true) then
        u170 = false
        u166 = false
        u185 = true

        if u167 then
            u167 = false
            u186 = 0

            Eventos.Stance:FireServer(u186, u104, u105)
            IdleAnim()
            Update_Gui()
        end

        CheckAnim()
        Sprint()
        Update_Gui()

        u166 = true
        u185 = false
    end

    if a1 == "h" and u124 and u18:FindFirstChild("LaserPoint") then
        local v1, v2

        if not Config.RealisticLaser or u18.LaserPoint:FindFirstChild("IR") == nil then
            u192 = not u192

            if not u192 then
                v2 = u193
                Eventos.SVLaser:FireServer(Vector3.new(0, 0, 0), 2, nil, u17, v2)
                u195:Destroy()
                u196:Destroy()
                u197:Destroy()
                u194:Destroy()
            else
                v1 = u17
                Eventos.SVLaser:FireServer(Vector3.new(0, 0, 0), 1, u18.LaserPoint.Color, v1)

                u195 = Instance.new("Part")
                u195.Shape = "Ball"
                u195.Size = Vector3.new(0.20000000298023224, 0.20000000298023224, 0.20000000298023224)
                u195.Parent = u18.LaserPoint
                u195.CanCollide = false
                u195.Color = u18.LaserPoint.Color
                u195.Material = Enum.Material.Neon

                if u18.LaserPoint:FindFirstChild("IR") ~= nil then
                    u195.Transparency = 1
                end

                u196 = Instance.new("Attachment")
                u196.Parent = u18.LaserPoint
                u197 = Instance.new("Attachment")
                u197.Parent = u18.LaserPoint
                u194 = Instance.new("Beam")
                u194.Parent = u18.LaserPoint
                u194.Transparency = NumberSequence.new(0)
                u194.LightEmission = 1
                u194.LightInfluence = 0
                u194.Attachment0 = u196
                u194.Attachment1 = u197
                u194.Color = ColorSequence.new(u18.LaserPoint.Color, u193)
                u194.FaceCamera = true
                u194.Width0 = 0.01
                u194.Width1 = 0.01

                if Config.RealisticLaser then
                    u194.Enabled = false
                end
            end
        elseif u192 then
            if not u192 then
                if u192 and not u193 then
                    u192 = not u192

                    if not u192 then
                        v2 = u193
                        Eventos.SVLaser:FireServer(Vector3.new(0, 0, 0), 2, nil, u17, v2)
                        u195:Destroy()
                        u196:Destroy()
                        u197:Destroy()
                        u194:Destroy()
                    else
                        v1 = u17
                        Eventos.SVLaser:FireServer(Vector3.new(0, 0, 0), 1, u18.LaserPoint.Color, v1)

                        u195 = Instance.new("Part")
                        u195.Shape = "Ball"
                        u195.Size = Vector3.new(0.20000000298023224, 0.20000000298023224, 0.20000000298023224)
                        u195.Parent = u18.LaserPoint
                        u195.CanCollide = false
                        u195.Color = u18.LaserPoint.Color
                        u195.Material = Enum.Material.Neon

                        if u18.LaserPoint:FindFirstChild("IR") ~= nil then
                            u195.Transparency = 1
                        end

                        u196 = Instance.new("Attachment")
                        u196.Parent = u18.LaserPoint
                        u197 = Instance.new("Attachment")
                        u197.Parent = u18.LaserPoint
                        u194 = Instance.new("Beam")
                        u194.Parent = u18.LaserPoint
                        u194.Transparency = NumberSequence.new(0)
                        u194.LightEmission = 1
                        u194.LightInfluence = 0
                        u194.Attachment0 = u196
                        u194.Attachment1 = u197
                        u194.Color = ColorSequence.new(u18.LaserPoint.Color, u193)
                        u194.FaceCamera = true
                        u194.Width0 = 0.01
                        u194.Width1 = 0.01

                        if Config.RealisticLaser then
                            u194.Enabled = false
                        end
                    end
                end
            elseif u193 then
                u193 = not u193
            elseif u192 and not u193 then
                u192 = not u192

                if not u192 then
                    v2 = u193
                    Eventos.SVLaser:FireServer(Vector3.new(0, 0, 0), 2, nil, u17, v2)
                    u195:Destroy()
                    u196:Destroy()
                    u197:Destroy()
                    u194:Destroy()
                else
                    v1 = u17
                    Eventos.SVLaser:FireServer(Vector3.new(0, 0, 0), 1, u18.LaserPoint.Color, v1)

                    u195 = Instance.new("Part")
                    u195.Shape = "Ball"
                    u195.Size = Vector3.new(0.20000000298023224, 0.20000000298023224, 0.20000000298023224)
                    u195.Parent = u18.LaserPoint
                    u195.CanCollide = false
                    u195.Color = u18.LaserPoint.Color
                    u195.Material = Enum.Material.Neon

                    if u18.LaserPoint:FindFirstChild("IR") ~= nil then
                        u195.Transparency = 1
                    end

                    u196 = Instance.new("Attachment")
                    u196.Parent = u18.LaserPoint
                    u197 = Instance.new("Attachment")
                    u197.Parent = u18.LaserPoint
                    u194 = Instance.new("Beam")
                    u194.Parent = u18.LaserPoint
                    u194.Transparency = NumberSequence.new(0)
                    u194.LightEmission = 1
                    u194.LightInfluence = 0
                    u194.Attachment0 = u196
                    u194.Attachment1 = u197
                    u194.Color = ColorSequence.new(u18.LaserPoint.Color, u193)
                    u194.FaceCamera = true
                    u194.Width0 = 0.01
                    u194.Width1 = 0.01

                    if Config.RealisticLaser then
                        u194.Enabled = false
                    end
                end
            end
        elseif not u193 then
            u192 = not u192
            u193 = not u193

            if not u192 then
                v2 = u193
                Eventos.SVLaser:FireServer(Vector3.new(0, 0, 0), 2, nil, u17, v2)
                u195:Destroy()
                u196:Destroy()
                u197:Destroy()
                u194:Destroy()
            else
                v1 = u17
                Eventos.SVLaser:FireServer(Vector3.new(0, 0, 0), 1, u18.LaserPoint.Color, v1)

                u195 = Instance.new("Part")
                u195.Shape = "Ball"
                u195.Size = Vector3.new(0.20000000298023224, 0.20000000298023224, 0.20000000298023224)
                u195.Parent = u18.LaserPoint
                u195.CanCollide = false
                u195.Color = u18.LaserPoint.Color
                u195.Material = Enum.Material.Neon

                if u18.LaserPoint:FindFirstChild("IR") ~= nil then
                    u195.Transparency = 1
                end

                u196 = Instance.new("Attachment")
                u196.Parent = u18.LaserPoint
                u197 = Instance.new("Attachment")
                u197.Parent = u18.LaserPoint
                u194 = Instance.new("Beam")
                u194.Parent = u18.LaserPoint
                u194.Transparency = NumberSequence.new(0)
                u194.LightEmission = 1
                u194.LightInfluence = 0
                u194.Attachment0 = u196
                u194.Attachment1 = u197
                u194.Color = ColorSequence.new(u18.LaserPoint.Color, u193)
                u194.FaceCamera = true
                u194.Width0 = 0.01
                u194.Width1 = 0.01

                if Config.RealisticLaser then
                    u194.Enabled = false
                end
            end
        elseif not u192 then
            if u192 and not u193 then
                u192 = not u192

                if not u192 then
                    v2 = u193
                    Eventos.SVLaser:FireServer(Vector3.new(0, 0, 0), 2, nil, u17, v2)
                    u195:Destroy()
                    u196:Destroy()
                    u197:Destroy()
                    u194:Destroy()
                else
                    v1 = u17
                    Eventos.SVLaser:FireServer(Vector3.new(0, 0, 0), 1, u18.LaserPoint.Color, v1)

                    u195 = Instance.new("Part")
                    u195.Shape = "Ball"
                    u195.Size = Vector3.new(0.20000000298023224, 0.20000000298023224, 0.20000000298023224)
                    u195.Parent = u18.LaserPoint
                    u195.CanCollide = false
                    u195.Color = u18.LaserPoint.Color
                    u195.Material = Enum.Material.Neon

                    if u18.LaserPoint:FindFirstChild("IR") ~= nil then
                        u195.Transparency = 1
                    end

                    u196 = Instance.new("Attachment")
                    u196.Parent = u18.LaserPoint
                    u197 = Instance.new("Attachment")
                    u197.Parent = u18.LaserPoint
                    u194 = Instance.new("Beam")
                    u194.Parent = u18.LaserPoint
                    u194.Transparency = NumberSequence.new(0)
                    u194.LightEmission = 1
                    u194.LightInfluence = 0
                    u194.Attachment0 = u196
                    u194.Attachment1 = u197
                    u194.Color = ColorSequence.new(u18.LaserPoint.Color, u193)
                    u194.FaceCamera = true
                    u194.Width0 = 0.01
                    u194.Width1 = 0.01

                    if Config.RealisticLaser then
                        u194.Enabled = false
                    end
                end
            end
        elseif u193 then
            u193 = not u193
        elseif u192 and not u193 then
            u192 = not u192

            if not u192 then
                v2 = u193
                Eventos.SVLaser:FireServer(Vector3.new(0, 0, 0), 2, nil, u17, v2)
                u195:Destroy()
                u196:Destroy()
                u197:Destroy()
                u194:Destroy()
            else
                v1 = u17
                Eventos.SVLaser:FireServer(Vector3.new(0, 0, 0), 1, u18.LaserPoint.Color, v1)

                u195 = Instance.new("Part")
                u195.Shape = "Ball"
                u195.Size = Vector3.new(0.20000000298023224, 0.20000000298023224, 0.20000000298023224)
                u195.Parent = u18.LaserPoint
                u195.CanCollide = false
                u195.Color = u18.LaserPoint.Color
                u195.Material = Enum.Material.Neon

                if u18.LaserPoint:FindFirstChild("IR") ~= nil then
                    u195.Transparency = 1
                end

                u196 = Instance.new("Attachment")
                u196.Parent = u18.LaserPoint
                u197 = Instance.new("Attachment")
                u197.Parent = u18.LaserPoint
                u194 = Instance.new("Beam")
                u194.Parent = u18.LaserPoint
                u194.Transparency = NumberSequence.new(0)
                u194.LightEmission = 1
                u194.LightInfluence = 0
                u194.Attachment0 = u196
                u194.Attachment1 = u197
                u194.Color = ColorSequence.new(u18.LaserPoint.Color, u193)
                u194.FaceCamera = true
                u194.Width0 = 0.01
                u194.Width1 = 0.01

                if Config.RealisticLaser then
                    u194.Enabled = false
                end
            end
        end

        u18.Handle.Click:play()
    end

    if a1 == "j" and u124 and u18:FindFirstChild("FlashPoint") then
        u191 = not u191
        u18.Handle.Click:play()

        if not u191 then
            Eventos.SVFlash:FireServer(false, u17, nil, nil, nil, nil)

            u18.FlashPoint.Light.Enabled = false
        else
            Eventos.SVFlash:FireServer(true, u17, u18.FlashPoint.Light.Angle, u18.FlashPoint.Light.Brightness, u18.FlashPoint.Light.Color, u18.FlashPoint.Light.Range)

            u18.FlashPoint.Light.Enabled = true
        end
    end

    if a1 == "u" and u124 and u18:FindFirstChild("Silenciador") then
        local v3
        u190.Value = not u190.Value

        u18.Handle.Click:play()

        if u190.Value ~= true then
            u18.Silenciador.Transparency = 1
            u18.SmokePart.FlashFX.Brightness = 5
            v3 = u18.SmokePart:FindFirstChild("FlashFX[Flash]")
            v3.Rate = 1000
        else
            u18.Silenciador.Transparency = 0
            u18.SmokePart.FlashFX.Brightness = 0
            v3 = u18.SmokePart:FindFirstChild("FlashFX[Flash]")
            v3.Rate = 0
        end

        Eventos.SilencerEquip:FireServer(u17, u190.Value)
    end

    if a1 == "b" and u124 and u189 and u18:FindFirstChild("BipodPoint") then
        u188 = not u188

        if u188 ~= true then
            if u18.BipodPoint:FindFirstChild("BipodRetract") ~= nil then
                u18.BipodPoint.BipodRetract:play()
            end
        elseif u18.BipodPoint:FindFirstChild("BipodDeploy") ~= nil then
            u18.BipodPoint.BipodDeploy:play()
        end
    end

    if a1 == "n" and u1049 == false and LocalPlayer_2.Character then
        local Helmet = LocalPlayer_2.Character:FindFirstChild("Helmet")

        if Helmet and Helmet:FindFirstChild("Up") then
            u1049 = true
            delay(
                0.8,
                function()
                    -- Line: 3031
                    -- upvalues: u187 (upval), u184 (upval), u18 (upval), u275 (upval), StatusUI (upval), u161 (upval)
                    -- upvalues: u104 (upval), u1049 (upval)
                    u187 = not u187

                    if u184 and u18.AimPart:FindFirstChild("NVAim") ~= nil then
                        if u187 then
                            tweenFoV(70, 120)

                            u275:Create(
                                StatusUI.Efeitos.Aim,
                                TweenInfo.new(0.3),
                                {ImageTransparency = 1}
                            ):Play()
                        elseif u161 == 1 then
                            tweenFoV(u104.ChangeFOV[1], 120)

                            if not u104.FocusOnSight then
                                u275:Create(
                                    StatusUI.Efeitos.Aim,
                                    TweenInfo.new(0.3),
                                    {ImageTransparency = 1}
                                ):Play()
                            else
                                u275:Create(
                                    StatusUI.Efeitos.Aim,
                                    TweenInfo.new(0.75),
                                    {ImageTransparency = 0}
                                ):Play()
                            end
                        elseif u161 == 2 then
                            tweenFoV(u104.ChangeFOV[2], 120)

                            if not u104.FocusOnSight2 then
                                u275:Create(
                                    StatusUI.Efeitos.Aim,
                                    TweenInfo.new(0.3),
                                    {ImageTransparency = 1}
                                ):Play()
                            else
                                u275:Create(
                                    StatusUI.Efeitos.Aim,
                                    TweenInfo.new(0.75),
                                    {ImageTransparency = 0}
                                ):Play()
                            end
                        end
                    end

                    u1049 = false
                end
            )
        end
    end
end)

function IdleAnim(a1)
    -- Line: 3069
    -- upvalues: u105 (ref), Character_2 (val), u212 (ref), u201 (ref), u202 (ref), u211 (ref), u18 (ref), u199 (ref)
    -- upvalues: u200 (ref)
    u105.IdleAnim(
        Character_2,
        nil,
        {u212, u201, u202, u211.GripW, u18, u199, u200}
    )
end

function StanceDown(a1)
    -- Line: 3081
    -- upvalues: u105 (ref), Character_2 (val), u212 (ref), u201 (ref), u202 (ref), u211 (ref), u18 (ref), u199 (ref)
    -- upvalues: u200 (ref)
    u105.StanceDown(
        Character_2,
        nil,
        {u212, u201, u202, u211.GripW, u18, u199, u200}
    )
end

function StanceUp(a1)
    -- Line: 3093
    -- upvalues: u105 (ref), Character_2 (val), u212 (ref), u201 (ref), u202 (ref), u211 (ref), u18 (ref), u199 (ref)
    -- upvalues: u200 (ref)
    u105.StanceUp(
        Character_2,
        nil,
        {u212, u201, u202, u211.GripW, u18, u199, u200}
    )
end

function Patrol(a1)
    -- Line: 3105
    -- upvalues: u105 (ref), Character_2 (val), u212 (ref), u201 (ref), u202 (ref), u211 (ref), u18 (ref), u199 (ref)
    -- upvalues: u200 (ref)
    u105.Patrol(
        Character_2,
        nil,
        {u212, u201, u202, u211.GripW, u18, u199, u200}
    )
end

function SprintAnim(a1)
    -- Line: 3117
    -- upvalues: u105 (ref), Character_2 (val), u212 (ref), u201 (ref), u202 (ref), u211 (ref), u18 (ref), u199 (ref)
    -- upvalues: u200 (ref)
    u105.SprintAnim(
        Character_2,
        nil,
        {u212, u201, u202, u211.GripW, u18, u199, u200}
    )
end

function EquipAnim(a1)
    -- Line: 3129
    -- upvalues: u168 (ref), u166 (ref), u185 (ref), u105 (ref), Character_2 (val), u212 (ref), u201 (ref), u202 (ref)
    -- upvalues: u211 (ref), u18 (ref), u199 (ref), u200 (ref)
    u168 = true
    u166 = false
    u185 = true

    u105.EquipAnim(
        Character_2,
        nil,
        {u212, u201, u202, u211.GripW, u18, u199, u200}
    )

    u185 = false
    u166 = true
    u168 = false
end

function ChamberAnim(a1)
    -- Line: 3147
    -- upvalues: u168 (ref), u105 (ref), Character_2 (val), u212 (ref), u201 (ref), u202 (ref), u211 (ref), u18 (ref)
    -- upvalues: u104 (ref), u200 (ref), u199 (ref), u144 (ref), u150 (ref), u153 (ref), u165 (ref)
    u168 = true
    u105.ChamberAnim(
        Character_2,
        nil,
        {u212, u201, u202, u211.GripW, u18, u104, u200, u199}
    )

    if not (0 < u144.Value) or u150.Value ~= true then
        if 0 < u144.Value and u150.Value == true and u153.Value == false then
            u144.Value = u144.Value - 1
        end
    elseif u153.Value == true then
        u153.Value = false
    elseif 0 < u144.Value and u150.Value == true and u153.Value == false then
        u144.Value = u144.Value - 1
    end

    u165 = false

    if 0 < u144.Value then
        u150.Value = true
    end

    u168 = false
end

function ZoomAnim(a1)
    -- Line: 3171
    -- upvalues: u105 (ref), Character_2 (val), u212 (ref), u201 (ref), u202 (ref), u211 (ref), u18 (ref), u104 (ref)
    -- upvalues: u199 (ref), u200 (ref)
    u105.ZoomAnim(
        Character_2,
        nil,
        {u212, u201, u202, u211.GripW, u18, u104, u199, u200}
    )
end

function UnZoomAnim(a1)
    -- Line: 3184
    -- upvalues: u105 (ref), Character_2 (val), u212 (ref), u201 (ref), u202 (ref), u211 (ref), u18 (ref), u104 (ref)
    -- upvalues: u199 (ref), u200 (ref)
    u105.UnZoomAnim(
        Character_2,
        nil,
        {u212, u201, u202, u211.GripW, u18, u104, u199, u200}
    )
end

function ChamberBKAnim(a1)
    -- Line: 3197
    -- upvalues: u168 (ref), u105 (ref), Character_2 (val), u212 (ref), u201 (ref), u202 (ref), u211 (ref), u18 (ref)
    -- upvalues: u104 (ref), u199 (ref), u200 (ref), u165 (ref), u144 (ref), u150 (ref)
    u168 = true
    u105.ChamberBKAnim(
        Character_2,
        nil,
        {u212, u201, u202, u211.GripW, u18, u104, u199, u200}
    )

    u165 = false

    if 0 < u144.Value then
        u150.Value = true
    end

    u168 = false
end

function CheckAnim(a1)
    -- Line: 3216
    -- upvalues: u168 (ref), u105 (ref), Character_2 (val), u212 (ref), u201 (ref), u202 (ref), u211 (ref), u18 (ref)
    -- upvalues: u145 (ref), u144 (ref), u104 (ref), u150 (ref), u199 (ref), u200 (ref)
    u168 = true
    CheckMagFunction()

    u105.CheckAnim(
        Character_2,
        nil,
        {
            u212,
            u201,
            u202,
            u211.GripW,
            u18,
            u145,
            u144,
            u104,
            u150,
            u199,
            u200,
        }
    )

    u168 = false
end

function ShellInsertAnim(a1)
    -- Line: 3235
    -- upvalues: u168 (ref), u105 (ref), Character_2 (val), u212 (ref), u201 (ref), u202 (ref), u211 (ref), u18 (ref)
    -- upvalues: u145 (ref), u144 (ref), u104 (ref), u150 (ref), u199 (ref), u200 (ref), Eventos (val), u17 (ref)
    u168 = true
    u105.ShellInsertAnim(
        Character_2,
        nil,
        {
            u212,
            u201,
            u202,
            u211.GripW,
            u18,
            u145,
            u144,
            u104,
            u150,
            u199,
            u200,
        }
    )

    local v1 = u17
    Eventos.Recarregar:FireServer(u145.Value, v1)

    u168 = false
end

function ReloadAnim(a1)
    -- Line: 3254
    -- upvalues: u168 (ref), u105 (ref), Character_2 (val), u212 (ref), u201 (ref), u202 (ref), u211 (ref), u18 (ref)
    -- upvalues: u145 (ref), u144 (ref), u104 (ref), u150 (ref), u199 (ref), u200 (ref), Eventos (val), u17 (ref)
    u168 = true
    u105.ReloadAnim(
        Character_2,
        nil,
        {
            u212,
            u201,
            u202,
            u211.GripW,
            u18,
            u145,
            u144,
            u104,
            u150,
            u199,
            u200,
        }
    )

    local v1 = u17
    Eventos.Recarregar:FireServer(u145.Value, v1)

    u168 = false
end

function GLReloadAnim(a1)
    -- Line: 3273
    -- upvalues: u168 (ref), u105 (ref), Character_2 (val), u212 (ref), u201 (ref), u202 (ref), u211 (ref), u18 (ref)
    -- upvalues: u145 (ref), u144 (ref), u104 (ref), u150 (ref), u199 (ref), u200 (ref), Eventos (val), u17 (ref)
    u168 = true
    u105.GLReloadAnim(
        Character_2,
        nil,
        {
            u212,
            u201,
            u202,
            u211.GripW,
            u18,
            u145,
            u144,
            u104,
            u150,
            u199,
            u200,
        }
    )

    local v1 = u17
    Eventos.Recarregar:FireServer(u145.Value, v1)

    u168 = false
end

local u1096 = u102:FindFirstChild("Doors")
local u1097 = nil

function getNearest() -- Line: 3301; upvalues: LocalPlayer_2 (val), u1096 (val)
    local magnitude
    local v1 = nil
    local v2 = 5
    local Character = LocalPlayer_2.Character or LocalPlayer_2.CharacterAdded:Wait()

    for k, v in pairs(u1096:GetChildren()) do
        if v.Door:FindFirstChild("Knob") ~= nil then
            magnitude = (v.Door.Knob.Position - Character.Torso.Position).magnitude

            if magnitude < v2 then
                v1 = v
                v2 = magnitude
            end
        end
    end

    return v1
end

function Interact(a1, a2, a3) -- Line: 3320; upvalues: LocalPlayer_2 (val), u1097 (ref), Eventos (val)
    if a2 ~= Enum.UserInputState.Begin then
        return
    end

    local v1 = getNearest()
    local Character = LocalPlayer_2.Character or LocalPlayer_2.CharacterAdded:Wait()

    if v1 == nil then
        return
    end

    if (v1.Door.Knob.Position - Character.Torso.Position).magnitude <= 5
        and v1 ~= nil then
        u1097 = if not v1:FindFirstChild("RequiresKey") then nil else v1.RequiresKey.Value
        Eventos.DoorEvent:FireServer(v1, 1, u1097)
    end
end

function GetNearest(a1, a2, a3) -- Line: 3341
    local magnitude
    local v1 = nil
    local v2 = a2

    for i, v in ipairs(a1) do
        magnitude = (a3.Position - v.Position).magnitude

        if magnitude < v2 then
            v1 = v
            v2 = magnitude
        end
    end

    return v1
end

v1:BindAction("Interact", Interact, false, Enum.KeyCode.G)

Eventos.Rappel.PlaceEvent.OnClientEvent:Connect(function(a1)
    -- Line: 3356
    -- upvalues: Character_2 (val), CurrentCamera (val)
    local AlignOrientation = Instance.new("AlignOrientation")
    AlignOrientation.Parent = a1
    AlignOrientation.PrimaryAxisOnly = true
    AlignOrientation.RigidityEnabled = true
    AlignOrientation.Attachment0 = Character_2.HumanoidRootPart.RootAttachment
    AlignOrientation.Attachment1 = CurrentCamera.BasePart.Attachment
end)

if UserInputService.TouchEnabled then
    local v13 = require(Modulos.Mobile)
    v13.Tap(v13.AddButton(LocalPlayer_2, "Aim", "Aim", UDim2.new(0, 100, 0.5, -50), UDim2.new(0, 50, 0, 50)), OnMB2Down)

    v13.Tap(
        v13.AddButton(LocalPlayer_2, "Reload", "Reload", UDim2.new(1, -50, 0.5, -50), UDim2.new(0, 50, 0, 50)),
        function() -- Line: 3387; upvalues: u124 (ref), u186 (ref)
            if u124 and u186 > -2 then
                Reload()
            end
        end
    )

    v13.Tap(
        v13.AddButton(LocalPlayer_2, "Chamber", "Bolt", UDim2.new(1, -100, 0.5, -50), UDim2.new(0, 50, 0, 50)),
        function() -- Line: 3396; upvalues: u124 (ref), u185 (ref), u186 (ref)
            if u124 and not u185 and u186 > -2 then
                Chamber()
            end
        end
    )

    v13.Tap(
        v13.AddButton(LocalPlayer_2, "FireMode", "Mode", UDim2.new(1, -150, 0.5, -50), UDim2.new(0, 50, 0, 50)),
        function() -- Line: 3405; upvalues: u124 (ref), u104 (ref)
            if u124 and u104.FireModes.ChangeFiremode then
                FireMode()
            end
        end
    )

    v13.Input(
        v13.AddButton(LocalPlayer_2, "Shoot", "Shoot", UDim2.new(1, -100, 0.5, 25), UDim2.new(0, 80, 0, 80)),
        Shoot,
        function() -- Line: 3414; upvalues: u124 (ref), u170 (ref)
            if u124 then
                u170 = false
            end
        end
    )
end

print("ACS 1.7.6")
