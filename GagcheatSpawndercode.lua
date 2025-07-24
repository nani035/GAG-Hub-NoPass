-- 🌱 Grow a Garden GUI by Vincent - No Password, All Pets & Eggs Spawner

-- Create GUI
local gui = Instance.new("ScreenGui", game.CoreGui)
gui.Name = "GAGSpawnerGUI"

local frame = Instance.new("Frame", gui)
frame.Size = UDim2.new(0, 300, 0, 420)
frame.Position = UDim2.new(0.3, 0, 0.3, 0)
frame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)

local layout = Instance.new("UIListLayout", frame)
layout.Padding = UDim.new(0, 5)

-- Lists of all pets and eggs
local pets = {
    "Huge Raptor", "Dragon Fly", "Golden Bee", "Firefly",
    "Blue Butterfly", "Ladybug", "Caterpillar", "Snail"
}

local eggs = {
    "Basic Egg", "Rare Egg", "Legendary Egg",
    "Event Egg", "Nature Egg", "Swamp Egg"
}

-- Spawn Pet
local function spawnPet(petName)
    local remote = game:GetService("ReplicatedStorage"):FindFirstChild("Remotes"):FindFirstChild("SpawnPet")
    if remote then
        remote:FireServer(petName)
    else
        warn("❌ SpawnPet remote not found")
    end
end

-- Spawn Egg
local function spawnEgg(eggName)
    local remote = game:GetService("ReplicatedStorage"):FindFirstChild("Remotes"):FindFirstChild("SpawnEgg")
    if remote then
        remote:FireServer(eggName)
    else
        warn("❌ SpawnEgg remote not found")
    end
end

-- Buttons to spawn each pet
for _, pet in ipairs(pets) do
    local btn = Instance.new("TextButton", frame)
    btn.Size = UDim2.new(1, 0, 0, 30)
    btn.Text = "🐾 Spawn Pet: " .. pet
    btn.BackgroundColor3 = Color3.fromRGB(70, 130, 180)
    btn.TextColor3 = Color3.new(1,1,1)
    btn.MouseButton1Click:Connect(function()
        spawnPet(pet)
    end)
end

-- Buttons to spawn each egg
for _, egg in ipairs(eggs) do
    local btn = Instance.new("TextButton", frame)
    btn.Size = UDim2.new(1, 0, 0, 30)
    btn.Text = "🥚 Spawn Egg: " .. egg
    btn.BackgroundColor3 = Color3.fromRGB(255, 165, 0)
    btn.TextColor3 = Color3.new(1,1,1)
    btn.MouseButton1Click:Connect(function()
        spawnEgg(egg)
    end)
end

-- Button: Spawn All Pets
local allPets = Instance.new("TextButton", frame)
allPets.Size = UDim2.new(1, 0, 0, 35)
allPets.Text = "🚀 Spawn ALL Pets"
allPets.BackgroundColor3 = Color3.fromRGB(0, 180, 100)
allPets.TextColor3 = Color3.new(1,1,1)
allPets.MouseButton1Click:Connect(function()
    for _, pet in ipairs(pets) do
        spawnPet(pet)
        wait(0.1)
    end
end)

-- Button: Spawn All Eggs
local allEggs = Instance.new("TextButton", frame)
allEggs.Size = UDim2.new(1, 0, 0, 35)
allEggs.Text = "🚀 Spawn ALL Eggs"
allEggs.BackgroundColor3 = Color3.fromRGB(200, 120, 20)
allEggs.TextColor3 = Color3.new(1,1,1)
allEggs.MouseButton1Click:Connect(function()
    for _, egg in ipairs(eggs) do
        spawnEgg(egg)
        wait(0.1)
    end
end)
