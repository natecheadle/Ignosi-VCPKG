vcpkg_from_github(
  OUT_SOURCE_PATH
  SOURCE_PATH
  REPO
  natecheadle/Ignosi-Memory
  REF
  34fa4de56a69e8eeb310ee358e5d7c599f40703b
  SHA512
  1eb2de765e8aba14cb07671b98f825f47580375b33334c6e127b7f1b60fe8c01fea76fffe1870f12dbe00ec8c85510b7706ac8757b7f7186044a407830a821fb
  HEAD_REF
  master)

vcpkg_cmake_configure(SOURCE_PATH "${SOURCE_PATH}" OPTIONS -DBUILD_TESTS=FALSE)
vcpkg_cmake_install()
vcpkg_copy_pdbs()

file(INSTALL "${CMAKE_CURRENT_LIST_DIR}/usage"
     DESTINATION "${CURRENT_PACKAGES_DIR}/share/${PORT}")

file(RENAME ${CURRENT_PACKAGES_DIR}/share/ignosi-memory/LICENSE
     ${CURRENT_PACKAGES_DIR}/share/ignosi-memory/copyright)
file(GLOB CMAKE_EXPORT_FILES_IGNOSI_MEMORY
     "${CURRENT_PACKAGES_DIR}/lib/cmake/ignosi-memory/*")
file(GLOB CMAKE_EXPORT_FILES_IGNOSI_MEMORY_DEBUG
     "${CURRENT_PACKAGES_DIR}/debug/lib/cmake/ignosi-memory/*")

file(COPY ${CMAKE_EXPORT_FILES_IGNOSI_MEMORY}
     DESTINATION ${CURRENT_PACKAGES_DIR}/share/ignosi-memory/cmake)
file(COPY ${CMAKE_EXPORT_FILES_IGNOSI_MEMORY_DEBUG}
     DESTINATION ${CURRENT_PACKAGES_DIR}/share/ignosi-memory/cmake)

vcpkg_cmake_config_fixup()

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/share")
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/lib/cmake")
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/lib/cmake")
