for _,v in pairs(game:GetDescendants()) do
	if v.Parent:IsA("Tool") and v.Parent.Name == "Meteorite" and v:IsA("BasePart") then
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.CFrame
	end
end