# Based on code from github.com/RamblingCookieMonster
# Get public and private function definition files
$Public = @( Get-ChildItem -Path $PSScriptRoot\Public\*.ps1 -ErrorAction SilentlyContinue )
$Private = @( Get-ChildItem -Path $PSScriptRoot\Private\*.ps1 -ErrorAction SilentlyContinue )

# Dot source the files
foreach( $File in @($Public + $Private) ) {
    try {
        . $File.FullName
    } catch {
        Write-Error -Message "Failed to import function $($File.FullName): $_"
    }
}

# Export only public function as viewable by users of the module.
Export-ModuleMember -Function $Public.BaseName