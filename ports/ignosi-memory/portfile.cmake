vcpkg_from_github(
  OUT_SOURCE_PATH
  SOURCE_PATH
  REPO
  natecheadle/Ignosi-Memory
  REF
  4baf91dbda3b129bd2a574b77548fe3e3b0d2cf0
  SHA512
  76e8986e25a93b9e2b99ab5c2e0cd757b15fe4b5f7a89250c23939573e096dd0a243d599186b4389a0b0e7759bc7fcc70b17362770e9c9ce1d9b13a7e6d9e174
  HEAD_REF
  master)

vcpkg_cmake_configure(SOURCE_PATH "${SOURCE_PATH}" OPTIONS -DBUILD_TESTS=FALSE)
vcpkg_cmake_install()
vcpkg_cmake_config_fixup(PACKAGE_NAME ignosi-memory)
vcpkg_copy_pdbs()

file(INSTALL "${CMAKE_CURRENT_LIST_DIR}/usage"
     DESTINATION "${CURRENT_PACKAGES_DIR}/share/${PORT}")

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/share/")
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")
file(RENAME ${CURRENT_PACKAGES_DIR}/share/ignosi-memory/LICENSE
     ${CURRENT_PACKAGES_DIR}/share/ignosi-memory/copyright)
