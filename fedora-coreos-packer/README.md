bash


jq '.architectures.x86_64.artifacts.metal.formats as $formats |
  ($formats["iso"].disk | {
    iso_url: .location,
    iso_checksum: .sha256,
    ignition_url: "https://raw.githubusercontent.com/iquiw/packer-fedora-coreos/master/ignition.cfg",
  }) + {
    raw_url: $formats["raw.xz"].disk.location
  }' https://raw.githubusercontent.com/coreos/fedora-coreos-streams/cf839b16069ff024bd56652069bc9e87d244e4e3/streams/stable.json