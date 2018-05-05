function Get-RedirectedUri {
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
		Code from: http://www.powershellmagazine.com/2013/01/31/pstip-retrieve-a-redirected-url-powershell-3-0-way/
	#>

    [CmdletBinding()]
    param (
        [Parameter(Mandatory = $true)]
        [string]$Uri
    )
    process {
		$request = Invoke-WebRequest -Uri $Uri -MaximumRedirection 0 -ErrorAction Ignore
		if($requst.StatusDescription -eq "found") {
			$request.Headers.Location
		}
    }
}