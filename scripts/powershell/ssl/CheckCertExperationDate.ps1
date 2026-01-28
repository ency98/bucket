$urls = @('eastus-gas.guestconfiguration.azure.com', 'agentserviceapi.guestconfiguration.azure.com', 'pas.windows.net', 'gbl.his.arc.azure.com', 'login.microsoftonline.com', 'login.windows.net', 'management.azure.com')

$urls | ForEach-Object {
    $tcpClient = New-Object System.Net.Sockets.TcpClient($_, 443)
    $sslStream = New-Object System.Net.Security.SslStream($tcpClient.GetStream(), $false)

    try {
        $sslStream.AuthenticateAsClient($_)
        $remoteCertificate = [System.Security.Cryptography.X509Certificates.X509Certificate2]$sslStream.RemoteCertificate

        $certObject = if ($remoteCertificate) {
            $expirationDate = $remoteCertificate.GetExpirationDateString()
            $timeRemaining = ([datetime]$expirationDate) - (Get-Date)

            # Display the OG certificate dialog box
            # [System.Security.Cryptography.X509Certificates.X509Certificate2UI]::DisplayCertificate($remoteCertificate)

            [PSCustomObject]@{
                URL = "https://${_}"
                ExpirationDate = $expirationDate
                TimeRemaining = "{0} days, {1} hours, {2} minutes" -f $timeRemaining.Days, $timeRemaining.Hours, $timeRemaining.Minutes
            }
        } else {
            "No certificate presented by https://${_}"
        }

        Write-Output $certObject
    } catch {
        Write-Output "Failed to authenticate or retrieve the certificate from https://${_}: $_"
    } finally {
        $sslStream.Close()
        $tcpClient.Close()
    }
}