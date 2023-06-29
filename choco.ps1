# Run with elevated permissions
If (-NOT ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator))
{
  # Relaunch as an elevated process:
  Start-Process powershell.exe "-File",('"{0}"' -f $MyInvocation.MyCommand.Path) -Verb RunAs
  exit
}

# Change PS policy
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned

# Install choco
[System.Net.WebRequest]::DefaultWebProxy.Credentials = [System.Net.CredentialCache]::DefaultCredentials; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))

# Global acceptation
choco feature enable -n allowGlobalConfirmation

# Set proxy in choco config (if needed)
choco config set --name="proxy" --value="http://proxy.domain:8080"
choco config set --name="proxyUser" --value="user"
choco config set --name="proxyPassword" --value="password"
choco config set --name="proxyBypassOnLocal " --value="true"

# SSMS
choco install sql-server-management-studio -y

# Copy tool
choco install teracopy -y

# network tool
choco install nmap -y

# 7-zip
choco install 7zip.install -y

# VLC
choco install vlc -y

# Brave
choco install brave -y

# Adblock
choco install adblockpluschrome -y

# Auto-updater choco
choco install chocolateypackageupdater -y

# Sumatra PDF
choco install sumatrapdf.install -y

#Packer
choco install packer

#Vault
choco install vault

#VMware Workstation Player
choco install vmware-workstation-player

#Visual Studio code
choco install vscode

#Terraform
choco install terraform

#Notepad++
choco install notepadplusplus.install

#Keepass 2
choco install keepass
choco install keepass-plugin-keetheme

#adobe
choco install adobereader

#CD burner XP
choco install cdburnerxp

#OBS studio
choco install obs-studio

#Open SCAP
choco install openscap

#WinSCP
choco install winscp

#PuTTY
choco install putty

#kubectl
choco install kubernetes-cli

#Rancher desktop
choco install rancher-desktop

#Glogg (log reader)
choco install glogg

#VMware Octant
choco install octant

#ArgoCD CLI
choco install argocd-cli

# Update all packages
cup all -y
