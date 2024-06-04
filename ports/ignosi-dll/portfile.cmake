vcpkg_from_github(
  OUT_SOURCE_PATH
  SOURCE_PATH
  REPO
  natecheadle/Ignosi-DLL
  REF
  cda9ea95132d1ff34a6461f7eda3f32db0b1c470
  SHA512
  47af18c94305e55bd0a78a3c1f74bb14133e12d37b270c1141ca4116070fedd47aa6b29b49ef4c9dcefdb541e15b8a08bffab8764ee8c2954ca279e5848b735d
  HEAD_REF
  master)

vcpkg_cmake_configure(SOURCE_PATH "${SOURCE_PATH}" OPTIONS -DBUILD_TESTS=FALSE)
vcpkg_cmake_install()
vcpkg_cmake_config_fixup(PACKAGE_NAME ignosi-dll)
vcpkg_copy_pdbs()

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug")
file(RENAME ${CURRENT_PACKAGES_DIR}/share/ignosi-dll/LICENSE
     ${CURRENT_PACKAGES_DIR}/share/ignosi-dll/copyright)
