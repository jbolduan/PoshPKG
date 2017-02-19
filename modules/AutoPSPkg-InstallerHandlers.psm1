#Requires -Modules 7Zip4PowerShell

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
			throw [System.IO.DirectoryNotFoundException]::new("Directory not found: $TempDestination")
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
		Get's the product version of an EXE
	.DESCRIPTION
		Takes in the path to an EXE and returns the ProductVersion of that EXE
	.EXAMPLE
		Get-EXEProductVersion -Path C:\Temp\Setup.exe
	.PARAMETER Path
        Path to an executible
	#>

	[CmdletBinding()]
	param (
		[Parameter(Mandatory=$true)]
		[string]$Path
	)
	process {
        if(-not (Test-Path -Path $Path)) {
            throw [System.IO.FileNotFoundException]::new("File not found: $Path")
        } else {
            return [System.Version](Get-Item -Path $Path).VersionInfo.ProductVersion
        }
	}
}