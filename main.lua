local player = game.Players.LocalPlayer
local intervalo = 5
local dineroCadaVez = 250
local nombresMascotas = {"Dog", "Cat", "Dragon", "Fox", "Unicorn"}

local carpeta = workspace:FindFirstChild("MascotasGeneradas") or Instance.new("Folder", workspace)
carpeta.Name = "MascotasGeneradas"

local function genPet()
    local p = Instance.new("Part")
    p.Name = nombresMascotas[math.random(#nombresMascotas)]
    p.Size = Vector3.new(2,2,2)
    p.Position = player.Character.HumanoidRootPart.Position + Vector3.new(math.random(-5,5),2,math.random(-5,5))
    p.BrickColor = BrickColor.Random()
    p.Shape = Enum.PartType.Ball
    p.Anchored = false
    p.Parent = carpeta
end

local function giveMoney()
    local stats = player:FindFirstChild("leaderstats")
    if not stats then return end
    local cash = stats:FindFirstChild("Money") or stats:FindFirstChild("Cash")
    if cash then cash.Value = cash.Value + dineroCadaVez end
end

while true do
    task.wait(intervalo)
    spawn(genPet)
    spawn(giveMoney)
end
