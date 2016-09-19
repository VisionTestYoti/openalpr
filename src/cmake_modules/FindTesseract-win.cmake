# - Try to find Tesseract-OCR
# Once done, this will define
#
#  Tesseract_FOUND - system has Tesseract
#  Tesseract_INCLUDE_DIRS - the Tesseract include directories
#  Tesseract_LIBRARIES - link these to use Tesseract

include(LibFindMacros)

# Use pkg-config to get hints about paths
#libfind_pkg_check_modules(Tesseract_PKGCONF Tesseract)

# Include dir
find_path(Tesseract_INCLUDE_BASEAPI_DIR
  NAMES tesseract/baseapi.h
  HINTS "/usr/include"
        "/usr/include/tesseract"
        "/usr/local/include"
        "/usr/local/include/tesseract"
        "/opt/local/include"
        "/opt/local/include/tesseract"
        ${Tesseract_PKGCONF_INCLUDE_DIRS}
		${CMAKE_SOURCE_DIR}/../libraries/tesseract-ocr/api/
		"C:\\Users\\longzhen.li\\Downloads\\tesseract-3.02.02-win32-lib-include-dirs\\include\\"
)
find_path(Tesseract_INCLUDE_CCSTRUCT_DIR
  NAMES publictypes.h
  HINTS "/usr/include"
        "/usr/include/tesseract"
        "/usr/local/include"
        "/usr/local/include/tesseract"
        "/opt/local/include"
        "/opt/local/include/tesseract"
        ${Tesseract_PKGCONF_INCLUDE_DIRS}
		${CMAKE_SOURCE_DIR}/../libraries/tesseract-ocr/ccstruct/
		"C:\\Users\\longzhen.li\\Downloads\\tesseract-3.02.02-win32-lib-include-dirs\\include\\tesseract"
)
find_path(Tesseract_INCLUDE_CCMAIN_DIR
  NAMES thresholder.h
  HINTS "/usr/include"
        "/usr/include/tesseract"
        "/usr/local/include"
        "/usr/local/include/tesseract"
        "/opt/local/include"
        "/opt/local/include/tesseract"
        ${Tesseract_PKGCONF_INCLUDE_DIRS}
		${CMAKE_SOURCE_DIR}/../libraries/tesseract-ocr/ccmain/
		"C:\\Users\\longzhen.li\\Downloads\\tesseract-3.02.02-win32-lib-include-dirs\\include\\tesseract"
)
find_path(Tesseract_INCLUDE_CCUTIL_DIR
  NAMES platform.h
  HINTS "/usr/include"
        "/usr/include/tesseract"
        "/usr/local/include"
        "/usr/local/include/tesseract"
        "/opt/local/include"
        "/opt/local/include/tesseract"
        ${Tesseract_PKGCONF_INCLUDE_DIRS}
		${CMAKE_SOURCE_DIR}/../libraries/tesseract-ocr/ccutil/
		"C:\\Users\\longzhen.li\\Downloads\\tesseract-3.02.02-win32-lib-include-dirs\\include\\tesseract"
)


# Finally the library itself
find_library(Tesseract_LIB
  NAMES tesseract tesseract-static libtesseract304-static libtesseract304 libtesseract304-static-debug
  HINTS "/usr/lib"
        "/usr/local/lib"
        "/opt/local/lib"
        ${Tesseract_PKGCONF_LIBRARY_DIRS}
		${CMAKE_SOURCE_DIR}/../libraries/tesseract-ocr/api/.libs
		${CMAKE_SOURCE_DIR}/../libraries/tesseract-ocr/vs2010/LIB_Release
		# "C:\\Users\\longzhen.li\\Downloads\\tesseract-3.02.02-win32-lib-include-dirs\\lib"
)

find_library(Leptonica_LIB
  NAMES liblept170 liblept lept liblept171
  HINTS "/usr/lib"
        "/usr/local/lib"
        "/opt/local/lib"
        ${Tesseract_PKGCONF_LIBRARY_DIRS}
		${CMAKE_SOURCE_DIR}/../libraries/tesseract-ocr/api/.libs
		${CMAKE_SOURCE_DIR}/../libraries/tesseract-ocr/vs2010/LIB_Release
)

# set(Tesseract_INCLUDE_DIRS "C:\\Users\\longzhen.li\\Downloads\\tesseract-3.02.02-win32-lib-include-dirs\\include\\tesseract")
# set(Tesseract_FOUND 1)
# Set the include dir variables and the libraries and let libfind_process do the rest.
# NOTE: Singular variables for this library, plural for libraries this this lib depends on.
set(Tesseract_PROCESS_INCLUDES 
    Tesseract_INCLUDE_BASEAPI_DIR 
	Tesseract_INCLUDE_CCSTRUCT_DIR
	Tesseract_INCLUDE_CCMAIN_DIR
	Tesseract_INCLUDE_CCUTIL_DIR
	Tesseract_INCLUDE_DIRS)
set(Tesseract_PROCESS_LIBS Tesseract_LIB Leptonica_LIB Tesseract_LIBRARIES)
# message(WARNING "Before libfind_process")
libfind_process(Tesseract)
# message(WARNING "After libfind_process")
# message(WARNING ${Tesseract_LIB})
# message(WARNING ${Leptonica_LIB})
message(WARNING ${Tesseract_LIBRARIES})