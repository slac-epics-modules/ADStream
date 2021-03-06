# MonoBin4Viewer.cmd
# This script creates, configures, and loads db records for one
# monochrome viewer w/ 4x4 binning

# Configure the plugins
NDROIConfigure(          "THUMBNAIL:ROI", $(QSIZE), 0, "$(CAM_PORT)", 0 )
NDColorConvertConfigure( "THUMBNAIL:CC",  $(QSIZE), 0, "$(CAM_PORT)", 0 )
NDStdArraysConfigure(    "THUMBNAIL",     $(QSIZE), 0, "$(CAM_PORT)", 0, -1 )

# Load the image stream records
dbLoadRecords( "db/thumbnailStream.db",  "CAM=$(CAM_PV),CAM_PORT=$(CAM_PORT),PLUGIN_SRC=$(PLUGIN_SRC),IMAGE_NAME=THUMBNAIL,IMAGE_NELM=$(IMAGE_NELM)" )

# Temporary for backward compatibility
NDROIConfigure( "ROI7", $(QSIZE), 0, "$(CAM_PORT)", 0 )
dbLoadRecords(  "db/pluginROI.db",  "CAM=$(CAM_PV),CAM_PORT=$(CAM_PORT),PLUGIN_SRC=$(PLUGIN_SRC),N=7" )

