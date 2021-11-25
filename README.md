# genshin-wishes-getlink
*Based on MadeBaruna's [getlink gist](https://gist.github.com/MadeBaruna/1d75c1d37d19eca71591ec8a31178235)*

# How to use it ?

## Europe / America / Asia (Outside Mainland China)
1. Open Genshin Impact on your PC
2. Then go to the wish history page and wait it to load
3. Go back to Windows
4. In the start menu search for "Powershell" and open "Windows Powershell"
5. Then copy the following code and paste it in the Powershell window
```jsx
iex ((New-Object System.Net.WebClient).DownloadString('https://raw.githubusercontent.com/genshin-wishes/genshin-wishes-getlink/main/global.ps1'));
```
6. Hit ENTER then a link will be copied to your clipboard
7. Paste the link on genshin-wishes.com to synchronise your wishes

## Mainland China
1. Open Genshin Impact on your PC
2. Then go to the wish history page and wait it to load
3. Go back to Windows
4. In the start menu search for "Powershell" and open "Windows Powershell"
5. Then copy the following code and paste it in the Powershell window
```jsx
iex ((New-Object System.Net.WebClient).DownloadString('https://raw.githubusercontent.com/genshin-wishes/genshin-wishes-getlink/main/mainland-china.ps1'));
```
6. Hit ENTER then a link will be copied to your clipboard
7. Paste the link on genshin-wishes.com to synchronise your wishes