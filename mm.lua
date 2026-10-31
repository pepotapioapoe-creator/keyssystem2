-- 1. Función para buscar el objetivo más cercano a la pantalla/mouse
local function getTarget()
    local closestDistance = math.huge
    local closest = nil

    for _, player in pairs(game:GetService("Players"):GetPlayers()) do
        if player == LocalPlayer_2 or not player.Character then continue end
        local character = player.Character
        local humanoid = character:FindFirstChild("Humanoid")
        local head = character:FindFirstChild("Head")
        
        if not humanoid or not head or humanoid.Health <= 0 then continue end
        
        local screenPosition, onScreen = CurrentCamera:WorldToViewportPoint(head.Position)
        if not onScreen then continue end
        
        local mousePosition = UserInputService:GetMouseLocation()
        local distance = (Vector2.new(screenPosition.X, screenPosition.Y) - mousePosition).Magnitude
        
        if distance < closestDistance then
            closestDistance = distance
            closest = head
        end
    end
    return closest
end

-- 2. Modificación dentro de la función CreateBullet existente en kamacho.lua:
function CreateBullet(a1)
    local Part = Instance.new("Part")
    Part.Name = LocalPlayer_2.Name .. "_Bullet"
    Part.CanCollide = false
    Part.Transparency = 1
    Part.FormFactor = "Custom"
    Part.Size = Vector3.new(1, 1, 1)
    
    local v1 = Vector3.new(0, Part:GetMass() * 196.2 - u104.BDrop * 196.2, 0)
    local v2_force = Instance.new("BodyForce")
    v2_force.force = v1
    v2_force.Parent = Part
    
    local Position = u18.SmokePart.Position
    
    -- AQUÍ SE INTERCEPTA LA DIRECCIÓN:
    local target = getTarget()
    local v2
    
    if target then
        -- Si encuentra un objetivo en pantalla, calcula el vector hacia su cabeza
        v2 = (target.Position - Position).Unit
    else
        -- Comportamiento por defecto de ACS si no hay objetivo
        v2 = u18.SmokePart.CFrame.lookVector
            + u18.SmokePart.CFrame.upVector
                * (u104.BDrop * u155.Value / 2.8 / u104.BSpeed)
                / 2
    end

    local v3 = CFrame.new(Position, Position + v2)
    
    -- Aplica la dispersión (Spread) original del arma sobre el vector modificado
    v2 = CFrame.Angles(
        rad(RAND(-a1 - u162 / Saude.Stances.Mobility.Value * u104.WalkMultiplier, a1 + u162 / Saude.Stances.Mobility.Value * u104.WalkMultiplier) / 20), 
        rad(RAND(-a1 - u162 / Saude.Stances.Mobility.Value * u104.WalkMultiplier, a1 + u162 / Saude.Stances.Mobility.Value * u104.WalkMultiplier) / 20), 
        rad(RAND(-a1 - u162 / Saude.Stances.Mobility.Value * u104.WalkMultiplier, a1 + u162 / Saude.Stances.Mobility.Value * u104.WalkMultiplier) / 20)
    ) * v2
    
    Part.Parent = u350
    Part.CFrame = v3 + v2
    Part.Velocity = v2 * u104.BSpeed
    
    -- El resto del código de CreateBullet (Tracer, Flare, ReplicatedBullets, etc.) continúa igual...
