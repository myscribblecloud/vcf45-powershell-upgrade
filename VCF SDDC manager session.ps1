# Variables adjust to needs
$SDDCM_FQDN = "sddcm01.scribblecloud.lab"
$SDDCM_USERNAME = "username"
$SDDCM_PASSWORD = "password"

# Create a session token on the SDDC manager
$sddcm_auth_uri = "https://{0}/v1/tokens" -f ($SDDCM_FQDN)
$sddcm_auth_headers = @{ 
    "Content-Type" = "Application/json"
}
$sddcm_auth_body = [PSCustomObject]@{
    "username" = "$($SDDCM_USERNAME)"
    "password" = "$($SDDCM_PASSWORD)"
} 
$sddcm_auth_result = Invoke-RestMethod -Uri $sddcm_auth_uri -Method POST -Headers $sddcm_auth_headers -Body $($sddcm_auth_body | ConvertTo-JSON)
$sddcm_auth_token = $($sddcm_auth_result.accessToken)
