#DosBox

Settings to have Dosbox Working fine
The configuration file is in ~/.dosbox-0.74.conf

## keyboard

To enable the dvorak keyboard distribution, the line used was

`keyboardlayout=dv103`

## Drives

create the folder drives inside .dosbox
and add the mount lines to autoexec

```
MOUNT A ~/.dosbox/drives/a
MOUNT C ~/.dosbox/drives/c
C:/
```

## Install windows 3.1

downlad the files and put it on c driver folder

add `windows.bat` to autorun