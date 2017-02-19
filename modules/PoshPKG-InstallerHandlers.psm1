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
function Get-RedirectedURL {
	<#
	.SYNOPSIS
		Gets the real download URL from the redirection.
	.DESCRIPTION
		Used to get the real URL for downloading a file, this will not work if downloading the file directly.
	.EXAMPLE
		Get-RedirectedURL -URL "https://download.mozilla.org/?product=firefox-latest&os=win&lang=en-US"
	.PARAMETER URL
		URL for the redirected URL to be un-obfuscated
	.NOTES
		Code from: http://stackoverflow.com/questions/25125818/powershell-invoke-webrequest-how-to-automatically-use-original-file-name
	#>

	[CmdletBinding()]
	param (
		[Parameter(Mandatory=$true)]
		[string]$URL
	)
	process {
		$Request = [System.Net.WebRequest]::Create($URL)
		$Request.AllowAutoRedirect=$false
		$response = $Request.GetResponse()

		if($response.StatusCode -eq "Found") {
			return $response.GetResponseHeader("Location")
		} else {
			throw "Unable to get redirected url."
		}
	}
}