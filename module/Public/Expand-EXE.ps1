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
        [Parameter(Mandatory = $true)]
        [string]$EXEPath,

        [Parameter(Mandatory = $false)]
        [string]$Path = $env:TEMP
    )
    process {
        if (-not (Test-Path -Path "$Path")) {
            New-Item -Path "$Path" -ItemType Directory
        }

        Expand-7Zip -ArchiveFileName $EXEPath -TargetPath "$Path"
    }
}