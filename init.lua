local switch = require(script:WaitForChild("switch"));

return function(value: any): any
    return switch.new(value);
end
