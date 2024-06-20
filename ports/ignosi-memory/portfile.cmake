vcpkg_from_github(
  OUT_SOURCE_PATH
  SOURCE_PATH
  REPO
  natecheadle/Ignosi-Memory
  REF
  aaea88d71997a6678b935b0c265148e6fb648571
  SHA512
  7017a0e12a8b5e20235cc18dcb559cefdc81720aebe6d41f3527460b73e354932977897253c2b0030fa5fb0d778729f52ee6dbcc98b565235bd4b75e7039cfa3
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
