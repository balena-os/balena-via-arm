deviceTypesCommon = require 'resin-device-types/common'
{ networkOptions, commonImg, instructions } = deviceTypesCommon

BOARD_SHUTDOWN_VIA = 'The device is performing a shutdown. Please wait until the device is offline in the dashboard and disconnect the power cable.'
SET_JUMPER_SD = 'Set J11 (just next to the micro SD card slot) to position 2-3 (the position furthest away from the edge of the board) and then power on the board.'
SET_JUMPER_EMMC = 'Set J11 (just next to the micro SD card slot) to position 1-2 (the position closest to the edge of the board).'

module.exports =
	slug: 'via-vab820-quad'
	aliases: [ 'vab820-quad' ]
	name: 'VIA VAB 820-quad'
	arch: 'armv7hf'
	state: 'preview'

	stateInstructions:
		postProvisioning: [
			BOARD_SHUTDOWN_VIA
			instructions.REMOVE_INSTALL_MEDIA
			SET_JUMPER_EMMC
			instructions.BOARD_REPOWER
		]

	instructions:
		windows: [
			instructions.WINDOWS_DISK_IMAGER_SD
			instructions.EJECT_SD
			instructions.FLASHER_WARNING
			SET_JUMPER_SD
			BOARD_SHUTDOWN_VIA
			instructions.REMOVE_INSTALL_MEDIA
			SET_JUMPER_EMMC
			instructions.BOARD_REPOWER
		]
		osx: [
			instructions.OSX_PLUG_SD
			instructions.OSX_UNMOUNT_SD
			instructions.DD_BURN_IMAGE_SD
			instructions.EJECT_SD
			instructions.FLASHER_WARNING
			SET_JUMPER_SD
			BOARD_SHUTDOWN_VIA
			instructions.REMOVE_INSTALL_MEDIA
			SET_JUMPER_EMMC
			instructions.BOARD_REPOWER
		]
		linux: [
			instructions.LINUX_DF_SD
			instructions.DD_BURN_IMAGE_SD
			instructions.EJECT_SD
			instructions.FLASHER_WARNING
			SET_JUMPER_SD
			BOARD_SHUTDOWN_VIA
			instructions.REMOVE_INSTALL_MEDIA
			SET_JUMPER_EMMC
			instructions.BOARD_REPOWER
		]

	gettingStartedLink:
		windows: 'http://docs.resin.io/#/pages/installing/gettingStarted-VIA-VAB820.md#windows'
		osx: 'http://docs.resin.io/#/pages/installing/gettingStarted-VIA-VAB820.md#on-mac-and-linux'
		linux: 'http://docs.resin.io/#/pages/installing/gettingStarted-VIA-VAB820.md#on-mac-and-linux'

	supportsBlink: false

	yocto:
		machine: 'vab820-quad'
		image: 'resin-image-flasher'
		fstype: 'resin-sdcard'
		version: 'yocto-jethro'
		deployArtifact: 'resin-image-flasher-vab820-quad.resin-sdcard'

	options: [ networkOptions.group ]

	configuration:
		config:
			partition:
				primary: 4
				logical: 1
			path: '/config.json'

	initialization: commonImg.initialization
