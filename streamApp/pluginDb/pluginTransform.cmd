#
# pluginTransform.cmd
#
# Required env vars
#	CAM			- PV Prefix for all camera related PV's
#	N			- Plugin number, must be unique if more than one Trans plugin
#	PLUGIN_SRC	- Which port should this plugin get its data from

# Configure the plugin
# NDTransformConfigure( portName, queueSize, blockingCallbacks, dataSrcPortName, addr, maxBuffers, maxMemory, priority, stackSize )
# Set maxBuffers to 0 for unlimited buffers
# Set maxMemory  to 0 for unlimited memory allocation
# Set priority   to 0  for default priority
# Set stackSize  to 0  for default stackSize
NDTransformConfigure( "Trans$(N)", $(QSIZE), 0, "$(PLUGIN_SRC)", 0 )

# Load the plugin records
dbLoadRecords( "db/pluginTransform.db",  "CAM=$(CAM_PV),CAM_PORT=$(CAM_PORT),PLUGIN_SRC=$(PLUGIN_SRC),N=$(N)" )
