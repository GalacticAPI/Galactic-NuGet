# Copyright 2015, Galactic API Team.
# Licensed under the MIT License.
# Visit https://github.com/GalacticAPI/Galactic-NuGet for details.
#
# Note: This must be run from the Scripts directory in the Galactic-NuGet repository.

# Get all the package files in the main directory.
$packages = get-childitem ..\*.nupkg

# Publish them to the NuGet Servers
foreach ($package in $packages) {
	# Publish the package.
	nuget push "..\$($package)" -NonInteractive
}