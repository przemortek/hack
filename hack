local ScreenGui = Instance.new("ScreenGui")
local main = Instance.new("Frame")
local TextLabel = Instance.new("TextLabel")
local TextLabel_2 = Instance.new("TextLabel")
local buttin = Instance.new("TextButton")

--Properties:

ScreenGui.Parent = game.CoreGui

main.Name = "main"
main.Parent = ScreenGui
main.BackgroundColor3 = Color3.fromRGB(199, 199, 214)
main.BorderColor3 = Color3.fromRGB(199, 199, 214)
main.Position = UDim2.new(0.781376541, 0, 0.874791324, 0)
main.Size = UDim2.new(0, 164, 0, 32)
main.Active = true
main.Draggable = true

TextLabel.Parent = main
TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TextLabel.BackgroundTransparency = 1.000
TextLabel.Position = UDim2.new(-0.00456893444, 0, 0.298848748, 0)
TextLabel.Size = UDim2.new(0, 164, 0, 22)
TextLabel.Font = Enum.Font.SciFi
TextLabel.Text = "wallhack"
TextLabel.TextColor3 = Color3.fromRGB(172, 1, 4)
TextLabel.TextSize = 24.000

TextLabel_2.Parent = main
TextLabel_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TextLabel_2.BackgroundTransparency = 1.000
TextLabel_2.Position = UDim2.new(-0.00419670343, 0, -0.000208675861, 0)
TextLabel_2.Size = UDim2.new(0, 101, 0, 11)
TextLabel_2.Font = Enum.Font.SciFi
TextLabel_2.Text = "by przemortek"
TextLabel_2.TextColor3 = Color3.fromRGB(0, 0, 0)
TextLabel_2.TextSize = 14.000

buttin.Name = "buttin"
buttin.Parent = main
buttin.BackgroundColor3 = Color3.fromRGB(138, 138, 153)
buttin.BackgroundTransparency = 1.000
buttin.BorderColor3 = Color3.fromRGB(177, 176, 191)
buttin.BorderSizePixel = 0
buttin.Position = UDim2.new(-0.00419670343, 0, -0.000208675861, 0)
buttin.Size = UDim2.new(0, 155, 0, 33)
buttin.Font = Enum.Font.SourceSansItalic
buttin.LineHeight = 0.730
buttin.Text = ""
buttin.TextColor3 = Color3.fromRGB(0, 0, 0)
buttin.TextSize = 30.000
buttin.TextWrapped = true
buttin.MouseButton1Down:connect(function()
	player = game:GetService("Players").LocalPlayer or owner;
	repeat wait() until  player.Character ~=nil;
	player.Character:WaitForChild("Humanoid");
	game:GetService("Workspace").Camera:ClearAllChildren();


	game:GetService("RunService").RenderStepped:connect(function()
		for k,v in pairs(game:GetService("Workspace").Camera:GetChildren()) do	
			for a,b in pairs(v:GetChildren()) do
				if b.ClassName == "Part" then
					pcall(function()
						b.CFrame = game:GetService("Workspace"):FindFirstChild(v.Name):FindFirstChild(b.Name).CFrame;
					end);
				end;
			end;
		end;
	end);

	coroutine.wrap(function()
		while wait() do
			for k,v in pairs(game:GetService("Workspace"):GetChildren()) do
				if v:FindFirstChild("Humanoid") ~=nil and v ~= player.Character then
					if game:GetService("Workspace").Camera:FindFirstChild(v.Name) ==nil then
						v.Archivable = true;
						local player = v:Clone();
						for k,v in pairs(player:GetChildren()) do
							if v.ClassName == "Part" then
								v.Locked = true;
								v.Anchored = true;
								v.CanCollide = false;
								v.Transparency = 1;
								v.BrickColor = BrickColor.new("Bright red");
								local billboardgui = Instance.new("BillboardGui", v);
								billboardgui.Size = UDim2.new(1,0,1,0);
								billboardgui.AlwaysOnTop = true;
								local frame = Instance.new("Frame", billboardgui);
								frame.BorderSizePixel = 0;
								frame.BackgroundColor3 = Color3.new(255/255,0/255,0/255);
								frame.BackgroundTransparency = .5;
								if v.Name == "Head" then
									frame.Size = UDim2.new(1,0,1,0);
								elseif v.Name == "Torso" then
									frame.Size = UDim2.new(2,0,2,0);
									frame.Position = UDim2.new(-.5,0,-.5,0);
								elseif v.Name == "Left Arm" or v.Name == "Right Arm" or v.Name == "Left Leg" or v.Name == "Right Leg" then
									frame.Size = UDim2.new(1,0,2,0);
									frame.Position = UDim2.new(0,0,-.5,0)	;
								end;
							elseif v.ClassName ~= "Part" then
								v:remove();	
							end	;
						end;
						player.Parent = game:GetService("Workspace").Camera;
						v.Archivable = false;	
					end;
				end	;
			end;

			if player.Character.Humanoid.Health == 0 then
				game:GetService("Workspace").Camera:ClearAllChildren();
				break;
			end;
		end;
	end)();
end)
