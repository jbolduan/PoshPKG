if(-not (Test-Path -Path "$($env:ProgramFiles)\WindowsPowerShell\Modules\AutoPSPkg")) {
	New-Item -Path "$($env:ProgramFiles)\WindowsPowerShell\Modules" -Name AutoPSPkg -ItemType Directory -Force
}

Copy-Item -Path .\modules\* -Destination "$($env:ProgramFiles)\WindowsPowerShell\Modules\AutoPSPkg" -Force -Recurse