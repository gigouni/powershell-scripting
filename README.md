# Powershell scripting

A bunch of Powershell scripts to handle several cases

## Getting started

Clone the project

```shell
$ git clone https://github.com/gigouni/powershell-scripting
```

Run the scripts by clicking directly on it or by running the script in a Powershell terminal

## Running the tests

_Dude, it's just Powershell scripts..._

## Deployment

Just take the script content and run it. Can it be even more simple?

## For Windows [(virtual machines)](https://developer.microsoft.com/en-us/microsoft-edge/tools/vms/)

__From the installation step 01__

Download these scripts or just copy the content of the script you need to. 
By example, you can clone the scripts, compress it and drag&drop into the VM (for WS -> WS only)

To run the scripts (if you run the whole script, without copy/paste the content in one of your script), follow the next steps

* Run Powershell as an Administrator
* To be able to run unsigned scripts, run this command and respond Yes (for all)

```shell
$ # Violent, but effective
$ Set-ExecutionPolicy Bypass
```

To understand why using _Bypass_ execution policy, follow [this technical note](https://4sysops.com/archives/powershell-bypass-executionpolicy-to-run-downloaded-scripts/). 
You can avoid it too by manually creating the script files. Thereby, the scripts won't need to have the "remote unsigned" authorization 

### Small VM improvements

#### Locale

If you're locale ain't the good one, go to _Settings_, 

* In _Date & Time_, change your timezone
* In _Region & language_, change your region and add your locale langage (remove the default one)

After some seconds (time for locale download and installation), your correct locale will be working like a charm

#### Boot loading

You can prevent useless start services by taping _msconfig_ in the Windows search bar. In the _Start_ tab, disable services like OneDrive, useless in our case.

#### Clipboard

Do not hesitate to share the clipboards between the host and the VM. To do it, with Virtual Box by exemple, you won't even need to shutdown your VM, just go 
to _Settings_, _General_, then _Advanced_. Set the _Shared clipboard_ value to _bidirectional_


## Contributing

No contributions necessary.

## Authors

**Nicolas GIGOU** - _Initial work_ - Gigouni

No other contributors
