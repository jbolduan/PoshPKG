if(-not (Test-Path -Path "$($env:ProgramFiles)\WindowsPowerShell\Modules\PoshPKG")) {
	New-Item -Path "$($env:ProgramFiles)\WindowsPowerShell\Modules" -Name PoshPKG -ItemType Directory -Force
}

Copy-Item -Path .\modules\* -Destination "$($env:ProgramFiles)\WindowsPowerShell\Modules\PoshPKG" -Force -Recurse