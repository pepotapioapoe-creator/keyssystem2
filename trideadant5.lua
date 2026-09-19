-- TRIDENT_RECON5: contenido de Const/Ignore. YA JUGANDO, cerca de otros.
local Const = workspace:FindFirstChild("Const")
print("Const:", Const and "SI" or "NO")
if Const then
    print("--- hijos de Const ---")
    for _, c in ipairs(Const:GetChildren()) do
        print("c:", c.Name, "|", c.ClassName, "| hijos:", #c:GetChildren())
    end
end
local ign = Const and Const:FindFirstChild("Ignore")
print("Ignore:", ign and ("SI con " .. #ign:GetChildren() .. " hijos") or "NO")
if ign then
    print("--- hijos de Ignore (50) ---")
    local n = 0
    for _, m in ipairs(ign:GetChildren()) do
        n = n + 1
        if n <= 50 then
            local np, names = 0, {}
            if m:IsA("Model") then
                for _, d in ipairs(m:GetDescendants()) do
                    if d:IsA("BasePart") then
                        np = np + 1
                        if #names < 8 then names[#names + 1] = d.Name end
                    end
                end
            end
            print(n .. ".", m.Name, "|", m.ClassName, "| partes:", np, "| ej:", table.concat(names, ","))
        end
    end
end
print("FIN RECON5")
