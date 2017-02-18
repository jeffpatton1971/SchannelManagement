# SchannelManagement
A collection of modules and functions for working with SCHANNEL, protocols, ciphers, hashes, key exchanges...

# Functions
```
CommandType     Name                                               Version    Source
-----------     ----                                               -------    ------
Function        Disable-Cipher                                     1.0        SchannelManagement
Function        Enable-Cipher                                      1.0        SchannelManagement
Function        Get-Cipher                                         1.0        SchannelManagement
Function        New-Cipher                                         1.0        SchannelManagement
Function        Remove-Cipher                                      1.0        SchannelManagement
Function        Test-Cipher                                        1.0        SchannelManagement
Function        Disable-Hash                                       1.0        SchannelManagement
Function        Enable-Hash                                        1.0        SchannelManagement
Function        Get-Hash                                           1.0        SchannelManagement
Function        New-Hash                                           1.0        SchannelManagement
Function        Remove-Hash                                        1.0        SchannelManagement
Function        Test-Hash                                          1.0        SchannelManagement
Function        Disable-Protocol                                   1.0        SchannelManagement
Function        Enable-Protocol                                    1.0        SchannelManagement
Function        Get-Protocol                                       1.0        SchannelManagement
Function        New-Protocol                                       1.0        SchannelManagement
Function        Remove-Protocol                                    1.0        SchannelManagement
Function        Test-Protocol                                      1.0        SchannelManagement
```
# Function Help
###### Disable-Cipher
```
NAME
    Disable-Cipher

SYNTAX
    Disable-Cipher [-Cipher] {NULL | Triple DES 168/168 | RC2 128/128 | AES 256/256 | RC2 56/128 | RC2 40/128 | RC4 40/128 | RC4 56/128 | RC4 64/128 | AES 128/128 | RC4 128/128 | DES 56/56} [[-ComputerName]
    <string>]  [<CommonParameters>]


ALIASES
    None


REMARKS
    None

```
###### Disable-Hash
```
NAME
    Disable-Hash

SYNTAX
    Disable-Hash [-Hash] {SHA | MD5} [[-ComputerName] <string>]  [<CommonParameters>]


ALIASES
    None


REMARKS
    None

```
###### Disable-Protocol
```
NAME
    Disable-Protocol

SYNTAX
    Disable-Protocol [-Protocol] {TLS 1.2 | PCT 1.0 | SSL 2.0 | TLS 1.1 | SSL 3.0 | TLS 1.0} [[-Client]] [[-ComputerName] <string>]  [<CommonParameters>]


ALIASES
    None


REMARKS
    None

```
###### Enable-Cipher
```
NAME
    Enable-Cipher

SYNTAX
    Enable-Cipher [-Cipher] {NULL | Triple DES 168/168 | RC2 128/128 | AES 256/256 | RC2 56/128 | RC2 40/128 | RC4 40/128 | RC4 56/128 | RC4 64/128 | AES 128/128 | RC4 128/128 | DES 56/56} [[-ComputerName]
    <string>]  [<CommonParameters>]


ALIASES
    None


REMARKS
    None

```
###### Enable-Hash
```
NAME
    Enable-Hash

SYNTAX
    Enable-Hash [-Hash] {SHA | MD5} [[-ComputerName] <string>]  [<CommonParameters>]


ALIASES
    None


REMARKS
    None

```
###### Enable-Protocol
```
NAME
    Enable-Protocol

SYNTAX
    Enable-Protocol [-Protocol] {TLS 1.2 | PCT 1.0 | SSL 2.0 | TLS 1.1 | SSL 3.0 | TLS 1.0} [[-Client]] [[-ComputerName] <string>]  [<CommonParameters>]


ALIASES
    None


REMARKS
    None

```
###### Get-Cipher
```
NAME
    Get-Cipher

SYNTAX
    Get-Cipher [-Cipher] {NULL | Triple DES 168/168 | RC2 128/128 | AES 256/256 | RC2 56/128 | RC2 40/128 | RC4 40/128 | RC4 56/128 | RC4 64/128 | AES 128/128 | RC4 128/128 | DES 56/56} [[-ComputerName]
    <string>]  [<CommonParameters>]


ALIASES
    None


REMARKS
    None

```
###### Get-Hash
```
NAME
    Get-Hash

SYNTAX
    Get-Hash [-Hash] {SHA | MD5} [[-ComputerName] <string>]  [<CommonParameters>]


ALIASES
    None


REMARKS
    None

```
###### Get-Protocol
```
NAME
    Get-Protocol

SYNTAX
    Get-Protocol [-Protocol] {TLS 1.2 | PCT 1.0 | SSL 2.0 | TLS 1.1 | SSL 3.0 | TLS 1.0} [[-Client]] [[-ComputerName] <string>]  [<CommonParameters>]


ALIASES
    None


REMARKS
    None

```
###### New-Cipher
```
NAME
    New-Cipher

SYNTAX
    New-Cipher [-Cipher] {NULL | Triple DES 168/168 | RC2 128/128 | AES 256/256 | RC2 56/128 | RC2 40/128 | RC4 40/128 | RC4 56/128 | RC4 64/128 | AES 128/128 | RC4 128/128 | DES 56/56} [[-ComputerName]
    <string>]  [<CommonParameters>]


ALIASES
    None


REMARKS
    None

```
###### New-Hash
```
NAME
    New-Hash

SYNTAX
    New-Hash [-Hash] {SHA | MD5} [[-ComputerName] <string>]  [<CommonParameters>]


ALIASES
    None


REMARKS
    None

```
###### New-Protocol
```
NAME
    New-Protocol

SYNTAX
    New-Protocol [-Protocol] {TLS 1.2 | PCT 1.0 | SSL 2.0 | TLS 1.1 | SSL 3.0 | TLS 1.0} [[-Client]] [[-ComputerName] <string>]  [<CommonParameters>]


ALIASES
    None


REMARKS
    None
    
```
###### Remove-Cipher
```
NAME
    Remove-Cipher

SYNTAX
    Remove-Cipher [-Cipher] {NULL | Triple DES 168/168 | RC2 128/128 | AES 256/256 | RC2 56/128 | RC2 40/128 | RC4 40/128 | RC4 56/128 | RC4 64/128 | AES 128/128 | RC4 128/128 | DES 56/56} [[-ComputerName]
    <string>]  [<CommonParameters>]


ALIASES
    None


REMARKS
    None

```
###### Remove-Hash
```
NAME
    Remove-Hash

SYNTAX
    Remove-Hash [-Hash] {SHA | MD5} [[-ComputerName] <string>]  [<CommonParameters>]


ALIASES
    None


REMARKS
    None

```
###### Remove-Protocol
```
NAME
    Remove-Protocol

SYNTAX
    Remove-Protocol [-Protocol] {TLS 1.2 | PCT 1.0 | SSL 2.0 | TLS 1.1 | SSL 3.0 | TLS 1.0} [[-Client]] [[-ComputerName] <string>]  [<CommonParameters>]


ALIASES
    None


REMARKS
    None

```
###### Test-Cipher
```
NAME
    Test-Cipher

SYNTAX
    Test-Cipher [-Cipher] {NULL | Triple DES 168/168 | RC2 128/128 | AES 256/256 | RC2 56/128 | RC2 40/128 | RC4 40/128 | RC4 56/128 | RC4 64/128 | AES 128/128 | RC4 128/128 | DES 56/56} [[-ComputerName]
    <string>]  [<CommonParameters>]


ALIASES
    None


REMARKS
    None

```
###### Test-Hash
```
NAME
    Test-Hash

SYNTAX
    Test-Hash [-Hash] {SHA | MD5} [[-ComputerName] <string>]  [<CommonParameters>]


ALIASES
    None


REMARKS
    None

```
###### Test-Protocol
```
NAME
    Test-Protocol

SYNTAX
    Test-Protocol [-Protocol] {TLS 1.2 | PCT 1.0 | SSL 2.0 | TLS 1.1 | SSL 3.0 | TLS 1.0} [[-Client]] [[-ComputerName] <string>]  [<CommonParameters>]


ALIASES
    None


REMARKS
    None
```
# Resources
[Microsoft SCHANNEL Support](https://support.microsoft.com/en-us/help/245030/how-to-restrict-the-use-of-certain-cryptographic-algorithms-and-protocols-in-schannel.dll)

[Nartac IISCrypto](https://www.nartac.com/Products/IISCrypto)
