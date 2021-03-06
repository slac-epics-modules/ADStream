#
# pluginTIFF.cmd
#
# Required env vars
#	CAM			- PV Prefix for all camera related PV's
#	N			- Plugin number, must be unique if more than one TIFF plugin
#	PLUGIN_SRC	- Which port should this plugin get its data from

# Configure the plugin
# NDFileTIFFConfigure( portName, queueSize, blockingCallbacks, dataSrcPortName, addr, priority, stackSize )
# Set priority   to 0  for default priority
# Set stackSize  to 0  for default stackSize
NDFileTIFFConfigure( "TIFF$(N)", $(QSIZE), 0, "$(PLUGIN_SRC)", 0 )

# Load the plugin records
dbLoadRecords( "db/pluginTIFF.db",  "CAM=$(CAM_PV),CAM_PORT=$(CAM_PORT),PLUGIN_SRC=$(PLUGIN_SRC),N=$(N)" )
