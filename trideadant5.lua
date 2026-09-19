-- TRIDENT_RECON6: que distingue un cuerpo de otro. YA JUGANDO, con otros cerca.
local ign = workspace:FindFirstChild("Const")
ign = ign and ign:FindFirstChild("Ignore")
print("Ignore:", ign and "SI" or "NO")
if not ign then print("FIN RECON6") return end
for _, m in ipairs(ign:GetChildren()) do
    if m:IsA("Model") then
        local np = 0
        for _, d in ipairs(m:GetDescendants()) do
            if d:IsA("BasePart") then np = np + 1 end
        end
        if np >= 6 then
            print("=== BODY:", m.Name, "| partes:", np, "===")
            local okA, at = pcall(function() return m:GetAttributes() end)
            if okA then
                for k, v in pairs(at) do print("  attr:", k, "=", tostring(v)) end
            end
            for _, d in ipairs(m:GetChildren()) do
                if not d:IsA("BasePart") then
                    print("  extra:", d.Name, "|", d.ClassName, "| valor:",
                        (d:IsA("StringValue") or d:IsA("IntValue") or d:IsA("NumberValue") or d:IsA("BoolValue") or d:IsA("ObjectValue")) and tostring(d.Value) or "-")
                end
            end
        end
    end
end
print("FIN RECON6")
