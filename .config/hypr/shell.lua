local function command_exists(command)
    local check

    if package.config:sub(1, 1) == "\\" then
        -- Windows
        check = 'where "' .. command .. '" >nul 2>nul'
    else
        -- Unix-like systems
        check = 'command -v "' .. command .. '" >/dev/null 2>&1'
    end

    return os.execute(check) == true or os.execute(check) == 0
end

return {
    command_exists = command_exists
}