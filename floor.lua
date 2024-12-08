debounce = false
function onTouched(hit, v)
	local h = hit.Parent:FindFirstChild("Humanoid")
	if h then
		repeat
			v.Transparency = v.Transparency + 0.05
			wait(0.3)
		until v.Transparency >= 1
		v.CanCollide = false
		v.Transparency = 1
		wait(30)
		v.CanCollide = true
		v.Transparency = 0.35
		debounce = false
	end
end

for i,v in pairs(script.Parent:GetChildren()) do
	if v:IsA("BasePart") then
		local despawner = v:Clone()
		despawner.Parent = v
		despawner.Name = "Despawner"
		despawner.Size = Vector3.new(6.8,1,6.8)
		despawner.CFrame = v.CFrame * CFrame.new(0, 0.2, 0)
		despawner.Transparency = 1
		despawner.CanCollide = false
		despawner.Anchored = true
		
		despawner.Touched:Connect(function(hit)
			debounce = true
			onTouched(hit, v)
		end)
		
	end
end
