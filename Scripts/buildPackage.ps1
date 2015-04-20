# Copyright 2015, Galactic API Team.
# Licensed under the MIT License.
# Visit https://github.com/GalacticAPI/Galactic-NuGet for details.
#
# Note: This must be run from the Scripts directory in the Galactic-NuGet repository.

param(
	[Parameter(Mandatory=$True, Position = 1)]
	[string] $packageName,
	[Parameter(Mandatory=$True, Position = 2)]
	[string] $packageVersion
)

# Get the contents of the NuSpec template file associated with this package.
$nuspec = get-content "..\NuSpecTemplates\$($packageName).nuspec"

# Create a version specific NuSpec file by entering the version number of the dlls in the file.
$nuspec -creplace "\[VERSION\]", $packageVersion | out-file "..\$($packageName).$($packageVersion).nuspec"

# Create a new package from the NuSpec file.
nuget pack "..\$($packageName).$($packageVersion).nuspec" -NonInteractive -OutputDirectory ..\

# Delete the NuSpec file used to build the package.
remove-item "..\$($packageName).$($packageVersion).nuspec"
