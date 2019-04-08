mkdir build
cd build

set "CFLAGS= "
set "CXXFLAGS= "
set "LDFLAGS_SHARED= ucrt.lib"

cmake -G "Ninja" ^
      -D BUID_WITH_CONDA:BOOL=ON ^
      -D CMAKE_BUILD_TYPE=Release ^
      -D FREECAD_LIBPACK_USE:BOOL=OFF ^
      -D CMAKE_INSTALL_PREFIX:FILEPATH=%LIBRARY_PREFIX% ^
      -D CMAKE_PREFIX_PATH:FILEPATH=%LIBRARY_PREFIX% ^
      -D CMAKE_INCLUDE_PATH:FILEPATH=%LIBRARY_PREFIX%/include ^
      -D CMAKE_LIBRARY_PATH:FILEPATH=%LIBRARY_PREFIX%/lib ^
      -D BUILD_QT5:BOOL=ON ^
      -D BUILD_FEM_NETGEN:BOOL=%BUILD_WITH_NETGEN% ^
      -D NETGENDATA:FILEPATH=%LIBRARY_PREFIX%/include/netgen ^
      -D NGLIB_INCLUDE_DIR:FILEPATH=%LIBRARY_PREFIX%/include/netgen ^
      -D SMESH_INCLUDE_DIR:FILEPATH=%LIBRARY_PREFIX%/include/smesh ^
      -D FREECAD_USE_EXTERNAL_SMESH:BOOL=ON ^
      -D OCC_INCLUDE_DIR:FILEPATH=%LIBRARY_PREFIX%/include/opencascade ^
      -D OCC_LIBRARY_DIR:FILEPATH=%LIBRARY_PREFIX%/lib ^
      -D OCC_LIBRARIES:FILEPATH=%LIBRARY_PREFIX%/lib ^
      -D OCC_OCAF_LIBRARIES:FILEPATH=%LIBRARY_PREFIX%/lib ^
      -D OCCT_CMAKE_FALLBACK:BOOL=ON ^
      -D FREECAD_USE_OCC_VARIANT="Official Version" ^
      -D SWIG_DIR:FILEPATH=%LIBRARY_PREFIX%/share/swig/3.0.8 ^
      -D SWIG_EXECUTABLE:FILEPATH=%LIBRARY_PREFIX%/bin/swig ^
      -D BUILD_REVERSEENGINEERING:BOOL=OFF ^
      -D USE_BOOST_PYTHON:BOOL=OFF ^
      -D FREECAD_USE_PYBIND11:BOOL=ON ^
      -D BUILD_FLAT_MESH:BOOL=ON ^
      -D BUILD_PLOT:BOOL=OFF ^
      -D BUILD_SHIP:BOOL=OFF ^
      -D PYTHON_EXECUTABLE:FILEPATH=%PREFIX%/python ^
      ..

if errorlevel 1 exit 1
ninja install
if errorlevel 1 exit 1

rmdir /s /q "%LIBRARY_PREFIX%\doc"
