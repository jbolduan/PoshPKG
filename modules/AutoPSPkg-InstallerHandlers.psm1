#Requires -Modules 7Zip4PowerShell

<#
	TODO:
		[x] Implement Expand-EXE
		[ ] Implement Get-EXEProductVersion
#>
function Expand-EXE {
	<#
	.SYNOPSIS
		Takes an executible and extracts it.
	.DESCRIPTION
		Used for extracting EXE's that need to be extracted prior to handling their installation or determining version information.
	.EXAMPLE
		Extract-EXE -Name "Firefox" -Path C:\Path\To\Firefox.exe -TempDestination "C:\Windows\Temp"
	.PARAMETER Name
		Is used as the temp folder under the temp destination.
	.PARAMETER Path
	   Path to the executible which needs to be extracted.
	.PARAMETER TempDestination
		Temporary storage folder, by default it it $env:TEMP.
	#>
	
	[CmdletBinding()]
	param (
		[Parameter(Mandatory=$true)]
		[string]$Name,

		[Parameter(Mandatory=$true)]
		[string]$Path,

		[Parameter(Mandatory=$false)]
		[string]$TempDestination=$env:TEMP
	)
	process {
		if(-not (Test-Path -Path $TempDestination)) {
			throw [System.IO.DirectoryNotFoundException]::new("Cannot find directory $TempDestination")
		} else {
			if(-not (Test-Path -Path "$TempDestination\$Name")) {
				New-Item -Path "$TempDestination\$Name" -ItemType Directory
			}

			Expand-7Zip -ArchiveFileName $Path -TargetPath "$TempDestination\$Name"
		}
	}
}

function Get-EXEProductVersion {
	<#
	.SYNOPSIS
		Short description
	.DESCRIPTION
		Long description
	.EXAMPLE
		PS C:\> <example usage>
		Explanation of what the example does
	.INPUTS
		Inputs (if any)
	.OUTPUTS
		Output (if any)
	.NOTES
		General notes
	#>

	[CmdletBinding()]
	param (
		[Parameter(Mandatory=$true)]
		[string]$Path
	)
	
	begin {
	}
	
	process {
	}
	
	end {
	}
}