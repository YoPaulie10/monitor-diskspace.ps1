# monitor-diskspace.ps1
Powershell script to monitor disk space on Windows systems using scheduled task and then push to uptime kuma.

Linux version here that I used to compose this version. https://gist.github.com/Eising/8620880440016b9227bc31abeca8b1ac

It will only work with Powershell 7 for uptime-kuma sites signed with an internal certificate.  -SkipCertificateCheck is required.

Run this as a scheduled task in Windows how ever often you want to monitor diskspace. Set the heartbeat in Uptime Kuma to be same or greater.
"C:\Program Files\PowerShell\7\pwsh.exe" c:\location_of_file\diskspace-monitor.ps1 as an example of the action for the Windows task.
