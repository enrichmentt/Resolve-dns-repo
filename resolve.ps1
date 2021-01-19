$names = Get-Content .\names.txt
$result = @()

foreach ($name in $names) {
    $resolve = Resolve-DnsName $name

    foreach ($res in $resolve) {
        if($res.Type -eq 'A'){
            $name
            $res

            $result += [PSCustomObject]@{
                Name = $name
                DnsName = $res.Name
                TTL = $res.TTL
                IP = $res.IPAddress
            }
        }
    }
}

$result | Format-Table
