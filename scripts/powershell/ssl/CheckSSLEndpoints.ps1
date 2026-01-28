function CheckSSL($fqdn, $port=443, $tls="tls12")
{
    Try {$tcpsocket = New-Object Net.Sockets.TcpClient($fqdn, $port)} Catch {Write-Warning "$($_.Exception.Message) / $fqdn";break}
    $certCollection = New-Object System.Security.Cryptography.X509Certificates.X509CertificateCollection
    $sslProtocols = [System.Security.Authentication.SslProtocols]::$tls
    ""; "-- Target: $fqdn / " + $tcpsocket.Client.RemoteEndPoint.Address.IPAddressToString
    $sslStream = New-Object System.Net.Security.SslStream($tcpsocket.GetStream(), $false)
    $sslStream.AuthenticateAsClient($fqdn, $certCollection, $sslProtocols, $true)  ## A Boolean value that specifies whether the certificate revocation list is checked during authentication
    $certinfo = New-Object security.cryptography.x509certificates.x509certificate2($sslStream.RemoteCertificate)
    $sslStream | select-object | Format-Table sslProtocol,CipherAlgorithm, HashAlgorithm,KeyExchangeAlgorithm,IsAuthenticated,IsEncrypted,IsSigned, CheckCertRevocationStatus
    $certinfo | Format-Table Issuer, Thumbprint
    #$certinfo.Extensions | where {$_.Oid.FriendlyName -like 'subject alt*'} | foreach { $_.Oid.FriendlyName; $_.Format($true) }
    $tcpsocket.Close()


}

IPConfig /FlushDNS     ### this is not required however it is wise to execute if you are collecting a network trace so that the name is resolved in the network trace

CheckSSL "microsoft.com"
CheckSSL "google.com"
CheckSSL "apple.com"
CheckSSL "facebook.com"