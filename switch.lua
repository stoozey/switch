local switch = { };
switch.__index = switch;

function switch.new(value: any)
    local self = setmetatable({}, switch);

    self.__value = value;
    self.__resolved = false;

    return self;
end

function switch:case(...: any)
    local args = {...};
    local totalCases = (#args - 1);
    if (totalCases < 1) then return error("Invalid Switch::Case arguments (potentially missing caseFunction)") end;

    local caseFunction = args[totalCases + 1];
    if (type(caseFunction) ~= "function") then return error("Invalid Switch::Case caseFunction is not a function") end;

    for i = 1, totalCases do
        local case = args[i];
        if ((self.__value == case) and (self:__resolve(caseFunction))) then
            break;
        end
    end

    return self;
end

function switch:default(caseFunction: () -> any)
    if (type(caseFunction) ~= "function") then return error("Invalid Switch::Default caseFunction is not a function") end;

    self:__resolve(caseFunction);
    return self;
end

function switch:__resolve(resolve: () -> any)
    if (self.__resolved) then return end;

    local success, result = pcall(resolve);
    if (success) then
        self.__resolved = true;
    else
        error("Switch caseFunction failed: ".. result);
    end

    return success;
end

return switch;