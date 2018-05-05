if (Test-Path -Path "$($env:ProgramFiles)\WindowsPowerShell") {
    if (-not (Test-Path -Path "$($env:ProgramFiles)\WindowsPowerShell\Modules\PoshPKG")) {
        New-Item -Path "$($env:ProgramFiles)\WindowsPowerShell\Modules" -Name PoshPKG -ItemType Directory -Force
    }
}

if (Test-Path -Path "$($env:ProgramFiles)\PowerShell") {
    if (-not (Test-Path -Path "$($env:ProgramFiles)\PowerShell\Modules\PoshPKG")) {
        New-Item -Path "$($env:ProgramFiles)\PowerShell\Modules" -Name PoshPKG -ItemType Directory -Force
    }
}

Copy-Item -Path .\modules\* -Destination "$($env:ProgramFiles)\WindowsPowerShell\Modules\PoshPKG" -Force -Recurse
Copy-Item -Path .\modules\* -Destination "$($env:ProgramFiles)\PowerShell\Modules\PoshPKG" -Force -Recurse