# Switch
Switch statements for Roblox
 
You can install this package using [wally](https://wally.run/package/stoozey/switch?version=1.0.0)

## Usage Guide
Switch tries it's berry-best to feel as close as possible to switch statements of other languages, within the limitations of lua:
```lua
local ReplicatedStorage = game:GetService("ReplicatedStorage");

local Packages = ReplicatedStorage:WaitForChild("Packages");
local switch = require(Packages:WaitForChild("switch"));

local foo = 5;
switch(foo)
	:case(1, 2, 3, function()
		print("is 1-3");
	end)
	:case(4, function()
		print("is 4");
	end)
	:case(5, 6, function()
		print("is 5-6");
	end)
	:default(function()
		print("it's definitely something!");
	end)
```