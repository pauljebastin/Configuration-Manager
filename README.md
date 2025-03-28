# Microsoft Configuration Manager (SCCM) Repository

## Overview

Welcome to the Microsoft Configuration Manager (SCCM) Repository! This repository contains scripts, automation tools, and configurations designed to enhance and streamline Configuration Manager administration and deployment processes.

## Features

* Automated SCCM Deployments – Scripts to simplify application, OS, and update deployments.
* Reporting & Monitoring – PowerShell scripts to generate SCCM reports and monitor client health.
* Configuration Management – Tools to manage collections, compliance settings, and policies.
* Troubleshooting & Maintenance – Automated solutions for log analysis, error handling, and remediation.

## Getting Started

### Prerequisites

Before using these scripts, ensure you have:

* Microsoft Configuration Manager (Current Branch) installed and configured.
* PowerShell 5.1 or later (or PowerShell Core for remote execution).
* Configuration Manager Full Administrator Rights (for executing administrative tasks).
* Required modules: ConfigurationManager, etc.

Setup & Usage

1. Clone the repository: git clone https://github.com/pauljebastin/configuration-manager.git
1. Import the SCCM module in PowerShell: Import-Module ($env:SMS_ADMIN_UI_PATH + '\..\ConfigurationManager.psd1')
1. Change to the ConfigMgr site code: cd XXX:  # Replace XXX with your SCCM site code
1. Execute the script: .\ScriptName.ps1
  Refer to individual script documentation for required parameters.

## Available Scripts

### Deployment Automation
* AppManagement.ps1 – Automates application deployment.
* OSDTaskSequence.ps1 – Manages and deploys Operating System Task Sequences.
* WindowsUpdateDeployment.ps1 – Deploys Windows updates via SCCM.

Reporting & Monitoring
* ClientHealthCheck.ps1 – Checks and repairs SCCM client health.
* SCCMInventoryReport.ps1 – Generates hardware and software inventory reports.
* SoftwareComplianceCheck.ps1 – Audits software compliance across devices.

Troubleshooting & Maintenance
* LogParser.ps1 – Analyzes SCCM log files for errors.
* ReinstallSCCMClient.ps1 – Automates SCCM client reinstallation.
* CleanupOldDeployments.ps1 – Removes stale or failed deployments.

## Contributing

Contributions are welcome! To contribute:

1. Fork this repository.
1. Create a feature branch (git checkout -b feature-name).
1. Commit your changes (git commit -m 'Added new feature').
1. Push to your branch (git push origin feature-name).
1. Submit a pull request.

## Issues & Support

If you encounter issues or have feature requests, please open an issue in the Issues section.

## License

This project is licensed under the MIT License.
