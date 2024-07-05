vcpkg_from_github(
  OUT_SOURCE_PATH
  SOURCE_PATH
  REPO
  natecheadle/Ignosi-Memory
  REF
  430b0cb39fd8591289222a5f692dbdc3b6203f98
  SHA512
  72a57618bbb9e8100cd4e44db166f36dc1dc0b5ceb58a9510b9da57b850b5b572d929784ca8350b82084d3c6afad46b072a8ea095cc1c1fbbf6d3fe6f1679cbc
  HEAD_REF
  master)

vcpkg_cmake_configure(SOURCE_PATH "${SOURCE_PATH}" OPTIONS -DBUILD_TESTS=FALSE)
vcpkg_cmake_install()
vcpkg_copy_pdbs()

file(INSTALL "${CMAKE_CURRENT_LIST_DIR}/usage"
     DESTINATION "${CURRENT_PACKAGES_DIR}/share/${PORT}")

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/share")

file(
  INSTALL "${SOURCE_PATH}/LICENSE"
  DESTINATION "${CURRENT_PACKAGES_DIR}/share/${PORT}"
  RENAME copyright)
