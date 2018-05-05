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
        [Parameter(Mandatory = $true)]
        [string]$Path
    )
    process {
        if (-not (Test-Path -Path $Path)) {
            throw [System.IO.FileNotFoundException]::new("File not found: $Path")
        }
        else {
            return [System.Version](Get-Item -Path $Path).VersionInfo.ProductVersion
        }
    }
}