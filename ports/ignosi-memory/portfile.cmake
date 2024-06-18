vcpkg_from_github(
  OUT_SOURCE_PATH
  SOURCE_PATH
  REPO
  natecheadle/Ignosi-Memory
  REF
  7fd27c91a2a50a2a37b348c754886d4bfe72fa0b
  SHA512
  85c8fe213311f599bc167a14acc1189c62f365adbbae27a3e9285938d505d768a7efac3cdd909625f3db1ecb6080f92fae1ba53bc12229eebdf0e7391be18189
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
