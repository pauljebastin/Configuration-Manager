# AppManagement.psm1

function Install-MSIApplication {
    param (
        [Parameter(Mandatory = $true)]
        [string]$MSIPath,
        
        [Parameter(Mandatory = $false)]
        [string]$InstallArguments = "/qn /norestart",
        
        [Parameter(Mandatory = $false)]
        [string]$LogFile = "C:\Temp\Install_Log.txt"
    )

    # Ensure the log directory exists
    $logDirectory = [System.IO.Path]::GetDirectoryName($LogFile)
    if (!(Test-Path -Path $logDirectory)) {
        New-Item -ItemType Directory -Path $logDirectory -Force | Out-Null
    }
    
    # Construct the MSI execution command
    $arguments = "/i `"$MSIPath`" $InstallArguments /L*v `"$LogFile`""
    
    # Run the MSI installation using Start-Process
    Start-Process msiexec.exe -ArgumentList $arguments -Wait -NoNewWindow
    
    # Check if the installation was successful
    if ($?) {
        Write-Host "Installation completed successfully. Log saved to $LogFile" -ForegroundColor Green
    } else {
        Write-Host "Installation failed. Check logs at $LogFile for more details." -ForegroundColor Red
    }
}

function Uninstall-MSIApplication {
    param (
        [Parameter(Mandatory = $true)]
        [string]$ProductCode,
        
        [Parameter(Mandatory = $false)]
        [string]$UninstallArguments = "/qn /norestart",
        
        [Parameter(Mandatory = $false)]
        [string]$LogFile = "C:\Temp\Uninstall_Log.txt"
    )

    # Ensure the log directory exists
    $logDirectory = [System.IO.Path]::GetDirectoryName($LogFile)
    if (!(Test-Path -Path $logDirectory)) {
        New-Item -ItemType Directory -Path $logDirectory -Force | Out-Null
    }
    
    # Construct the MSI uninstall command
    $arguments = "/x `"$ProductCode`" $UninstallArguments /L*v `"$LogFile`""
    
    # Run the MSI uninstallation using Start-Process
    Start-Process msiexec.exe -ArgumentList $arguments -Wait -NoNewWindow
    
    # Check if the uninstallation was successful
    if ($?) {
        Write-Host "Uninstallation completed successfully. Log saved to $LogFile" -ForegroundColor Green
    } else {
        Write-Host "Uninstallation failed. Check logs at $LogFile for more details." -ForegroundColor Red
    }
}

function Install-EXEApplication {
    param (
        [Parameter(Mandatory = $true)]
        [string]$EXEPath,
        
        [Parameter(Mandatory = $false)]
        [string]$InstallArguments = "/silent /norestart",
        
        [Parameter(Mandatory = $false)]
        [string]$LogFile = "C:\Temp\EXE_Install_Log.txt"
    )

    # Ensure the log directory exists
    $logDirectory = [System.IO.Path]::GetDirectoryName($LogFile)
    if (!(Test-Path -Path $logDirectory)) {
        New-Item -ItemType Directory -Path $logDirectory -Force | Out-Null
    }
    
    # Construct the EXE execution command
    $arguments = "$InstallArguments /log `"$LogFile`""
    
    # Run the EXE installation using Start-Process
    Start-Process -FilePath $EXEPath -ArgumentList $arguments -Wait -NoNewWindow
    
    # Check if the installation was successful
    if ($?) {
        Write-Host "EXE Installation completed successfully. Log saved to $LogFile" -ForegroundColor Green
    } else {
        Write-Host "EXE Installation failed. Check logs at $LogFile for more details." -ForegroundColor Red
    }
}

function Uninstall-EXEApplication {
    param (
        [Parameter(Mandatory = $true)]
        [string]$EXEPath,
        
        [Parameter(Mandatory = $false)]
        [string]$UninstallArguments = "/silent /norestart",
        
        [Parameter(Mandatory = $false)]
        [string]$LogFile = "C:\Temp\EXE_Uninstall_Log.txt"
    )

    # Ensure the log directory exists
    $logDirectory = [System.IO.Path]::GetDirectoryName($LogFile)
    if (!(Test-Path -Path $logDirectory)) {
        New-Item -ItemType Directory -Path $logDirectory -Force | Out-Null
    }
    
    # Construct the EXE uninstall command
    $arguments = "$UninstallArguments /log `"$LogFile`""
    
    # Run the EXE uninstallation using Start-Process
    Start-Process -FilePath $EXEPath -ArgumentList $arguments -Wait -NoNewWindow
    
    # Check if the uninstallation was successful
    if ($?) {
        Write-Host "EXE Uninstallation completed successfully. Log saved to $LogFile" -ForegroundColor Green
    } else {
        Write-Host "EXE Uninstallation failed. Check logs at $LogFile for more details." -ForegroundColor Red
    }
}

function Install-AppXPackage {
    param (
        [Parameter(Mandatory = $true)]
        [string]$AppXPackagePath,
        
        [Parameter(Mandatory = $false)]
        [string]$LogFile = "C:\Temp\AppX_Install_Log.txt"
    )

    # Ensure the log directory exists
    $logDirectory = [System.IO.Path]::GetDirectoryName($LogFile)
    if (!(Test-Path -Path $logDirectory)) {
        New-Item -ItemType Directory -Path $logDirectory -Force | Out-Null
    }
    
    # Run the AppX installation using Add-AppxPackage
    Add-AppxPackage -Path $AppXPackagePath -LogLevel Detailed -ForceApplicationShutdown -ErrorAction Stop
    
    # Check if the installation was successful
    if ($?) {
        Write-Host "AppX Installation completed successfully. Log saved to $LogFile" -ForegroundColor Green
    } else {
        Write-Host "AppX Installation failed. Check logs at $LogFile for more details." -ForegroundColor Red
    }
}

function Uninstall-AppXPackage {
    param (
        [Parameter(Mandatory = $true)]
        [string]$PackageFullName,
        
        [Parameter(Mandatory = $false)]
        [string]$LogFile = "C:\Temp\AppX_Uninstall_Log.txt"
    )

    # Ensure the log directory exists
    $logDirectory = [System.IO.Path]::GetDirectoryName($LogFile)
    if (!(Test-Path -Path $logDirectory)) {
        New-Item -ItemType Directory -Path $logDirectory -Force | Out-Null
    }
    
    # Run the AppX uninstallation using Remove-AppxPackage
    Remove-AppxPackage -Package $PackageFullName
    
    # Check if the uninstallation was successful
    if ($?) {
        Write-Host "AppX Uninstallation completed successfully. Log saved to $LogFile" -ForegroundColor Green
    } else {
        Write-Host "AppX Uninstallation failed. Check logs at $LogFile for more details." -ForegroundColor Red
    }
}
